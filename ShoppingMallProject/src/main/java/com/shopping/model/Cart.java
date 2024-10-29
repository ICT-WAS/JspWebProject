package com.shopping.model;

public class Cart {
	Long cartId;
	Long memberId;
	String createdAt;
	String updatedAt;
	public Cart(Long cartId, Long memberId, String createdAt, String updatedAt) {
		super();
		this.cartId = cartId;
		this.memberId = memberId;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	public Cart() {
		super();
	}
	public Long getCartId() {
		return cartId;
	}
	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
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
		return "Cart [cartId=" + cartId + ", memberId=" + memberId + ", createdAt=" + createdAt + ", updatedAt="
				+ updatedAt + "]";
	}
	
}
