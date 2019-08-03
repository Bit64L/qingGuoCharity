package org.qingGuo.controller;


import org.qingGuo.common.OrderValue;
import org.qingGuo.common.PageParams;
import org.qingGuo.model.*;
import org.qingGuo.service.impl.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
    @Resource
    ShoppingCartDetailService shoppingCartDetailService;
    @Resource
    OrderService orderService;
    @Resource
    UserService userService;

    @RequestMapping(value = "orderCreate")
    public String orderCreate(String[] ids, HttpServletRequest request, ModelMap modelMap) {
        if (ids == null || ids.length == 0) return "error/error";
        Order order = new Order();
        List<OrderDetail> orderDetails = new LinkedList<>();
        Map<String, Object> map = new HashMap<>();
        int totalAmount = 0;
        double totalMoney = 0;
        for (String id : ids) {
            ShoppingCartDetail shoppingCartDetail = new ShoppingCartDetail();
            shoppingCartDetail.setId(Integer.parseInt(id));
            map.put("shoppingCartDetail", shoppingCartDetail);
            List<ShoppingCartDetail> shoppingCartDetails = shoppingCartDetailService.get(map);
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setCommodity(shoppingCartDetails.get(0).getCommodity());
            orderDetail.setGoodsCount(shoppingCartDetails.get(0).getGoodsCount());
            orderDetail.setGoodsMoney(shoppingCartDetails.get(0).getGoodsMoney());
            orderDetails.add(orderDetail);
            totalAmount += shoppingCartDetails.get(0).getGoodsCount();
            totalMoney += shoppingCartDetails.get(0).getGoodsMoney();
        }
        order.setType(OrderValue.Commodity_TYPE);
        order.setOrderDetails(orderDetails);
        order.setTotalAmount(totalAmount);
        order.setTotalMoney(totalMoney);
        order.setStatus(OrderValue.WAIT_TO_PAY);
        request.getSession().setAttribute("order", order);
        //持久化
        User user = (User)request.getSession().getAttribute("user");
        orderService.pay(order,user);
        modelMap.put("order", order);
        return "order/orderCreation";
    }

    @RequestMapping(value = "orderCreateSave")
    public String orderCreateSave(HttpServletRequest request,ModelMap modelMap) {
        Order order = (Order) request.getSession().getAttribute("order");
        if (order == null) return "error";
        User user = (User)request.getSession().getAttribute("user");
        if(user.getAccountBalance() < order.getTotalMoney()){
            String message = "支付失败，余额不足！";
            modelMap.put("message",message);
            return "order/orderCreation";
        }
        orderService.pay(order,user);
        user = userService.getLatestUser(user);
        request.getSession().setAttribute("user",user);
        return "redirect:orderManage";
    }

    @RequestMapping(value = "orderManage")
    public String orderManage(HttpServletRequest request, @RequestParam(value = "page", required = false) String page, ModelMap modelMap) {
        User user = (User) request.getSession().getAttribute("user");
        Order order = new Order();
        order.setUser(user);
        order.setType(OrderValue.Commodity_TYPE);
        PageParams<Order> pageParams = orderService.getByPage(order, page);
        modelMap.put("pageParams", pageParams);
        return "order/orderManage";
    }


    @RequestMapping(value = "statusChange")
    public String statusChange(@RequestParam(value = "status") String status, Order order) {
        if (status.equals("取消")) {
            order.setStatus(OrderValue.CANCELED);
        }
        Map<String, Object> map = new HashMap<>();
        map.put("order", order);
        orderService.update(map);
        return "redirect:orderManage";

    }

    @RequestMapping(value = "orderDelete")
    public String orderDelete(Order order) {
        Map<String, Object> map = new HashMap<>();
        map.put("order", order);
        orderService.delete(map);
        return "redirect:orderManage";
    }


    @RequestMapping(value = "orderInfo")
    public String orderInfo(Order order,ModelMap modelMap) {
        Map<String, Object> map = new HashMap<>();
        map.put("order", order);
        List<Order> list = orderService.get(map);
        modelMap.put("order",list.get(0));
        return "order/orderInfo";
    }
}
