package org.qingGuo.service.impl;


import org.qingGuo.common.PageParams;
import org.qingGuo.common.WXPayUtil;
import org.qingGuo.dao.OrderDao;
import org.qingGuo.model.*;
import org.qingGuo.service.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderService implements BaseService {
    @Resource
    OrderDao orderDao;
    @Resource
    TransactionService transactionService;
    @Resource
    OrderDetailService orderDetailService;
    @Resource
    ShoppingCartDetailService shoppingCartDetailService;
    @Resource
    ShoppingCartService shoppingCartService;

    @Override
    public List get(Map map) {
        return orderDao.get(map);
    }

    @Override
    public boolean insert(Map map) {
        return orderDao.insert(map);
    }

    @Override
    public boolean delete(Map map) {
        return orderDao.delete(map);
    }

    @Override
    public boolean update(Map map) {
        return orderDao.update(map);
    }

    public PageParams getByPage(Order order, String page) {
        int currPage = 1;
        if (page == null || page.equals("")) currPage = 1;
        try {
            currPage = Integer.parseInt(page);
        } catch (Exception e) {
            currPage = 1;
        }
        PageParams<Order> pageParams = new PageParams<>();
        pageParams.setCurrPage(currPage);
        Map<String, Object> map = new HashMap<>();
        map.put("order", order);
        int rowCount = orderDao.getRowCount(map);// 获得商品的总行数rowCount
        pageParams.setRowCount(rowCount);
        if (currPage > pageParams.getTotalPages())// 判断当前页的合法性
            currPage = pageParams.getTotalPages();
        else if (currPage < 1)
            currPage = 1;
        pageParams.setCurrPage(currPage);
        int offset = (pageParams.getCurrPage() - 1) * pageParams.pageSize;
        if (offset < 0) offset = 0;
        int size = pageParams.pageSize;

        Map<String, Object> searchParams = new HashMap<>();// 构造查询参数
        searchParams.put("order", order);
        searchParams.put("offset", offset);
        searchParams.put("size", size);
        pageParams.setData(get(searchParams));
        return pageParams;
    }

    public boolean pay(Order order, User user) {
        //order.setStatus(OrderValue.PAYED);
        order.setId(WXPayUtil.generateNonceStr());
        order.setUser(user);
        Map<String, Object> map = new HashMap<>();
        map.put("order", order);
        insert(map);
        ShoppingCart shoppingCart = user.getShoppingCart();
        for (OrderDetail orderDetail : order.getOrderDetails()) {
            orderDetail.setOrder(order);
            map = new HashMap<>();
            map.put("orderDetail", orderDetail);
            orderDetailService.insert(map);
            //transactionService.pay(user, orderDetail.getCommodity().getUser(), orderDetail.getGoodsMoney(), "订单");
            for(ShoppingCartDetail shoppingCartDetail : shoppingCart.getShoppingCartDetails()){
                if(orderDetail.getCommodity().getId() == shoppingCartDetail.getCommodity().getId()){
                    map.put("shoppingCartDetail",shoppingCartDetail);
                    shoppingCartDetailService.delete(map);
                    shoppingCartService.calCountAndMoney(shoppingCart);
                }
            }
        }
        return true;
    }
}
