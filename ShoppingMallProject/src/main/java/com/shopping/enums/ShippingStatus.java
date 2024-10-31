package com.shopping.enums;

public enum ShippingStatus {
	PREPARING_FOR_SHIPMENT("배송준비"),
	IN_TRANSIT("배송중"),
	DELIVERED("배송완료");

    private final String description;

    ShippingStatus(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
