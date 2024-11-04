package com.shopping.model;

import java.io.Serializable;
import java.text.DecimalFormat;

public class CartProductDto implements Serializable {
    private static final long serialVersionUID = 1L;
    
	private Long productId;				// 상품고유ID
	private String name;				// 상품명
	private Integer quantity;			// 장바구니 수량
	private Integer productPrice;		// 상품 단가
	private String image;				// 상품 이미지
	
	private Long optionId; 				// 옵션고유ID
	private String optionName; 			// 옵션명
	private Integer optionPrice;		// 옵션 단가
	
	private Long cartProductId;			// 카트상품고유ID
	
	private Integer price;				// 상품 단가 + 옵션가
	private Integer total;				// 항목 가격 (상품 단가 + 옵션가) * 수량
	
	private String formattedProductPrice;
	private String formattedOptionPrice;
	private String formattedPrice;
	private String formattedTotalPrice;
	
	DecimalFormat df = new DecimalFormat("#,###");

	public CartProductDto(Long productId, String name, Integer quantity, Integer price, String image, Long optionId,
			String optionName, Integer optionPrice, Long cartProductId) {
		super();
		this.productId = productId;
		this.name = name;
		setQuantity(quantity);
		setProductPrice(price);
		this.image = image;
		this.optionId = optionId;
		this.optionName = optionName;
		setOptionPrice(optionPrice);
		this.cartProductId = cartProductId;
	}

	public CartProductDto() {
		super();
	}


	@Override
	public String toString() {
		return "CartProductDto [productId=" + productId + ", name=" + name + ", quantity=" + quantity
				+ ", productPrice=" + productPrice + ", image=" + image + ", optionId=" + optionId + ", optionName="
				+ optionName + ", optionPrice=" + optionPrice + ", cartProductId=" + cartProductId + ", price=" + price
				+ ", total=" + total + ", formattedProductPrice=" + formattedProductPrice + ", formattedOptionPrice="
				+ formattedOptionPrice + ", formattedPrice=" + formattedPrice + ", formattedTotalPrice="
				+ formattedTotalPrice + ", df=" + df + "]";
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
		
		if(price == null) {
			return;
		}
		
		setTotal(price * quantity);
	}
	
	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
		
		setFormattedProductPrice(productPrice);
		
		if(optionPrice == null) {
			return;
		}
		
		setPrice(productPrice + optionPrice);
	}
	
	public Integer getOptionPrice() {
		return optionPrice;
	}

	public void setOptionPrice(Integer optionPrice) {
		this.optionPrice = optionPrice;
		
		setFormattedOptionPrice(optionPrice);
		
		if(productPrice == null) {
			return;
		}
		
		setPrice(productPrice + optionPrice);
	}

	public Integer getPrice() {
		return price;
	}

	private void setPrice(Integer price) {
		this.price = price;
		
		setFormattedPrice(price);
		
		if(quantity == null) {
			return;
		}
		
		setTotal(price * quantity);
	}

	public Integer getTotal() {
		return total;
	}

	private void setTotal(Integer total) {
		this.total = total;
		
		setFormattedTotalPrice(total);
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Long getOptionId() {
		return optionId;
	}

	public void setOptionId(Long optionId) {
		this.optionId = optionId;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public Long getCartProductId() {
		return cartProductId;
	}

	public void setCartProductId(Long cartProductId) {
		this.cartProductId = cartProductId;
	}

	public String getFormattedProductPrice() {
		return formattedProductPrice;
	}

	private void setFormattedProductPrice(Integer productPrice) {
		formattedProductPrice = df.format(productPrice);
	}

	public String getFormattedOptionPrice() {
		return formattedOptionPrice;
	}

	private void setFormattedOptionPrice(Integer optionPrice) {
		formattedOptionPrice = df.format(optionPrice);
	}
	

	public String getFormattedPrice() {
		return formattedPrice;
	}

	private void setFormattedPrice(Integer price) {
		formattedPrice = df.format(price);
	}

	public String getFormattedTotalPrice() {
		return formattedTotalPrice;
	}

	private void setFormattedTotalPrice(Integer totalPrice) {
		formattedTotalPrice = df.format(totalPrice);
	}
	
}
