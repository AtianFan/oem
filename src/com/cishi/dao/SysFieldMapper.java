package com.cishi.dao;

import com.cishi.beans.SysField;
import com.cishi.beans.SysFieldExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface SysFieldMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	int countByExample(SysFieldExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	int deleteByExample(SysFieldExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	int insert(SysField record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	int insertSelective(SysField record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	List<SysField> selectByExampleWithRowbounds(SysFieldExample example, RowBounds rowBounds);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	List<SysField> selectByExample(SysFieldExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	SysField selectByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	int updateByExampleSelective(@Param("record") SysField record, @Param("example") SysFieldExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	int updateByExample(@Param("record") SysField record, @Param("example") SysFieldExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(SysField record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_field
	 * @mbggenerated
	 */
	int updateByPrimaryKey(SysField record);
}