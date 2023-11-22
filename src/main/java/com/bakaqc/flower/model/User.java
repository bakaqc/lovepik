package com.bakaqc.flower.model;

import com.bakaqc.flower.model.option.UserGender;
import com.bakaqc.flower.model.option.UserStatus;
import java.time.LocalDateTime;

public class User {

    private int id;
    private String fullName;
    private int yearOfBirth;
    private UserGender gender;
    private String email;
    private String password;
    private String address;
    private UserStatus status;
    private LocalDateTime createdAt;
    private LocalDateTime deletedAt;

    public User() {
    }

    public User(int id, String fullName, int yearOfBirth, UserGender gender, String email,
            String password, String address, UserStatus status, LocalDateTime createdAt, LocalDateTime deletedAt) {
        this.id = id;
        this.fullName = fullName;
        this.yearOfBirth = yearOfBirth;
        this.gender = gender;
        this.email = email;
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

    public UserGender getGender() {
        return gender;
    }

    public void setGender(UserGender gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public UserStatus getStatus() {
        return status;
    }

    public void setStatus(UserStatus status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(LocalDateTime deletedAt) {
        this.deletedAt = deletedAt;
    }

    @Override
    public String toString() {
        return "User [ " + "ID = " + id + ", Full Name = " + fullName + ", Year Of Birth = " + yearOfBirth
                + ", Gender = " + gender + ", Email = " + email + ", Password = "
                + password + ", Address = " + address + ", status = " + status + ']' + ", Created At = "
                + createdAt + ", Deleted At = " + deletedAt + "\n";
    }

}
