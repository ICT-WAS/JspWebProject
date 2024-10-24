package com.shopping.model;

import java.time.LocalDateTime;

public class Product {
	private long productId;
	private Long categoryId;
	private String name;
	private String img1;
	private String img2;
	private String img3;
	private String description;
	private double price;
	private double quantity;
	private LocalDateTime registrationDate;
	private String brand;
	private String status;
	
	public Product() {
	}

	//productId는 DB 자동 입력이므로 생성자로 받으면 안 됨
	//categoryId는 null 허용, null 입력을 받을 수 있도록 Long 타입(객체 타입)으로 설정
	public Product(Long categoryId, String name, String img1, String img2, String img3,
			String description, double price, double quantity, LocalDateTime registrationDate, String brand,
			String status) {
		this.categoryId = categoryId;
		this.name = name;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
		this.registrationDate = registrationDate;
		this.brand = brand;
		this.status = status;
	}

	//productId는 getter만 존재
	public long getProductId() {
		return productId;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public LocalDateTime getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(LocalDateTime registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", categoryId=" + categoryId + ", name=" + name + ", img1=" + img1
				+ ", img2=" + img2 + ", img3=" + img3 + ", description=" + description + ", price=" + price
				+ ", quantity=" + quantity + ", registrationDate=" + registrationDate + ", brand=" + brand + ", status="
				+ status + "]";
	}
	
	
	
	
	
}
