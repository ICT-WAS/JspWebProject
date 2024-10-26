package com.shopping.enums;

public enum OrderStatus {
	PENDING("결제중"),
	PAYMENT_FAILED("결제실패"),
    COMPLETED("결제완료"),
    SHIPPING("배송중"),
    DELIVERED("배송완료"),
    CANCELED("주문취소");

    private final String description;

    OrderStatus(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}