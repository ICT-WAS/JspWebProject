package com.shopping.model;

public class ProductOption {
	private Long optionId;
	private Long productId;
	private String optionType;
	private String optionName;
	private double additionalPrice = 0;
	private double optionStockquantity;

	public ProductOption() {
		super();
	}

	public ProductOption(Long productId, String optionType, String optionName, double additionalPrice,
			double optionStockquantity) {
		super();
		this.productId = productId;
		this.optionType = optionType;
		this.optionName = optionName;
		this.additionalPrice = additionalPrice;
		this.optionStockquantity = optionStockquantity;
	}

	public Long getOptionId() {
		return optionId;
	}

	public void setOptionId(Long optionId) {
		this.optionId = optionId;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public String getOptionType() {
		return optionType;
	}

	public void setOptionType(String optionType) {
		this.optionType = optionType;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public double getAdditionalPrice() {
		return additionalPrice;
	}

	public void setAdditionalPrice(double additionalPrice) {
		this.additionalPrice = additionalPrice;
	}

	public double getOptionStockquantity() {
		return optionStockquantity;
	}

	public void setOptionStockquantity(double optionStockquantity) {
		this.optionStockquantity = optionStockquantity;
	}

	@Override
	public String toString() {
		return "ProductOption [optionId=" + optionId + ", productId=" + productId + ", optionType=" + optionType
				+ ", optionName=" + optionName + ", additionalPrice=" + additionalPrice + ", optionStockquantity="
				+ optionStockquantity + "]";
	}

}
