package com.shopping.model;

import java.util.List;

public class ProductOptionDTO {

	private Product product;
	private List<ProductOption> optionList;

	public ProductOptionDTO() {
		super();
	}

	public ProductOptionDTO(Product product, List<ProductOption> optionList) {
		super();
		this.product = product;
		this.optionList = optionList;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<ProductOption> getOptionList() {
		return optionList;
	}

	public void setOptionList(List<ProductOption> optionList) {
		this.optionList = optionList;
	}

	@Override
	public String toString() {
		return "ProductOptionDTO [product=" + product + ", optionList=" + optionList + "]";
	}

	

}
