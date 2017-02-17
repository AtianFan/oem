define(function(require){
	var WindowManager  = {
		pushPage:function(pageName){
			seajs.use("page/"+pageName,function(){
				
			});
		}
	}
	return WindowManager;
});