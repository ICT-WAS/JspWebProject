package com.shopping.model;

import java.time.LocalDateTime;

public class CartProduct {
	private Long cartProductId;			// 장바구니상품고유ID
	private Long cartId;				// 장바구니고유ID
	private Long productId;				// 상품고유ID
	
	private Integer quantity;			// 장바구니 수량
	private LocalDateTime addedDate;	// 상품추가날짜
	private String note;				// 추가설명
	
	public Long getCartProductId() {
		return cartProductId;
	}
	public void setCartProductId(Long cartProductId) {
		this.cartProductId = cartProductId;
	}
	public Long getCartId() {
		return cartId;
	}
	public void setCartId(Long cartId) {
		this.cartId = cartId;
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
	}
	public LocalDateTime getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(LocalDateTime addedDate) {
		this.addedDate = addedDate;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public CartProduct(Long cartId, Long productId, Integer quantity, LocalDateTime addedDate, String note) {
		super();
		this.cartId = cartId;
		this.productId = productId;
		this.quantity = quantity;
		this.addedDate = addedDate;
		this.note = note;
	}
	
	public CartProduct() {
		
	}
}
