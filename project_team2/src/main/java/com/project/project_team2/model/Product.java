package com.project.project_team2.model;

import java.util.List;

public class Product {

    private int id;
    private int categoryID;
    private String name;
    private String banners;
    private List<String> thumb;
    private int price;
    private String detail;

    public Product() {
    }

    public Product(int id, int categoryID, String name, String banners, List<String> thumb, int price, String detail) {
        this.id = id;
        this.categoryID = categoryID;
        this.name = name;
        this.banners = banners;
        this.thumb = thumb;
        this.price = price;
        this.detail = detail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryID;
    }

    public void setCategoryId(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBanners() {
        return banners;
    }

    public void setBanners(String banners) {
        this.banners = banners;
    }

    public List<String> getThumb() {
        return thumb;
    }

    public void setThumb(List<String> thumb) {
        this.thumb = thumb;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Product [ " + "ID = " + id + ", Category ID = " + categoryID + ", Name = " + name
                + ", Banners = " + banners + ", Thumb = " + thumb + ", Price = " 
                + price + ", Detail = " + detail + ']' + "\n";
    }

}
