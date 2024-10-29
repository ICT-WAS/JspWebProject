package com.shopping.model;

import java.util.List;

public class ProductPage {
	private List<Product> productList;
	private int totalCount;

	

	public ProductPage(List<Product> productList, int totalCount) {
		super();
		this.productList = productList;
		this.totalCount = totalCount;
	}

	public List<Product> getproductList() {
		return productList;
	}

	public void setProducts(List<Product> productList) {
		this.productList = productList;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
}
