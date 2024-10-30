package com.shopping.model;

public class Address {
	private Long addressId;
	private Long memberId;
	private String recipientName;
	private String roadNameAddress;
	private String detailAddress;
	private String postalCode;
	private String phoneNumber;
	private String alias;
	private int isDefault;
	private String createdAt;
	private String updatedAt;
	public Address(Long addressId, Long memberId, String recipientName, String roadNameAddress, String detailAddress,
			String postalCode, String phoneNumber, String alias, int isDefault, String createdAt, String updatedAt) {
		super();
		this.addressId = addressId;
		this.memberId = memberId;
		this.recipientName = recipientName;
		this.roadNameAddress = roadNameAddress;
		this.detailAddress = detailAddress;
		this.postalCode = postalCode;
		this.phoneNumber = phoneNumber;
		this.alias = alias;
		this.isDefault = isDefault;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	public Address() {
		super();
	}
	public Long getAddressId() {
		return addressId;
	}
	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
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
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public int getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}
	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", memberId=" + memberId + ", recipientName=" + recipientName
				+ ", roadNameAddress=" + roadNameAddress + ", detailAddress=" + detailAddress + ", postalCode="
				+ postalCode + ", phoneNumber=" + phoneNumber + ", alias=" + alias + ", isDefault=" + isDefault
				+ ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + "]";
	}
	
	
}
