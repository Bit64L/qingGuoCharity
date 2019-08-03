package org.qingGuo.model;

public class OrderDetail {
    private Integer id;
    private Order order;
    private Commodity commodity;
    private Integer goodsCount;
    private Double goodsMoney;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
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
