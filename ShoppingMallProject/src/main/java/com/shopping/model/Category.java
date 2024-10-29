package com.shopping.model;

public class Category {
	private long categoryId;
	private Long parentCategoryId;
	private String name;
	private int Level;
	
	public Category() {
		super();
	}

	public Category(Long parentCategoryId, String name, int level) {
		super();
		this.parentCategoryId = parentCategoryId;
		this.name = name;
		this.Level = level;
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
		return Level;
	}


	public void setLevel(int level) {
		Level = level;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", parentCategoryId=" + parentCategoryId + ", name=" + name
				+ ", Level=" + Level + "]";
	}
	
	
	
	
	
	

}
