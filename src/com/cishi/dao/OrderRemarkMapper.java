package com.cishi.dao;

import com.cishi.beans.OrderRemark;
import com.cishi.beans.OrderRemarkExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface OrderRemarkMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int countByExample(OrderRemarkExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int deleteByExample(OrderRemarkExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int insert(OrderRemark record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int insertSelective(OrderRemark record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	List<OrderRemark> selectByExampleWithBLOBsWithRowbounds(OrderRemarkExample example, RowBounds rowBounds);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	List<OrderRemark> selectByExampleWithBLOBs(OrderRemarkExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	List<OrderRemark> selectByExampleWithRowbounds(OrderRemarkExample example, RowBounds rowBounds);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	List<OrderRemark> selectByExample(OrderRemarkExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	OrderRemark selectByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int updateByExampleSelective(@Param("record") OrderRemark record, @Param("example") OrderRemarkExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int updateByExampleWithBLOBs(@Param("record") OrderRemark record, @Param("example") OrderRemarkExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int updateByExample(@Param("record") OrderRemark record, @Param("example") OrderRemarkExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(OrderRemark record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int updateByPrimaryKeyWithBLOBs(OrderRemark record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_remark
	 * @mbggenerated
	 */
	int updateByPrimaryKey(OrderRemark record);
}