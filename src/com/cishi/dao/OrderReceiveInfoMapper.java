package com.cishi.dao;

import com.cishi.beans.OrderReceiveInfo;
import com.cishi.beans.OrderReceiveInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface OrderReceiveInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	int countByExample(OrderReceiveInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	int deleteByExample(OrderReceiveInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	int insert(OrderReceiveInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	int insertSelective(OrderReceiveInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	List<OrderReceiveInfo> selectByExampleWithRowbounds(OrderReceiveInfoExample example, RowBounds rowBounds);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	List<OrderReceiveInfo> selectByExample(OrderReceiveInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	OrderReceiveInfo selectByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	int updateByExampleSelective(@Param("record") OrderReceiveInfo record,
			@Param("example") OrderReceiveInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	int updateByExample(@Param("record") OrderReceiveInfo record, @Param("example") OrderReceiveInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(OrderReceiveInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(OrderReceiveInfo record);
}