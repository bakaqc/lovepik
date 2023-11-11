package com.project.project_team2.model.option;

public enum AdminRole {

    SUPER_ADMIN(
    "SuperAdmin"),
    ADMIN("Admin");

    private final String label;

    private AdminRole(String label) {
        this.label = label;
    }

    public static AdminRole create(String role) {
        switch (role) {
            case "SuperAdmin":
                return SUPER_ADMIN;
            case "Admin":
            default:
                return ADMIN;
        }
    }

    @Override
    public String toString() {
        return label;
    }
}
