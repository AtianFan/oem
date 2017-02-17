package com.cishi.dao;

import com.cishi.beans.SysScore;
import com.cishi.beans.SysScoreExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface SysScoreMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	int countByExample(SysScoreExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	int deleteByExample(SysScoreExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	int insert(SysScore record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	int insertSelective(SysScore record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	List<SysScore> selectByExampleWithRowbounds(SysScoreExample example, RowBounds rowBounds);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	List<SysScore> selectByExample(SysScoreExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	SysScore selectByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	int updateByExampleSelective(@Param("record") SysScore record, @Param("example") SysScoreExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	int updateByExample(@Param("record") SysScore record, @Param("example") SysScoreExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(SysScore record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_score
	 * @mbggenerated
	 */
	int updateByPrimaryKey(SysScore record);
}