define(function(require){
	"use stricts";
	var ElementWidget = require("widget/ElementWidget");
	return ElementWidget.extend({
		getEl:function(el){
			return el.find("input");
		},
		beforeInit:function(){
		},
		template:"<div class='ui-form-control'><span>{name}</span><input/></div>",
		afterInit:function(option){
		}
	});
});