package com.shopping.enums;

public enum DeliveryRequest {
	NONE("배송 기사에게 전달되는 메시지입니다. 선택해 주세요."),
    LEAVE_WITH_SECURITY("부재 시 경비실에 맡겨주세요"),
    LEAVE_AT_DOOR("부재 시 문앞에 놓아주세요"),
    PICK_UP_DIRECTLY("직접 받겠습니다"),
    CONTACT_BEFORE_DELIVERY("배송 전에 연락주세요"),
    CUSTOM_MESSAGE("직접 입력");

    private final String description;

    DeliveryRequest(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public static DeliveryRequest fromValue(String value) {
        for (DeliveryRequest request : values()) {
            if (request.name().equals(value)) {
                return request;
            }
        }
        return NONE; // 기본값
    }
}
