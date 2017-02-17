define(function(require) {
	var View = function(option, $el) {
		this.beforeInit(option);
		this.init(option, $el);
		this.afterInit($el);
	}
	View.prototype = {
		template : "",
		beforeInit : function(option) {
		},
		getEl:function(el){
			return el || this.$el;
		},
		find:function(str){
			return this.$el.find(str);
		},
		init : function(option, $pEl) {
			this.option = option;
			this.$pEl = $pEl || $("body");
			this.value = Zqy.utils.replaceObject(this.template,option);
			this.$el = $(this.value);
			this.$pEl.append(this.$el);
			if (option && option.attrs) {
				this.getEl(this.$el).attr(option.attrs);
			}
			if (option && typeof option.click == "function") {
				this.$el.on("click", option.click);
			}
		},
		add : function(view) {
			this.$el.append(view.$el);
			return view;
		},
		afterInit : function(option) {

		},
		refresh : function() {
			this.init();
		}
		
	}
	View.extend = function(option){
		var pView = this;
		function ctl(option,$el){
			pView.call(this,option,$el);
		}
		ctl.prototype = $.extend(new pView(),option);
		ctl.prototype.parent = pView;
		ctl.constructor = ctl;
		ctl.extend = pView.extend;
		return ctl;
	}
	return View;
});
/*define(function(require) {
 var View = {};
 *//**
 * 扩展方法 继承
 * @param option
 */
/*
	View.extend = function(option) {
		function ctl(option,$el){
			this.beforeInit();
			this.init(option, $el);
			this.afterInit($el);
		}
		ctl.prototype = {
			template : "",
			beforeInit : function(option) {
			},
			init : function(option, $pEl) {
				this.option = option;
				this.$pEl = $pEl || $("body");
				this.$el = $(this.template);
				this.$pEl.append(this.$el);
				if (option && option.attrs) {
					this.$el.attr(option.attrs);
				}
				if(option && typeof option.click=="function"){
					this.$el.on("click",option.click);
				}
			},
			add : function(view) {
				this.$el.append(view.$el);
				return view;
			},
			afterInit : function(option) {

			},
			refresh : function() {
				this.init();
			}
		}
		$.extend(ctl.prototype, option);
		return ctl;
	};
	return View;
});*/