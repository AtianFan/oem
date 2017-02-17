
define(function(require) {
	var ElementWidget = require("widget/ElementWidget"),
		iframeId = 0;
	window.uploadFileSuccess = function(iframeId){
		$("#iframe_"+iframeId).hide();
	}
	return ElementWidget.extend({
		beforeInit:function(option){
			iframeId ++;
			if(!option){
				option = {};
			}
			option.iframeId = iframeId;
		},
		template : [ '<iframe id="iframe_{iframeId}" height="37px" src="uploadFile.jsp?id={iframeId}" frameborder=0></iframe>' ].join(""),
		getEl:function(el){
			return el.find("form");
		},
		afterInit:function(){
		}
	});
});