package com.bakaqc.flower.model;

public class DataOrder {

    private int oderID;
    private int productID;
    private int amount;

    public DataOrder() {
    }

    public DataOrder(int oderID, int productID, int amount) {
        this.oderID = oderID;
        this.productID = productID;
        this.amount = amount;
    }

    public int getOderID() {
        return oderID;
    }

    public void setOderID(int oderID) {
        this.oderID = oderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "DataOder [ " + "Oder ID = " + oderID + ", Product ID = " + productID + ", amount = " + amount + '}' + "\n";
    }

}
