package com.shopping.model;

public class ProductOption {
	private long optionId;
	private long productId;
	private String optionType;
	private String optionName;
	private double additionalPrice;
	private double optionStockquantity;

	public ProductOption() {
		super();
	}

	public ProductOption(long productId, String optionType, String optionName, double additionalPrice,
			double optionStockquantity) {
		super();
		this.productId = productId;
		this.optionType = optionType;
		this.optionName = optionName;
		this.additionalPrice = additionalPrice;
		this.optionStockquantity = optionStockquantity;
	}

	public long getOptionId() {
		return optionId;
	}

	public void setOptionId(long optionId) {
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