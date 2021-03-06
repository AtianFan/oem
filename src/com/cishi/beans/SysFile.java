package com.cishi.beans;

import java.util.Date;

import com.cishi.util.DateUtil;
import com.cishi.util.GlobalContextUtil;

public class SysFile {

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.id
	 * @mbggenerated
	 */
	private String id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.file_name
	 * @mbggenerated
	 */
	private String fileName;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.create_date
	 * @mbggenerated
	 */
	private Date createDate;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.order_id
	 * @mbggenerated
	 */
	private String orderId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.user_id
	 * @mbggenerated
	 */
	private String userId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.type
	 * @mbggenerated
	 */
	private Byte type;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.del_flag
	 * @mbggenerated
	 */
	private Byte delFlag;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.info_obli_1
	 * @mbggenerated
	 */
	private String infoObli1;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.info_obli_2
	 * @mbggenerated
	 */
	private String infoObli2;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.info_obli_3
	 * @mbggenerated
	 */
	private String infoObli3;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.info_obli_4
	 * @mbggenerated
	 */
	private String infoObli4;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.name
	 * @mbggenerated
	 */
	private String name;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column sys_file.origin_name
	 * @mbggenerated
	 */
	private String originName;

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.id
	 * @return  the value of sys_file.id
	 * @mbggenerated
	 */
	public String getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.id
	 * @param id  the value for sys_file.id
	 * @mbggenerated
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.file_name
	 * @return  the value of sys_file.file_name
	 * @mbggenerated
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.file_name
	 * @param fileName  the value for sys_file.file_name
	 * @mbggenerated
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.create_date
	 * @return  the value of sys_file.create_date
	 * @mbggenerated
	 */
	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.create_date
	 * @param createDate  the value for sys_file.create_date
	 * @mbggenerated
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.order_id
	 * @return  the value of sys_file.order_id
	 * @mbggenerated
	 */
	public String getOrderId() {
		return orderId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.order_id
	 * @param orderId  the value for sys_file.order_id
	 * @mbggenerated
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.user_id
	 * @return  the value of sys_file.user_id
	 * @mbggenerated
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.user_id
	 * @param userId  the value for sys_file.user_id
	 * @mbggenerated
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.type
	 * @return  the value of sys_file.type
	 * @mbggenerated
	 */
	public Byte getType() {
		return type;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.type
	 * @param type  the value for sys_file.type
	 * @mbggenerated
	 */
	public void setType(Byte type) {
		this.type = type;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.del_flag
	 * @return  the value of sys_file.del_flag
	 * @mbggenerated
	 */
	public Byte getDelFlag() {
		return delFlag;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.del_flag
	 * @param delFlag  the value for sys_file.del_flag
	 * @mbggenerated
	 */
	public void setDelFlag(Byte delFlag) {
		this.delFlag = delFlag;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.info_obli_1
	 * @return  the value of sys_file.info_obli_1
	 * @mbggenerated
	 */
	public String getInfoObli1() {
		return infoObli1;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.info_obli_1
	 * @param infoObli1  the value for sys_file.info_obli_1
	 * @mbggenerated
	 */
	public void setInfoObli1(String infoObli1) {
		this.infoObli1 = infoObli1;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.info_obli_2
	 * @return  the value of sys_file.info_obli_2
	 * @mbggenerated
	 */
	public String getInfoObli2() {
		return infoObli2;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.info_obli_2
	 * @param infoObli2  the value for sys_file.info_obli_2
	 * @mbggenerated
	 */
	public void setInfoObli2(String infoObli2) {
		this.infoObli2 = infoObli2;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.info_obli_3
	 * @return  the value of sys_file.info_obli_3
	 * @mbggenerated
	 */
	public String getInfoObli3() {
		return infoObli3;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.info_obli_3
	 * @param infoObli3  the value for sys_file.info_obli_3
	 * @mbggenerated
	 */
	public void setInfoObli3(String infoObli3) {
		this.infoObli3 = infoObli3;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.info_obli_4
	 * @return  the value of sys_file.info_obli_4
	 * @mbggenerated
	 */
	public String getInfoObli4() {
		return infoObli4;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.info_obli_4
	 * @param infoObli4  the value for sys_file.info_obli_4
	 * @mbggenerated
	 */
	public void setInfoObli4(String infoObli4) {
		this.infoObli4 = infoObli4;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.name
	 * @return  the value of sys_file.name
	 * @mbggenerated
	 */
	public String getName() {
		return name;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.name
	 * @param name  the value for sys_file.name
	 * @mbggenerated
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column sys_file.origin_name
	 * @return  the value of sys_file.origin_name
	 * @mbggenerated
	 */
	public String getOriginName() {
		return originName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column sys_file.origin_name
	 * @param originName  the value for sys_file.origin_name
	 * @mbggenerated
	 */
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	
	private String fileUrl;

	public String getFileUrl() {
		return "{basePath}"+DateUtil.formatDate(DateUtil.YYYY_MM_DD, createDate)+"/"+getName();
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
}