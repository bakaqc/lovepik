package com.bakaqc.flower.model;

import com.bakaqc.flower.model.option.AdminRole;

public class Admin {

    private int id;
    private String userName;
    private String password;
    private AdminRole role;

    public Admin() {
    }

    public Admin(int id, String userName, String password, AdminRole role) {
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

    public AdminRole getRole() {
        return role;
    }

    public void setRole(AdminRole role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Admin [ " + "Id = " + id + ", UserName = " + userName + ", Password = " + password + ", Role = " + role + ']' + "\n";
    }

}
