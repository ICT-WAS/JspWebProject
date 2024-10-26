package com.shopping.model;

public class CartProductDto {
	private Long cartProductId;			// 장바구니상품고유ID
	private Long cartId;				// 장바구니고유ID
	private Long productId;				// 상품고유ID
	private String name;				// 상품명
	private Integer quantity;			// 장바구니 수량
	private Integer price;				// 상품 단가
	private Integer total;				// 항목 가격

	
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
		total = price == null ? 0 : price * quantity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
		total = quantity == null ? 0 : price * quantity;
	}
	public Integer getTotal() {
		return total;
	}
	
	public CartProductDto(Long cartProductId, Long cartId, Long productId, String name, Integer quantity, Integer price) {
		super();
		this.cartProductId = cartProductId;
		this.cartId = cartId;
		this.productId = productId;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		
		total = price * quantity;
	}
	public CartProductDto() {
		super();
	}
}
