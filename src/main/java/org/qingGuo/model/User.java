package org.qingGuo.model;

import java.util.Date;

public class User {
    private Integer id;

    private String name;

    private String phone;

    private Date createTime;

    private String password;

    private String role;

    private String account;

    private Date loginTime;

    private String email;

    private String company;

    public User(Integer id, String name, String phone, Date createTime, String password, String role, String account, Date loginTime, String email, String company) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.createTime = createTime;
        this.password = password;
        this.role = role;
        this.account = account;
        this.loginTime = loginTime;
        this.email = email;
        this.company = company;
    }

    public User() {
        super();
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
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company == null ? null : company.trim();
    }
}