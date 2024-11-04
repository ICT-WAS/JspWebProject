package com.shopping.model;

import java.time.LocalDateTime;

public class OrderDetail {
	private Long orderDetilId;			//
	private Long orderId;				// 주문ID
	private Long productId;				// 상품ID
	private Integer quantity;			// 수량
	private Integer unitPrice;			// 상품 단가 + 옵션가
	private Integer totalPrice;			// (상품 단가 + 옵션가) * 수량
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	private Long optionId;				// 옵션ID
	
	public OrderDetail(Long orderDetilId, Long orderId, Long productId, Integer quantity, Integer unitPrice,
			LocalDateTime createdAt, LocalDateTime updatedAt, Long optionId) {
		super();
		this.orderDetilId = orderDetilId;
		this.orderId = orderId;
		this.productId = productId;
		this.quantity = quantity;
		setUnitPrice(unitPrice);
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.optionId = optionId;
	}
	
	
	public OrderDetail() {
		super();
	}



	public Long getOrderDetilId() {
		return orderDetilId;
	}
	public void setOrderDetilId(Long orderDetilId) {
		this.orderDetilId = orderDetilId;
	}
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
		
		if(unitPrice != null) {
			setTotalPrice(quantity * unitPrice);
		}
	}
	public Integer getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
		
		if(quantity != null) {
			setTotalPrice(quantity * unitPrice);
		}
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	private void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Long getOptionId() {
		return optionId;
	}
	public void setOptionId(Long optionId) {
		this.optionId = optionId;
	}
	
	
}
