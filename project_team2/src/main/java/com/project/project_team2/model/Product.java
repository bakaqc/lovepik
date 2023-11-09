package com.project.project_team2.model;

public class Product {

    private int id;
    private int categoryId;
    private String name;
    private String banners;
    private String thumb;
    private int price;
    private String place_product;
    private String date_manufacture;
    private int number_of_product;
    private int number_left;

    public Product() {
    }

    public Product(int id, int categoryId, String name, String banners, String thumb, int price, String place_product, String date_manufacture, int number_of_product, int number_left) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.banners = banners;
        this.thumb = thumb;
        this.price = price;
        this.place_product = place_product;
        this.date_manufacture = date_manufacture;
        this.number_of_product = number_of_product;
        this.number_left = number_left;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
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

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPlace_product() {
        return place_product;
    }

    public void setPlace_product(String place_product) {
        this.place_product = place_product;
    }

    public String getDate_manufacture() {
        return date_manufacture;
    }

    public void setDate_manufacture(String date_manufacture) {
        this.date_manufacture = date_manufacture;
    }

    public int getNumber_of_product() {
        return number_of_product;
    }

    public void setNumber_of_product(int number_of_product) {
        this.number_of_product = number_of_product;
    }

    public int getNumber_left() {
        return number_left;
    }

    public void setNumber_left(int number_left) {
        this.number_left = number_left;
    }

    @Override
    public String toString() {
        return "Product [ " + "id = " + id + ", categoryId = " + categoryId + ", name = " + name
                + ", banners = " + banners + ", thumb = " + thumb + ", price = " + price + ", place_product = "
                + place_product + ", date_manufacture = " + date_manufacture + ", number_of_product = "
                + number_of_product + ", number_left = " + number_left + ']' + "\n";
    }

}
