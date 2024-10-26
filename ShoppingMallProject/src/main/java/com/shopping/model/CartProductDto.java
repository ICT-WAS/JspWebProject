package com.shopping.model;

import java.io.Serializable;
import java.text.DecimalFormat;

public class CartProductDto implements Serializable {
    private static final long serialVersionUID = 1L;
    
	private Long cartProductId;			// 장바구니상품고유ID
	private Long cartId;				// 장바구니고유ID
	private Long productId;				// 상품고유ID
	private String name;				// 상품명
	private Integer quantity;			// 장바구니 수량
	private Integer price;				// 상품 단가
	private Integer total;				// 항목 가격
	
	private String formattedPrice;
	private String formattedTotal;
	
	DecimalFormat df = new DecimalFormat("#,###");
	
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
		
		Integer _total = quantity == null ? 0 : price * quantity;
		setTotal(_total);
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
		formattedPrice = df.format(price);
		
		Integer _total = quantity == null ? 0 : price * quantity;
		setTotal(_total);
	}
	public Integer getTotal() {
		return total;
	}
	// 내부적으로만 사용(계산에 의해서만 정해짐. 외부에서 직접 정의 불가)
	private void setTotal(Integer total) {
		this.total = total;
		formattedTotal = df.format(total);
	}
	public String getFormattedPrice() {
		return formattedPrice;
	}
	public String getFormattedTotal() {
		return formattedTotal;
	}
	
	public CartProductDto(Long cartProductId, Long cartId, Long productId, String name, Integer quantity, Integer price) {
		super();
		this.cartProductId = cartProductId;
		this.cartId = cartId;
		this.productId = productId;
		this.name = name;
		this.quantity = quantity;
		setPrice(price);
	}
	public CartProductDto() {
		super();
	}
}
