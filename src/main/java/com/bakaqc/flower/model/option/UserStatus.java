package com.bakaqc.flower.model.option;

public enum UserStatus {
    ACTIVATE("activate"),
    DEACTIVATE("deactivate");

    private final String label;

    private UserStatus(String label) {
        this.label = label;
    }

    public static UserStatus create(String status) {
        switch (status) {
            case "activate":
                return ACTIVATE;
            case "deactivate":
            default:
                return DEACTIVATE;
        }
    }

    @Override
    public String toString() {
        return label;
    }
}
