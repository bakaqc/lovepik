package com.bakaqc.flower.model;

public class Categories {

    private int id;
    private String nameCAT;

    public Categories() {
    }

    public Categories(int id, String nameCAT) {
        this.id = id;
        this.nameCAT = nameCAT;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameCAT() {
        return nameCAT;
    }

    public void setNameCAT(String nameCAT) {
        this.nameCAT = nameCAT;
    }

    @Override
    public String toString() {
        return "Categories [ " + "Id = " + id + ", Name CAT = " + nameCAT + ']' + "\n";
    }

}
