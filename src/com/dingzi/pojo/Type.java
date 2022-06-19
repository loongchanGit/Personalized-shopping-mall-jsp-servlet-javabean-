package com.dingzi.pojo;

public class Type {
    private int id;
    private String type_name;

    public Type() {
    }

    public Type(int id, String type_name) {
        this.id = id;
        this.type_name = type_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    @Override
    public String toString() {
        return "Type{" +
                "id=" + id +
                ", type_name='" + type_name + '\'' +
                '}';
    }
}
