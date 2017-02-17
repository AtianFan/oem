/**
 * 
 */
var Utils = {
	coverImg:function(images){
		images.each(function(index,el){
			var $parent = $(el).parent(),
			width = $parent.width,height = $parent.height,p=width/height
			src = el.src;
			var image = new Image();
			image.src=src;
			image.srcImage = el;
			image.$parent = $parent;
			image.onload = function(){
				var real_width = this.width,real_height=this.height,real_p = real_width/real_height,
					width = this.$parent.width(),height = this.$parent.height(),p=width/height;
				if(real_p<p){
					$(this.srcImage).width("100%");
					$(this.srcImage).height("auto");
					var cal_height = width/real_p-height;
					$(this.srcImage).css("marginTop",-1*cal_height/2+"px");
				}else{
					$(this.srcImage).height("100%");
					$(this.srcImage).width("auto");
					var cal_width = height*real_p-width;
					$(this.srcImage).css("marginLeft",-1*cal_width/2+"px");
				}
			}
		});
	},
	ajaxFile : function(option) {
		var formData = option.formData;
		$.each(option.data, function(index, el) {
			formData.append(index, el);
		});
		option.data = formData;
		option.processData = false;
		/**   
		 *必须false才会自动加上正确的Content-Type   
		 */
		option.contentType = false;
		return $.ajax(option);
	},
	ignoreList:["loadCurrentUser"],
	ajax : function(option) {
		var data = {},$dfd = $.Deferred();//Deferred
		data.createTime = new Date().getTime();
		if (localStorage.userId && localStorage.accessToken) {
			data.userId = localStorage.userId;
			data.accessToken = localStorage.accessToken;
		}
		option.data = $.extend({}, option.data, data);
		option.data = {
			requestList : JSON.stringify(option.data)
		};
		option.type = "post";
		if (option.formData) {
			return utils.ajaxFile(option);
		}
		var url = option.url;
		$.ajax(option).done(function(resp){
			if(resp.retcode!=0 && url.indexOf("loadCurrentUser")===-1){
				alert(resp.retmsg);
				$dfd.reject(resp);
			}else{
				$dfd.resolve(resp);
			}
		}).fail(function(resp){
			$dfd.reject(resp);
		});
		return $dfd;
	},
	replaceObject : function(str, obj, defaultValue) {
		if (!obj) {
			return str.replace(/\{(\w)*\}/g, "");
		}
		var names = Object.getOwnPropertyNames(obj);
		var value = str;
		for ( var key in names) {
			var name = names[key];
			var regExp = new RegExp("\{" + name + "\}", "g");
			value = value.replace(regExp, obj[name]);
		}
		return value.replace(/\{(\w)*\}/g, "");
	},
	dateToString : function(date, format) {
		var year = date.getFullYear(), month = date.getMonth() + 1, day = date
				.getDate(), hour = date.getHours(), minutes = date.getMinutes(), seconds = date
				.getSeconds();
		return format.replace(/yyyy/gi, year).replace(/MM/g, month).replace(
				/dd/gi, day).replace(/hh/gi, hour).replace(/mm/g, minutes)
				.replace(/ss/gi, seconds);
	},
	dateTimeToString : function(time, format) {
		function pares(s){
			return (s+"").length==1?"0"+s:s;
		};
		var date = new Date(time),year = date.getFullYear(), month = date.getMonth() + 1, day = date
				.getDate(), hour = date.getHours(), minutes = date.getMinutes(), seconds = date
				.getSeconds();
		return format.replace(/yyyy/gi, year).replace(/MM/g, pares(month)).replace(
				/dd/gi, pares(day)).replace(/hh/gi, pares(hour)).replace(/mm/g, pares(minutes))
				.replace(/ss/gi, pares(seconds));
	},
	getFileUrl:function(type){
		
	},
	/**
	 * 模板&数据
	 * @param template
	 * @param data
	 */
	renderData:function(template,data){
		var template = template || "", regExp = new RegExp(
				"\{[a-zA-Z0-9-_.]+\}", "g"), result = template.match(regExp), html = template,
				funcExp = new RegExp("javaScript\:[a-zA-Z_\.]+\\([^\\(\\)]+\\)","g"),
				resultHtml = "";
		for (var j = 0, rlen = result.length; j < rlen; j++) {
			var type = result[j], key = type.replace(/[{}]/g, ""),
					value = (data && data[key]),
					valueReg = new RegExp(type, 'g'),index=key.indexOf(".");
			if(index!==-1){
				var name = key.split(".");
				value = (data[name[0]] && data[name[0]][name[1]]);
				value = typeof value==="undefined"?"":value;
			}
			html = html.replace(valueReg, typeof value==="undefined"?"":value);
		}
		var funcResult = html.match(funcExp);
		if(funcResult){
			for(var i=0,len=funcResult.length;i<len;i++){
				var r = funcResult[i],
					value = eval(r);
				html = html.replace(r, typeof value==="undefined"?"":value);
			}
		}
		return html;
	},
	complierData:function(template,data){
		var reg = new RegExp("[=\\[\\]\\<\\>\\!\\&|()]+","g"),
			noNumber = new RegExp("^[^0-9-]","g"),
			str = template.split(reg),
			html = template,
			hasExec = [];
		for(var i=0,length=str.length;i<length;i++){
			noNumber.lastIndex = 0;
			var key = str[i];
			if(key && noNumber.test(key)&&hasExec.indexOf(key)==-1&&key.indexOf("data.")===-1&&key.indexOf("!data.")===-1){
				hasExec.push(key);
				data && (html = html.replace(new RegExp(key,''),"data."+key));
			}
		}
		return html; 
	},
	complier:function(template,data){
		template = template.replace(/\&amp;/g,"&");
		 var ifStartReg = new RegExp("\{@if[\\s]+[a-zA-Z0-9-_!><=&|.()]+\}","g"),
			ifEndReg = new RegExp("\{@/if}","g"),
//			ifReg = new RegExp("[\{]{1}@if[\\s]+[a-zA-Z0-9-_]+\}[^{][\\s\\S]+\{@/if}","g"),
			ifReg = new RegExp("[\{]{1}@if[\\s]+[a-zA-Z0-9-_!><=&|.()]+\}[^@]+\{@/if}","g"),
			html = template;
		var str = "{@if test}{@/if}",
			flag = false,
			flagName = null;
			result = template.match(ifReg);
		if(result){
			for(var i=0,len=result.length;i<len;i++){
				var r = result[i],
					startTagR = r.match(ifStartReg);
				if(startTagR && startTagR.length>0){
					flagName = startTagR[0].replace(/\{@if/g,"").replace(/\}/g,"").trim();
					/*var keyName = flagName.replace("!",""),
					value = flagName.replace(keyName,data[keyName]);*/
					var value = Utils.complierData(flagName,data);
					flag = eval(value);
				}
				if(!flag){
					html = html.replace(r,"");
				}
			}
			html = html.replace(ifStartReg,"").replace(ifEndReg,"");
		}
		return Utils.renderData(html, data);
	}
};