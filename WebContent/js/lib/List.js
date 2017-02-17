/**
 * dataList, $el元素节点 template模板
 */
var List = function(option) {
	$.extend(this, option);
	this.renderDataList();
};
List.prototype = {
	renderDataList : function(dataList) {
		if(typeof dataList!=="undefined"){
			this.dataList = dataList;
			this.$el.html("");
		}
		for ( var key in this.dataList) {
			this.renderData(this.dataList[key]);
		}
	},
	renderData : function(data, index) {
		var template = this.template || ""/*, regExp = new RegExp(
				"\{[a-zA-Z0-9-_]+\}", "g"), result = template.match(regExp), html = template,
				resultHtml = "";
		for (var j = 0, rlen = result.length; j < rlen; j++) {
			var type = result[j], key = type.replace(/[{}]/g, ""), value = (data && data[key])
					|| "", valueReg = new RegExp(type, 'g');
			html = html.replace(valueReg, value);
		}*/
		data.userId = this.userId || "";
		if(this.filter){
			data = this.filter(data);
		}
		if(!data.sysLauncherFile.fileUrl){
			data.hasLanuncherFile=false;
		}else{
			data.hasLanuncherFile=true;
		}
		this.$el.append(Utils.complier(template, data));
	}
}