package com.cishi.constant;

public enum TaskStatus {
	
	WAIT_FOR_VERIFY((byte)0,"待发布",false),
	VERITY_SUCCESS((byte)1,"已发布",false),
	VERITY_FAIL((byte)-1,"审核失败",false),
	IN_TALK((byte)2,"已经接单",true),
	START((byte)3,"开始",false),
	WAIT_FOR_MONEY((byte)4,"达到付款条件",true),
	PASY_MONEY_PARTLY((byte)5,"系统自动拨款",true),
	COMPLETE((byte)6,"完成全部任务",true),
	PARTLY_COMPLETE((byte)-6,"部分完成",true),
//	COMFIRM_OWN((byte)10,"一方确认"),
//	COMFIRM_OPERATOR((byte)11,"另一方确认"),
	FINISH((byte)7,"项目完成",true);
	
	private Byte code;
	private String name;
	private Boolean needConfirm;
	/**
	 * code表示id，数据库存储此字段，name描述字段 needConfirm此字段判断表示是否需要双方确认
	 * @param code
	 * @param name
	 * @param needConfirm
	 */
	private TaskStatus(Byte code,String name,Boolean needConfirm) {
		this.code = code;
		this.name = name;
		this.needConfirm = needConfirm;
	}
	public Byte getCode() {
		return code;
	}
	public void setCode(Byte code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getNeedConfirm() {
		return needConfirm;
	}
	public void setNeedConfirm(Boolean needConfirm) {
		this.needConfirm = needConfirm;
	}
	
	public static String getTaskStatusName(Byte id){
		for(TaskStatus ts:TaskStatus.values()){
			if(ts.getCode()==id){
				return ts.getName();
			}
		}
		return "";
	}
	
}
