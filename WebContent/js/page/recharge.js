var Recharge ={
	rechargeUrl:basePath+"TradeSystem/recharge.json",
	recharge:function(data){
		Utils.ajax({
			url:Recharge.rechargeUrl,
			data:data
		}).done(function(resp){
			if(resp.retcode==0){
				window.location.href=basePath+"Page/homePage";
			}
		});
	}	
}

$(function(){
	$("#rechargeBtn").click(function(){
		var data = $("#rechargeForm").parseKeyValue();
		Recharge.recharge(data);
	});
});