package com.bakaqc.flower.model;

import com.bakaqc.flower.model.option.OrderStatus;
import com.bakaqc.flower.model.option.Payment;
import java.time.LocalDateTime;

public class HistoryBuy {
    private int userID;
    private String bannersP;
    private String nameP;
    private int amountP;
    private int totalPriceP;
    private Payment paymentP;
    private OrderStatus statusP;
    private LocalDateTime createAtP;

    public HistoryBuy() {
    }

    public HistoryBuy(int userID, String bannersP, String nameP, int amountP, int totalPriceP, Payment paymentP, OrderStatus statusP, LocalDateTime createAtP) {
        this.userID = userID;
        this.bannersP = bannersP;
        this.nameP = nameP;
        this.amountP = amountP;
        this.totalPriceP = totalPriceP;
        this.paymentP = paymentP;
        this.statusP = statusP;
        this.createAtP = createAtP;
    }

    public HistoryBuy(String bannersP, String nameP, int amountP, int totalPriceP, Payment paymentP, OrderStatus statusP, LocalDateTime createAtP) {
        this.bannersP = bannersP;
        this.nameP = nameP;
        this.amountP = amountP;
        this.totalPriceP = totalPriceP;
        this.paymentP = paymentP;
        this.statusP = statusP;
        this.createAtP = createAtP;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getBannersP() {
        return bannersP;
    }

    public void setBannersP(String bannersP) {
        this.bannersP = bannersP;
    }

    public String getNameP() {
        return nameP;
    }

    public void setNameP(String nameP) {
        this.nameP = nameP;
    }

    public int getAmountP() {
        return amountP;
    }

    public void setAmountP(int amountP) {
        this.amountP = amountP;
    }

    public int getTotalPriceP() {
        return totalPriceP;
    }

    public void setTotalPriceP(int totalPriceP) {
        this.totalPriceP = totalPriceP;
    }

    public Payment getPaymentP() {
        return paymentP;
    }

    public void setPaymentP(Payment paymentP) {
        this.paymentP = paymentP;
    }

    public OrderStatus getStatusP() {
        return statusP;
    }

    public void setStatusP(OrderStatus statusP) {
        this.statusP = statusP;
    }

    public LocalDateTime getCreateAtP() {
        return createAtP;
    }

    public void setCreateAtP(LocalDateTime createAtP) {
        this.createAtP = createAtP;
    }

    @Override
    public String toString() {
        return "HistoryBuy{" + "userID=" + userID + ", bannersP=" + bannersP + ", nameP=" + nameP + ", amountP=" + amountP 
                + ", totalPriceP=" + totalPriceP + ", paymentP=" + paymentP + ", statusP=" + statusP + ", createAtP=" + createAtP + "\n" + '}' ;
    }
       
    
}
