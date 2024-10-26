package com.shopping.model;

import java.time.LocalDateTime;

import com.shopping.enums.OrderStatus;

public class Order {
	private Long orderId;					// 주문고유ID
	private Long memberId;					// 회원고유ID
	private String orderNumber;				// 주문번호
	private LocalDateTime orderDate;		// 주문날짜
	private Integer totalAmount;			// 총주문금액
	private Integer usedPoints;				// 사용한적립금
	private OrderStatus orderStatus;		// 주문상태
	private String paymentMethod;			// 결제방법
	private Integer expectedRewardAmount;	// 적립예정금액
	private Integer finalPaymentAmount;		// 최종결제금액
	private LocalDateTime createdAt;		// 등록날짜
	private LocalDateTime updateedAt;		// 수정날짜
	
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public LocalDateTime getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(LocalDateTime orderDate) {
		this.orderDate = orderDate;
	}
	public Integer getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Integer getUsedPoints() {
		return usedPoints;
	}
	public void setUsedPoints(Integer usedPoints) {
		this.usedPoints = usedPoints;
	}
	public OrderStatus getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Integer getExpectedRewardAmount() {
		return expectedRewardAmount;
	}
	public void setExpectedRewardAmount(Integer expectedRewardAmount) {
		this.expectedRewardAmount = expectedRewardAmount;
	}
	public Integer getFinalPaymentAmount() {
		return finalPaymentAmount;
	}
	public void setFinalPaymentAmount(Integer finalPaymentAmount) {
		this.finalPaymentAmount = finalPaymentAmount;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public LocalDateTime getUpdateedAt() {
		return updateedAt;
	}
	public void setUpdateedAt(LocalDateTime updateedAt) {
		this.updateedAt = updateedAt;
	}
	public Order(Long memberId, String orderNumber, LocalDateTime orderDate, Integer totalAmount,
			Integer usedPoints, OrderStatus orderStatus, String paymentMethod, Integer expectedRewardAmount,
			Integer finalPaymentAmount, LocalDateTime createdAt, LocalDateTime updateedAt) {
		super();
		this.memberId = memberId;
		this.orderNumber = orderNumber;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.usedPoints = usedPoints;
		this.orderStatus = orderStatus;
		this.paymentMethod = paymentMethod;
		this.expectedRewardAmount = expectedRewardAmount;
		this.finalPaymentAmount = finalPaymentAmount;
		this.createdAt = createdAt;
		this.updateedAt = updateedAt;
	}
	public Order() {
		super();
	}
	
	
}