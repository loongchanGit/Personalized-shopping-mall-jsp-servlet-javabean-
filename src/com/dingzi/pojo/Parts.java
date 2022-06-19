package com.dingzi.pojo;

import java.util.Set;

public class Parts {
    private int good_id;
    private String color;
    private String size;
    private String image;

    public Parts() {
    }

    public Parts(int good_id, String color, String size, String image) {
        this.good_id = good_id;
        this.color = color;
        this.size = size;
        this.image = image;
    }

    public int getGood_id() {
        return good_id;
    }

    public void setGood_id(int good_id) {
        this.good_id = good_id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Parts{" +
                "good_id=" + good_id +
                ", color='" + color + '\'' +
                ", size='" + size + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
