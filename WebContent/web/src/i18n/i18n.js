define(function(require, exports) {
	"use stricts";
	var commonMessage = require("common_message.{language}.js");
	$.extend({
		i18n : {
			text : function(str) {
				return commonMessage[str] || str;
			}
		}
	});
});