seajs.config({
    base: ".",
    vars: {
        locale: "en"
    }
});
define("Zqy",["./base/Zqy"],function(require){
	return require("./base/Zqy");
});
define("base/utils",[],function(){
	var utils = {
		ajaxFile:function(option){
			var formData = option.formData;
			$.each(option.data,function(index,el){
				formData.append(index,el);
			});
			option.data = formData;
			option.processData = false;  
            /**   
             *必须false才会自动加上正确的Content-Type   
             */  
			option.contentType=false;
			return $.ajax(option);
		},
		ajax:function(option){
			var data = {};
			data.createTime = new Date().getTime();
			if(localStorage.userId && localStorage.accessToken){
				data.userId = localStorage.userId;
				data.accessToken = localStorage.accessToken;
			}
			option.data = $.extend({},option.data,data);
			option.data = {requestList:JSON.stringify(option.data)};
			if(option.formData){
				return utils.ajaxFile(option);
			}
			return $.ajax(option);
		},
		replaceObject:function(str,obj,defaultValue){
			if(!obj){
				return str.replace(/\{(\w)*\}/g,"");
			}
			var names = Object.getOwnPropertyNames(obj);
			var value = str;
			for(var key in names){
				var name = names[key];
				var regExp = new RegExp("\{"+name+"\}","g");
				value = value.replace(regExp,obj[name]);
			}
			return value.replace(/\{(\w)*\}/g,"");
		},
		dateToString:function(date,format){
			var year = date.getFullYear(),
				month = date.getMonth()+1,
				day = date.getDate(),
				hour = date.getHours(),
				minutes = date.getMinutes(),
				seconds = date.getSeconds();
			return format.replace(/yyyy/gi,year)
					      .replace(/MM/g,month)
					      .replace(/dd/gi,day)
					      .replace(/hh/gi,hour)
					      .replace(/mm/g,minutes)
					      .replace(/ss/gi,seconds);
		}
	}
	return utils;
});
define("base/Zqy",["./utils"],function(require,exports){	
	window.Zqy = exports;
	exports.utils = require("./utils");
});
