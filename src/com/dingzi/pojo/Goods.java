package com.dingzi.pojo;

public class Goods {
    private Integer id;
    private String name;
    private int price;
    private String type;
    private int hot;
    private String path;
    private int sale;

    public Goods() {
    }

    public Goods(Integer id, String name, int price, String type, int hot, String path, int sale) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.type = type;
        this.hot = hot;
        this.path = path;
        this.sale = sale;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", type='" + type + '\'' +
                ", hot=" + hot +
                ", path='" + path + '\'' +
                ", sale=" + sale +
                '}';
    }
}
