package org.qingGuo.controller;


import org.qingGuo.model.User;
import org.qingGuo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.annotation.Resource;

@Controller
public class UserController {
    @Resource
    UserService userService;


    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String main() {
        return "index";
    }

    @RequestMapping(value = "/user")
    public String test(ModelMap modelMap, HttpServletRequest request) {
        String id = request.getParameter("id");
        User user = new User();
        user.setId(Integer.parseInt(id));
        userService.getUser(user);
        modelMap.put("user", user);
        return "index";
    }
}
