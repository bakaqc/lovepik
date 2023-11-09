package com.project.project_team2.model;

public class Admin {

    private int id;
    private String userName;
    private String password;
    private String role;

    public Admin() {
    }

    public Admin(int id, String userName, String password, String role) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Admin [ " + "id = " + id + ", userName = " + userName + ", password = " + password + ", role = " + role + ']' + "\n";
    }

}
