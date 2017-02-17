define(function(require){
	"use strict";
	var View = require("View");
	return View.extend({
		addInput:function(option){
			var Input = require("widget/InputWidget");
			var input =  new Input(option,this.$el);
			this.add(input);
			return input;
		},
		addForm:function(option){
			var Form = require("widget/FormWidget");
			var form = new Form(option, this.$el);
			return this.add(form);
		},
		addUploadFile:function(option){
			var UploadWidget = require("widget/UploadWidget");
			var uploadFile = new UploadWidget(option);
			this.add(uploadFile);
			return uploadFile
		},
		getElement:function(){
			return this.$el;
		}
	});
});