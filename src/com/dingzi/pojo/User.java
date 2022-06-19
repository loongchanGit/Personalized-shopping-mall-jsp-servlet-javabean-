package com.dingzi.pojo;

public class User {
    private Integer id;
    private String username;
    private String password;
    private String telephone;
    private String email;
    private String state;

    public User() {
    }

    public User(Integer id, String username, String password, String telephone, String email, String state) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.telephone = telephone;
        this.email = email;
        this.state = state;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}
