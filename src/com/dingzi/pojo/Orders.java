package com.dingzi.pojo;

import java.util.Date;

public class Orders {
    private long id;
    private int good_id;
    private int user_id;
    private String address;
    private String good_size;
    private String good_color;
    private String good_image;
    private int money;
    private String telephone;
    private String date;
    private String state;
    public Orders() {
    }

    public Orders(long id, int good_id, int user_id, String address, String good_size, String good_color, String good_image, int money, String telephone, String date, String state) {
        this.id = id;
        this.good_id = good_id;
        this.user_id = user_id;
        this.address = address;
        this.good_size = good_size;
        this.good_color = good_color;
        this.good_image = good_image;
        this.money = money;
        this.telephone = telephone;
        this.date = date;
        this.state = state;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getGood_id() {
        return good_id;
    }

    public void setGood_id(int good_id) {
        this.good_id = good_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGood_size() {
        return good_size;
    }

    public void setGood_size(String good_size) {
        this.good_size = good_size;
    }

    public String getGood_color() {
        return good_color;
    }

    public void setGood_color(String good_color) {
        this.good_color = good_color;
    }

    public String getGood_image() {
        return good_image;
    }

    public void setGood_image(String good_image) {
        this.good_image = good_image;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", good_id=" + good_id +
                ", user_id=" + user_id +
                ", address='" + address + '\'' +
                ", good_size='" + good_size + '\'' +
                ", good_color='" + good_color + '\'' +
                ", good_image='" + good_image + '\'' +
                ", money=" + money +
                ", telephone='" + telephone + '\'' +
                ", date='" + date + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}
