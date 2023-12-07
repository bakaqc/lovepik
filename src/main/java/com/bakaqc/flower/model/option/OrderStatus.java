package com.bakaqc.flower.model.option;

public enum OrderStatus {
    PROCESSING("processing"),
    SHIPPING("shipping"),
    DONE("done"),
    CANCELED("canceled");

    public static boolean isValid(String status) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private final String label;

    private OrderStatus(String label) {
        this.label = label;
    }

    public static OrderStatus create(String status) {
        switch (status) {
            case "processing":
                return PROCESSING;
            case "shipping":
                return SHIPPING;
            case "done":
                return DONE;
            case "canceled":
            default:
                return CANCELED;
        }
    }

    @Override
    public String toString() {
        return label;
    }
}
