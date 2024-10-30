package com.shopping.model;

import java.time.LocalDateTime;

public class Shipping {
	private Long shippingId;			// 배송정보고유ID
	private Long orderId; 				// 주문고유ID
	private String recipientName;		// 수령자명
	private String roadNameAddress;		// 도로명주소
	private String detailAddress;		// 상세주소
	private	String postalCode;			// 우편번호
	private String phoneNumber;			// 전화번호
	private String shippingStatus;		// 배송상태
	private String trackingNumber;		// 운송장번호
	private String courierName;			// 택배사명
	private LocalDateTime createdAt;	// 등록날짜
	private LocalDateTime updatedAt;	// 수정날짜
	private String message;				// 배송메시지
	
	public Shipping() {
		
	}
	
	public Shipping(Long shippingId, Long orderId, String recipientName, String roadNameAddress, String detailAddress,
			String postalCode, String phoneNumber, String shippingStatus, String trackingNumber,
			String courierName, LocalDateTime createdAt, LocalDateTime updatedAt) {
		super();
		this.shippingId = shippingId;
		this.orderId = orderId;
		this.recipientName = recipientName;
		this.roadNameAddress = roadNameAddress;
		this.detailAddress = detailAddress;
		this.postalCode = postalCode;
		this.phoneNumber = phoneNumber;
		this.shippingStatus = shippingStatus;
		this.trackingNumber = trackingNumber;
		this.courierName = courierName;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public Long getShippingId() {
		return shippingId;
	}

	public void setShippingId(Long shippingId) {
		this.shippingId = shippingId;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRoadNameAddress() {
		return roadNameAddress;
	}

	public void setRoadNameAddress(String roadNameAddress) {
		this.roadNameAddress = roadNameAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getShippingStatus() {
		return shippingStatus;
	}

	public void setShippingStatus(String shippingStatus) {
		this.shippingStatus = shippingStatus;
	}

	public String getTrackingNumber() {
		return trackingNumber;
	}

	public void setTrackingNumber(String trackingNumber) {
		this.trackingNumber = trackingNumber;
	}

	public String getCourierName() {
		return courierName;
	}

	public void setCourierName(String courierName) {
		this.courierName = courierName;
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
