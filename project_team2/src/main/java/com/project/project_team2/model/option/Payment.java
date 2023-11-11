package com.project.project_team2.model.option;

public enum Payment {
    OFF("offline"),
    ON("online");

    private final String label;

    private Payment(String label) {
        this.label = label;
    }

    public static Payment create(String payment) {
        switch (payment) {
            case "online":
                return ON;
            case "offline":
            default:
                return OFF;
        }
    }

    @Override
    public String toString() {
        return label;
    }
}
