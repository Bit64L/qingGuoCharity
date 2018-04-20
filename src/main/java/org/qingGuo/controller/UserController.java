package org.qingGuo.controller;


import org.qingGuo.model.User;
import org.qingGuo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Resource
    UserService userService;


    @RequestMapping(value = "addUser")
    public String addUser(User user){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("user",user);
        userService.addUsebr(map);
        return "/login";
    }

    @RequestMapping(value = "userCenter")
    public String userCenter(){
        return "user/userCenter";
    }

    @RequestMapping(value="userHead")
    public String userHead(){
        return "user/userHead";
    }

    @RequestMapping(value = "userPassword")
    public String userPassword(){
        return "user/userPassword";
    }
}
