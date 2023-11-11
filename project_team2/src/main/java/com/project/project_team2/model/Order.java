package com.project.project_team2.model;

import com.project.project_team2.model.option.OrderStatus;
import com.project.project_team2.model.option.Payment;
import java.time.LocalDateTime;

public class Order {

    private int id;
    private int userID;
    private int totalPrice;
    private Payment payment;
    private OrderStatus status;
    private LocalDateTime createAt;

    public Order() {
    }

    public Order(int id, int userID, int totalPrice, Payment payment, OrderStatus status, LocalDateTime createAt) {
        this.id = id;
        this.userID = userID;
        this.totalPrice = totalPrice;
        this.payment = payment;
        this.status = status;
        this.createAt = createAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Order [ " + "Id = " + id + ", User ID = " + userID + ", Total Price = " + totalPrice + ", Payment = "
                + payment + ", Status = " + status + ", Create At = " + createAt + '}' + "\n";
    }

}
