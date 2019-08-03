package org.qingGuo.controller;


import org.qingGuo.common.OrderValue;
import org.qingGuo.common.WXPayUtil;
import org.qingGuo.model.Order;
import org.qingGuo.model.ShoppingCart;
import org.qingGuo.model.User;
import org.qingGuo.service.impl.OrderService;
import org.qingGuo.service.impl.ShoppingCartService;
import org.qingGuo.service.impl.TransactionService;
import org.qingGuo.service.impl.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Resource
    UserService userService;
    @Resource
    ShoppingCartService shoppingCartService;
    @Resource
    TransactionService transactionService;
    @Resource
    OrderService orderService;


    @RequestMapping(value = "loginAction")
    public String loginAction(User user, ModelMap modelMap, HttpServletRequest request) {
        String message = "";
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user", user);
        List<User> users = userService.get(map);
        if (users == null || users.size() == 0) {
            message = "用户名或密码错误";
            modelMap.put("message", message);
            return "/login";
        }
        user = users.get(0);
        //如果该用户没有创建购物车则创建
        if (user.getShoppingCart() == null) {
            ShoppingCart shoppingCart = new ShoppingCart();
            shoppingCart.setUser(user);
            map = new HashMap<>();
            map.put("shoppingCart", shoppingCart);
            shoppingCartService.insert(map);
            user.setShoppingCart(shoppingCart);
            map.put("user", user);
            userService.update(map);
        }
        request.getSession().setAttribute("user", user);
        modelMap.put("user", user);
        return "/index";
    }

    @RequestMapping(value = "addUser")
    public String addUser(User user, ModelMap modelMap) {
        Map<String, Object> map = new HashMap<String, Object>();
        user.setHeadUrl("/qingguo/images/head.jpeg");
        map.put("user", user);
        user.setDepositStatus("未缴费");//设置默认值
        boolean status = userService.insert(map);
        String message = "";
        if (status) message = "注册成功";
        else message = "注册失败";
        modelMap.put("message", message);
        return "/login";
    }

    @RequestMapping(value = "userCenter")
    public String userCenter(HttpServletRequest request) {

        User user = (User) request.getSession().getAttribute("user");
        user = userService.getLatestUser(user);
        request.getSession().setAttribute("user", user);
        return "user/userCenter";
    }

    @RequestMapping(value = "userCenterSave")
    public String userCenterSave(User user, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user", user);
        boolean success = userService.update(map);
        List<User> users = userService.get(map);
        request.getSession().setAttribute("user", users.get(0));
        return "redirect:userCenter";
    }

    @RequestMapping(value = "userHead")
    public String userHead(HttpServletRequest request, ModelMap modelMap) {
        User user = (User) request.getSession().getAttribute("user");
        modelMap.put("user", user);
        return "user/userHead";
    }

    @RequestMapping(value = "userHeadSave")
    public String userHeadSave(@RequestParam(value = "imageFile") MultipartFile imageFile, HttpServletRequest request) {
        String uploadUrl = "/Users/Lwx/Workspace/usst/qingGuoCharity/upload";
        User user = (User) request.getSession().getAttribute("user");
        userService.headSave(imageFile, uploadUrl + "/" + user.getId());
        user.setHeadUrl("/qingguo/upload/" + user.getId() + "/" + imageFile.getOriginalFilename().hashCode());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user", user);
        userService.update(map);
        return "redirect:userHead";
    }

    @RequestMapping(value = "userPassword")
    public String userPassword(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user", user);
        List<User> users = userService.get(map);
        request.getSession().setAttribute("user", users.get(0));
        return "user/userPassword";
    }

    @RequestMapping(value = "userPasswordModify")
    public String userPasswordModify(@RequestParam(value = "password") String password, @RequestParam(value = "newPassword") String newPassword, HttpServletRequest request, ModelMap modelMap) {
        User user = (User) request.getSession().getAttribute("user");
        String message = "修改成功";
        if (!password.equals(user.getPassword())) {
            message = "密码错误";
            modelMap.put("message", message);
            return "user/userPassword";
        }
        user.setPassword(newPassword);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user", user);
        userService.update(map);
        modelMap.put("message", message);
        return "user/userPassword";
    }

    @RequestMapping(value = "logOut")
    public String logOut(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return "/index";
    }

    @RequestMapping(value = "teacherRegister")
    public String teacherRegister(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        user = userService.getLatestUser(user);
        request.getSession().setAttribute("user", user);
        return "user/teacherRegister";
    }

//    @RequestMapping(value = "teacherRegisterPay")
//    public String teacherRegisterPay(User teacherInfo, HttpServletRequest request, ModelMap modelMap) {
//        User user = (User) request.getSession().getAttribute("user");
//        user= userService.getLatestUser(user);
//        if (user.getAccountBalance() < OrderValue.deposit) {
//            String message = "余额不足，支付失败！";
//            modelMap.put("message", message);
//            return "user/teacherRegister";
//        }
//        user.setPs(teacherInfo.getPs());
//        user.setIdCard(teacherInfo.getIdCard());
//        user.setField(teacherInfo.getField());
//        User charger  = new User();
//        charger.setId(1);
//        Map<String,Object> map = new HashMap<>();
//        map.put("user",charger);
//        List<User> chargers = userService.get(map);
//        boolean status = transactionService.pay(user,chargers.get(0),OrderValue.deposit,"押金");
//        if(status){
//            userService.mentorUpdate(user);
//        }
//        request.getSession().setAttribute("user",user);
//        return "redirect:userCenter";
//    }


    @RequestMapping(value = "teacherRegisterPay")
    public String teacherRegisterPay(User teacherInfo, HttpServletRequest request, ModelMap modelMap) {
        Order order = new Order();
        order.setType(OrderValue.Deposit_TYPE);
        order.setTotalAmount(1);
        order.setTotalMoney(OrderValue.deposit);
        order.setId(WXPayUtil.generateNonceStr());
        User user = (User) request.getSession().getAttribute("user");
        order.setUser(user);
        Map<String, Object> map = new HashMap<>();
        map.put("order", order);
        orderService.insert(map);
        request.getSession().setAttribute("teacherInfo", teacherInfo);
        return "redirect:/wxpay/pay?id=" + order.getId();
    }


    @RequestMapping(value = "addTeacherInfo")
    public String addTeacherInfo(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        boolean status = userService.checkDepositSuccess(user);
        if (status) {
            User teacherInfo = (User) request.getSession().getAttribute("teacherInfo");
            user = userService.getLatestUser(user);
            user.setPs(teacherInfo.getPs());
            user.setIdCard(teacherInfo.getIdCard());
            user.setField(teacherInfo.getField());
            userService.mentorUpdate(user);
            request.getSession().setAttribute("user", user);
        }
        return "redirect: userCenter";
    }

}
