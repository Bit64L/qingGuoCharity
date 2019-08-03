package org.qingGuo.model;

public class ShoppingCartDetail {
    private Integer id;

    private ShoppingCart shoppingCart;

    private Commodity commodity;

    private Integer goodsCount;

    private Double goodsMoney;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ShoppingCart getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(ShoppingCart shoppingCart) {
        this.shoppingCart = shoppingCart;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public Integer getGoodsCount() {
        return goodsCount;
    }

    public void setGoodsCount(Integer goodsCount) {
        this.goodsCount = goodsCount;
    }

    public Double getGoodsMoney() {
        return goodsMoney;
    }

    public void setGoodsMoney(Double goodsMoney) {
        this.goodsMoney = goodsMoney;
    }
}