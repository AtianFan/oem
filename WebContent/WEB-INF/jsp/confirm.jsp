<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.confirm_mask{
		position: fixed;
		top:0;
		left:0;
		display: none;
		background-color: rgba(0,0,0,0.1);
	}
	.confirmDialog{
		position: fixed;
		top:50%;
		height: 50%;
		margin-top:-250px;
		margin-right:-250px;
		width: 500px;
		height: 500px;
	}
	.confirmDialog form{
	    margin: 200px;
	}
	.confirmDialog form,.confirmDialog textarea,.confirmDialog select {
		width: 500px;
	}
	.confirm_mask{
		width: 100%;
		height: 100%;
	}
</style>
<div  class="confirm_mask">
	<div class="confirmDialog">
		<form id="confirmDialog">
			<div>
				<label>类型</label> <select name="confirmStatus">
				<option value="1">确认</option>
				<option value="-1">拒绝</option>
					</select>
			</div>
			<div>
				<label>原因</label> 
				<textarea rows="3" cols="3" name="remark"></textarea>
			</div>
			<button type="button" onclick="OemGlobal.confirm()">提交</button>
			<button type="button" onclick="OemGlobal.back()">返回</button>
		</form>
</div>
</div>