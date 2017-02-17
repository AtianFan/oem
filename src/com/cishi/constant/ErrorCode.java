package com.cishi.constant;

public enum ErrorCode {
	SUCCESS(0,"请求成功"),
	VLIAD_SESSION_ERROR(899999,"会话错误，请重新登陆"),
	HASLOGIN_TRUE(899998,"用户名已经存在"),
	HASLOGIN_FALSE(899997,"用户名可以使用"),
	LOGIN_SUCCESS(899996,"登陆成功"),
	UPLOAD_FAIL(899995,"上传失败"),
	UPLOAD_SUCCESS(899994,"上传成功"),
	USERID_EMPTY(899993,"用户ID为空"),
	WAIT_FOR_REVIEW(899992,"请耐心等待管理员验证开通"),
	//WARNINGS
	DONE_NOTHING(700001,"没做啥事"),
	
	//接口错误
	PARAMS_ERROR(999996,"接口参数错误"),
	PARAMS_CAN_NOT_BE_NULL(999995,"输入内容不能为空!"),
	PARAMS_SHOULD_BE_NUMBER(999994,"params[?] should be number!"),
	DATABASE_FAIL(999993,"数据库操作失败!"),
	
//	ORDER_TASK_CONTROL_SHOULD_LOGIN(201005,"必须登陆才能操作"),
	
	//会话错误
	SESSION_ERROR(999999,"会话错误"),
	SHOULD_LOGIN(999997,"请先登录"),
	//数据库相关错误
	DATA_BASE_ERROR_CODE(999998,"数据库操作异常"),
	NO_RESULT_UPDATE(999996,"没有更新的记录"),
	//用户相关状态
	USER_AND_PASSWOD_NOT_NULL(101000,"用户名和密码不能为空"),
	//USER_NOT_FOUND(101001,"用户名不存在"),
	PASSWORD_ERROR(101001,"用户名或者密码错误"),
	USER_HAS_EXIST(101002,"用户已经存在"),
	USER_ID_CAN_NOT_BE_NULL(101003,"用户id不能为空"),
	USER_CAN_NOT_FOUND(101004,"用户不存在"),
	OLD_PASSWORD_IS_NOT_RIGHT(101005,"原密码错误"),
	TWO_NEW_PASSWORD_IS_NOT_SAME(101005,"两次密码不一致"),
	
	
	//任务相关状态
	ORDER_TASK_ID_CAN_NOT_BE_NULL(201000,"任务id不能为空"),
	ORDER_TASK_STATUS_IS_NOT_SUITABLE(201001,"任务状态不对"),
	CAN_NOT_FIND_OREDR_BY_ID(201002,"任务不存在"),
	CAN_NOT_RECEIVE_SELF(201003,"自己创建的任务不能自己接受"),
	CAN_NOT_BE_DELETED_OF_STATUS(201008,"任务不能删除，因为任务已经发布"),
	SON_CAN_NOT_BE_DELETED_OF_STATUS(201009,"子任务不能删除，因为任务已经发布"),
	ORDER_CAN_NOT_BE_FOUND_OR_CAN_NOT_FIND_LAUNCH_ID(201004,"找不到任务"),
	ORDER_TASK_HAS_BEEN_RECEIVE(201006,"任务已经被接单"),
	ORDER_NOT_RELEASE(201005,"项目未发布"),
	USEFULL_MONEY_IS_NOT_ENOUGH(201006,"创建任务失败，用户可用余额不足。"),
	USEFULL_MONEY_IS_NOT_ENOUGH_YIJIA(201007,"议价，用户可用余额不足。"),
	HAS_NO_AUTHIORITY(201010,"没有权限"),
	//注册字段属性判断是否合法
	EMAIL_ILLEGAL(301001,"邮箱不合法"),
	PHONENUMBER_ILLEGAL(301002,"电话号码不合法"),
	ADDRESS_ILLEGAL(301003,"身份证不合法"),
	//管理功能相关错误码
	DATA_EMTIY(401001,"用户数据为空"),
	USERID_EMTIY(401002,"删除用户的ID为空"),
	ADMIN_NO_DELETE(401003,"管理员不能删除"),
	//确认相关错误
	LOGIN_USER_NOT_EQUAL_TASK_LAUNCHERID(400001,"登录用户和当前任务发布用户不一致"),
	
	
	LOGIN_FAIL(-2,"登陆失败");
	
	private int retcode;
	private String retmsg;
	private ErrorCode(int retcode, String retmsg) {
		this.retcode = retcode;
		this.retmsg = retmsg;
	}
	public int getRetcode() {
		return retcode;
	}
	public String getRetmsg() {
		return retmsg;
	}
	public void setRetcode(int retcode) {
		this.retcode = retcode;
	}
	public void setRetmsg(String retmsg) {
		this.retmsg = retmsg;
	}
	
}
