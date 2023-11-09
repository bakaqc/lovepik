package com.project.project_team2.model;

public class User {

    private int id;
    private String fullName;
    private int yearOfBirth;
    private String gender;
    private String email;
    private String username;
    private String password;
    private String address;
    private int status;
    private String createdAt;
    private String deletedAt;

    public User() {
    }

    public User(int id, String fullName, int yearOfBirth, String gender, String email, String username, String password, String address, int status, String createdAt, String deletedAt) {
        this.id = id;
        this.fullName = fullName;
        this.yearOfBirth = yearOfBirth;
        this.gender = gender;
        this.email = email;
        this.username = username;
        this.password = password;
        this.address = address;
        this.status = status;
        this.createdAt = createdAt;
        this.deletedAt = deletedAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getYearOfBirth() {
        return yearOfBirth;
    }

    public void setYearOfBirth(int yearOfBirth) {
        this.yearOfBirth = yearOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(String deletedAt) {
        this.deletedAt = deletedAt;
    }

    @Override
    public String toString() {
        return "User [ " + "id = " + id + ", fullName = " + fullName + ", yearOfBirth = " + yearOfBirth
                + ", gender = " + gender + ", email = " + email + ", username = " + username + ", password = "
                + password + ", address = " + address + ", status = " + status + ']' + ", created at = "
                + createdAt + ", deleted at = " + deletedAt + "\n";
    }

}
