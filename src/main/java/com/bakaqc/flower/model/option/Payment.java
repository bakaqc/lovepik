package com.bakaqc.flower.model.option;

public enum Payment {
    COD("COD"),
    MoMo("MoMo");

    private final String label;

    private Payment(String label) {
        this.label = label;
    }

    public static Payment create(String payment) {
        switch (payment) {
            case "MoMo":
                return MoMo;
            case "COD":
            default:
                return COD;

        }
    }

    @Override
    public String toString() {
        return label;
    }
}
