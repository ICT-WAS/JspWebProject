package com.shopping.model;

public class Category {
	private long categoryId;
	private Long parentCategoryId;
	private String name;
	private int level;
	
	public Category() {
		super();
	}

	public Category(Long parentCategoryId, String name, int level) {
		super();
		this.parentCategoryId = parentCategoryId;
		this.name = name;
		this.level = level;
	}


	public long getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}


	public Long getParentCategoryId() {
		return parentCategoryId;
	}


	public void setParentCategoryId(Long parentCategoryId) {
		this.parentCategoryId = parentCategoryId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getLevel() {
		return level;
	}


	public void setLevel(int level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", parentCategoryId=" + parentCategoryId + ", name=" + name
				+ ", level=" + level + "]";
	}
	
	
	
	
	
	

}
