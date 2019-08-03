package org.qingGuo.model;

import java.util.List;

public class ShoppingCart {
    private Integer id;

    private User user;

    List<ShoppingCartDetail>  shoppingCartDetails;

    private Integer totalAmount;

    private Double totalMoney;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<ShoppingCartDetail> getShoppingCartDetails() {
        return shoppingCartDetails;
    }

    public void setShoppingCartDetails(List<ShoppingCartDetail> shoppingCartDetails) {
        this.shoppingCartDetails = shoppingCartDetails;
    }

    public Integer getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Integer totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(Double totalMoney) {
        this.totalMoney = totalMoney;
    }
}