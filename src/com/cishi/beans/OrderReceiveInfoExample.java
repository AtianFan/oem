package com.cishi.beans;

import java.util.ArrayList;
import java.util.List;

public class OrderReceiveInfoExample {
    /**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public OrderReceiveInfoExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	protected abstract static class GeneratedCriteria {
		protected List<Criterion> criteria;

		protected GeneratedCriteria() {
			super();
			criteria = new ArrayList<Criterion>();
		}

		public boolean isValid() {
			return criteria.size() > 0;
		}

		public List<Criterion> getAllCriteria() {
			return criteria;
		}

		public List<Criterion> getCriteria() {
			return criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			criteria.add(new Criterion(condition));
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
			criteria.add(new Criterion(condition, value1, value2));
		}

		public Criteria andIdIsNull() {
			addCriterion("id is null");
			return (Criteria) this;
		}

		public Criteria andIdIsNotNull() {
			addCriterion("id is not null");
			return (Criteria) this;
		}

		public Criteria andIdEqualTo(String value) {
			addCriterion("id =", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotEqualTo(String value) {
			addCriterion("id <>", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThan(String value) {
			addCriterion("id >", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThanOrEqualTo(String value) {
			addCriterion("id >=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThan(String value) {
			addCriterion("id <", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThanOrEqualTo(String value) {
			addCriterion("id <=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLike(String value) {
			addCriterion("id like", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotLike(String value) {
			addCriterion("id not like", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdIn(List<String> values) {
			addCriterion("id in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotIn(List<String> values) {
			addCriterion("id not in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdBetween(String value1, String value2) {
			addCriterion("id between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotBetween(String value1, String value2) {
			addCriterion("id not between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andReceiverIdIsNull() {
			addCriterion("receiver_id is null");
			return (Criteria) this;
		}

		public Criteria andReceiverIdIsNotNull() {
			addCriterion("receiver_id is not null");
			return (Criteria) this;
		}

		public Criteria andReceiverIdEqualTo(String value) {
			addCriterion("receiver_id =", value, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdNotEqualTo(String value) {
			addCriterion("receiver_id <>", value, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdGreaterThan(String value) {
			addCriterion("receiver_id >", value, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdGreaterThanOrEqualTo(String value) {
			addCriterion("receiver_id >=", value, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdLessThan(String value) {
			addCriterion("receiver_id <", value, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdLessThanOrEqualTo(String value) {
			addCriterion("receiver_id <=", value, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdLike(String value) {
			addCriterion("receiver_id like", value, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdNotLike(String value) {
			addCriterion("receiver_id not like", value, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdIn(List<String> values) {
			addCriterion("receiver_id in", values, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdNotIn(List<String> values) {
			addCriterion("receiver_id not in", values, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdBetween(String value1, String value2) {
			addCriterion("receiver_id between", value1, value2, "receiverId");
			return (Criteria) this;
		}

		public Criteria andReceiverIdNotBetween(String value1, String value2) {
			addCriterion("receiver_id not between", value1, value2, "receiverId");
			return (Criteria) this;
		}

		public Criteria andOrderIdIsNull() {
			addCriterion("order_id is null");
			return (Criteria) this;
		}

		public Criteria andOrderIdIsNotNull() {
			addCriterion("order_id is not null");
			return (Criteria) this;
		}

		public Criteria andOrderIdEqualTo(String value) {
			addCriterion("order_id =", value, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdNotEqualTo(String value) {
			addCriterion("order_id <>", value, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdGreaterThan(String value) {
			addCriterion("order_id >", value, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdGreaterThanOrEqualTo(String value) {
			addCriterion("order_id >=", value, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdLessThan(String value) {
			addCriterion("order_id <", value, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdLessThanOrEqualTo(String value) {
			addCriterion("order_id <=", value, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdLike(String value) {
			addCriterion("order_id like", value, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdNotLike(String value) {
			addCriterion("order_id not like", value, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdIn(List<String> values) {
			addCriterion("order_id in", values, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdNotIn(List<String> values) {
			addCriterion("order_id not in", values, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdBetween(String value1, String value2) {
			addCriterion("order_id between", value1, value2, "orderId");
			return (Criteria) this;
		}

		public Criteria andOrderIdNotBetween(String value1, String value2) {
			addCriterion("order_id not between", value1, value2, "orderId");
			return (Criteria) this;
		}

		public Criteria andDelFlagIsNull() {
			addCriterion("del_flag is null");
			return (Criteria) this;
		}

		public Criteria andDelFlagIsNotNull() {
			addCriterion("del_flag is not null");
			return (Criteria) this;
		}

		public Criteria andDelFlagEqualTo(Byte value) {
			addCriterion("del_flag =", value, "delFlag");
			return (Criteria) this;
		}

		public Criteria andDelFlagNotEqualTo(Byte value) {
			addCriterion("del_flag <>", value, "delFlag");
			return (Criteria) this;
		}

		public Criteria andDelFlagGreaterThan(Byte value) {
			addCriterion("del_flag >", value, "delFlag");
			return (Criteria) this;
		}

		public Criteria andDelFlagGreaterThanOrEqualTo(Byte value) {
			addCriterion("del_flag >=", value, "delFlag");
			return (Criteria) this;
		}

		public Criteria andDelFlagLessThan(Byte value) {
			addCriterion("del_flag <", value, "delFlag");
			return (Criteria) this;
		}

		public Criteria andDelFlagLessThanOrEqualTo(Byte value) {
			addCriterion("del_flag <=", value, "delFlag");
			return (Criteria) this;
		}

		public Criteria andDelFlagIn(List<Byte> values) {
			addCriterion("del_flag in", values, "delFlag");
			return (Criteria) this;
		}

		public Criteria andDelFlagNotIn(List<Byte> values) {
			addCriterion("del_flag not in", values, "delFlag");
			return (Criteria) this;
		}

		public Criteria andDelFlagBetween(Byte value1, Byte value2) {
			addCriterion("del_flag between", value1, value2, "delFlag");
			return (Criteria) this;
		}

		public Criteria andDelFlagNotBetween(Byte value1, Byte value2) {
			addCriterion("del_flag not between", value1, value2, "delFlag");
			return (Criteria) this;
		}

		public Criteria andMoneyIsNull() {
			addCriterion("money is null");
			return (Criteria) this;
		}

		public Criteria andMoneyIsNotNull() {
			addCriterion("money is not null");
			return (Criteria) this;
		}

		public Criteria andMoneyEqualTo(Double value) {
			addCriterion("money =", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyNotEqualTo(Double value) {
			addCriterion("money <>", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyGreaterThan(Double value) {
			addCriterion("money >", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyGreaterThanOrEqualTo(Double value) {
			addCriterion("money >=", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyLessThan(Double value) {
			addCriterion("money <", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyLessThanOrEqualTo(Double value) {
			addCriterion("money <=", value, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyIn(List<Double> values) {
			addCriterion("money in", values, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyNotIn(List<Double> values) {
			addCriterion("money not in", values, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyBetween(Double value1, Double value2) {
			addCriterion("money between", value1, value2, "money");
			return (Criteria) this;
		}

		public Criteria andMoneyNotBetween(Double value1, Double value2) {
			addCriterion("money not between", value1, value2, "money");
			return (Criteria) this;
		}

		public Criteria andIsCurrentIsNull() {
			addCriterion("is_current is null");
			return (Criteria) this;
		}

		public Criteria andIsCurrentIsNotNull() {
			addCriterion("is_current is not null");
			return (Criteria) this;
		}

		public Criteria andIsCurrentEqualTo(Boolean value) {
			addCriterion("is_current =", value, "isCurrent");
			return (Criteria) this;
		}

		public Criteria andIsCurrentNotEqualTo(Boolean value) {
			addCriterion("is_current <>", value, "isCurrent");
			return (Criteria) this;
		}

		public Criteria andIsCurrentGreaterThan(Boolean value) {
			addCriterion("is_current >", value, "isCurrent");
			return (Criteria) this;
		}

		public Criteria andIsCurrentGreaterThanOrEqualTo(Boolean value) {
			addCriterion("is_current >=", value, "isCurrent");
			return (Criteria) this;
		}

		public Criteria andIsCurrentLessThan(Boolean value) {
			addCriterion("is_current <", value, "isCurrent");
			return (Criteria) this;
		}

		public Criteria andIsCurrentLessThanOrEqualTo(Boolean value) {
			addCriterion("is_current <=", value, "isCurrent");
			return (Criteria) this;
		}

		public Criteria andIsCurrentIn(List<Boolean> values) {
			addCriterion("is_current in", values, "isCurrent");
			return (Criteria) this;
		}

		public Criteria andIsCurrentNotIn(List<Boolean> values) {
			addCriterion("is_current not in", values, "isCurrent");
			return (Criteria) this;
		}

		public Criteria andIsCurrentBetween(Boolean value1, Boolean value2) {
			addCriterion("is_current between", value1, value2, "isCurrent");
			return (Criteria) this;
		}

		public Criteria andIsCurrentNotBetween(Boolean value1, Boolean value2) {
			addCriterion("is_current not between", value1, value2, "isCurrent");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdIsNull() {
			addCriterion("parent_order_id is null");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdIsNotNull() {
			addCriterion("parent_order_id is not null");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdEqualTo(String value) {
			addCriterion("parent_order_id =", value, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdNotEqualTo(String value) {
			addCriterion("parent_order_id <>", value, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdGreaterThan(String value) {
			addCriterion("parent_order_id >", value, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdGreaterThanOrEqualTo(String value) {
			addCriterion("parent_order_id >=", value, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdLessThan(String value) {
			addCriterion("parent_order_id <", value, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdLessThanOrEqualTo(String value) {
			addCriterion("parent_order_id <=", value, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdLike(String value) {
			addCriterion("parent_order_id like", value, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdNotLike(String value) {
			addCriterion("parent_order_id not like", value, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdIn(List<String> values) {
			addCriterion("parent_order_id in", values, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdNotIn(List<String> values) {
			addCriterion("parent_order_id not in", values, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdBetween(String value1, String value2) {
			addCriterion("parent_order_id between", value1, value2, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andParentOrderIdNotBetween(String value1, String value2) {
			addCriterion("parent_order_id not between", value1, value2, "parentOrderId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdIsNull() {
			addCriterion("sys_confirm_id is null");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdIsNotNull() {
			addCriterion("sys_confirm_id is not null");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdEqualTo(String value) {
			addCriterion("sys_confirm_id =", value, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdNotEqualTo(String value) {
			addCriterion("sys_confirm_id <>", value, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdGreaterThan(String value) {
			addCriterion("sys_confirm_id >", value, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdGreaterThanOrEqualTo(String value) {
			addCriterion("sys_confirm_id >=", value, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdLessThan(String value) {
			addCriterion("sys_confirm_id <", value, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdLessThanOrEqualTo(String value) {
			addCriterion("sys_confirm_id <=", value, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdLike(String value) {
			addCriterion("sys_confirm_id like", value, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdNotLike(String value) {
			addCriterion("sys_confirm_id not like", value, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdIn(List<String> values) {
			addCriterion("sys_confirm_id in", values, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdNotIn(List<String> values) {
			addCriterion("sys_confirm_id not in", values, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdBetween(String value1, String value2) {
			addCriterion("sys_confirm_id between", value1, value2, "sysConfirmId");
			return (Criteria) this;
		}

		public Criteria andSysConfirmIdNotBetween(String value1, String value2) {
			addCriterion("sys_confirm_id not between", value1, value2, "sysConfirmId");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to the database table order_receive_info
	 * @mbggenerated
	 */
	public static class Criterion {
		private String condition;
		private Object value;
		private Object secondValue;
		private boolean noValue;
		private boolean singleValue;
		private boolean betweenValue;
		private boolean listValue;
		private String typeHandler;

		public String getCondition() {
			return condition;
		}

		public Object getValue() {
			return value;
		}

		public Object getSecondValue() {
			return secondValue;
		}

		public boolean isNoValue() {
			return noValue;
		}

		public boolean isSingleValue() {
			return singleValue;
		}

		public boolean isBetweenValue() {
			return betweenValue;
		}

		public boolean isListValue() {
			return listValue;
		}

		public String getTypeHandler() {
			return typeHandler;
		}

		protected Criterion(String condition) {
			super();
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List<?>) {
				this.listValue = true;
			} else {
				this.singleValue = true;
			}
		}

		protected Criterion(String condition, Object value) {
			this(condition, value, null);
		}

		protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, null);
		}
	}

	/**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table order_receive_info
     *
     * @mbggenerated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }
}