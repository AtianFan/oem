/**
 * 
 */
var Fields = ['id','loginName','status','type'];
var UserInfoPage = {
	template:'<div class="userinfo-control"><span>{name}:</span><label>{value}</label></div>',
//	fileTemplate:'<div class="info-control"><a href="{url}">{originName}</a></div>',
	receiveTemplate:'<div class="userinfo-control"><span>用户ID:{id}</span><span>用户名:{loginName}</span><span>用户状态:{loginName}</span><span>用户类型:{type}</span></div>',
	loadUserInfo:function(){
		Utils.ajax({
			url:basePath+"SysUser/userInfo.json",
			data:{userId:"1F69B3D54C2F95A014EA3CC131A34D5B"},
			type:"post",
			dataType:"json"
		}).done(function(resp){
			if(resp.retcode===0){
				var data = resp.data
				for(var key in Fields){
					var name = Fields[key],
					field = "user_"+name,
					value = data[name],
					html = UserInfoPage.template.replace(/\{name\}/g,i18n(field))
									  .replace(/\{value\}/g,value);
					$("#userInfo").append(html);
				}
			}
		});
	},
	detail:function(str){
		window.location.href='orderDetail.do?id='+str+'';
	}
};
$(function(){
	UserInfoPage.loadUserInfo();
});