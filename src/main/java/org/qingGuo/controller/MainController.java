package org.qingGuo.controller;


import org.qingGuo.common.TreeNode;
import org.qingGuo.model.CommodityType;
import org.qingGuo.model.User;
import org.qingGuo.service.impl.CommodityTypeService;
import org.qingGuo.service.impl.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {
    @Resource
    CommodityTypeService commodityTypeService;
    @Resource
    UserService userService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String main(HttpServletRequest request, ModelMap modelMap) {
        CommodityType commodityType = new CommodityType();
        Map<String, Object> map = new HashMap<>();
        map.put("commodityType", commodityType);
        List<CommodityType> commodityTypeList = commodityTypeService.get(map);
        List<CommodityType> firstClasses = commodityTypeService.getFirstClasses();
        List<TreeNode<String>> roots = new LinkedList<>();
        for (CommodityType commodityType1 : firstClasses) {
            TreeNode<String> root = new TreeNode<>();
            root.setData(commodityType1.getFirstClassName());
            root.setChildren(new LinkedList<>());
            roots.add(root);
            for (CommodityType commodityType2 : commodityTypeList) {
                if (commodityType2.getFirstClassName().equals(root.getData())) {
                    TreeNode<String> child = new TreeNode<>();
                    child.setData(commodityType2.getSecondClassName());
                    root.getChildren().add(child);
                }
            }
        }
        request.getServletContext().setAttribute("roots", roots);
        User user = (User) request.getSession().getAttribute("user");
        if (user != null)
            user = userService.getLatestUser(user);
            request.getSession().setAttribute("user", user);
        return "index";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/register")
    public String register() {
        return "register";
    }

}
