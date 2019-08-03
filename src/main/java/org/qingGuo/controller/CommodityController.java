package org.qingGuo.controller;

import com.alibaba.fastjson.JSONObject;
import org.qingGuo.common.PageParams;
import org.qingGuo.model.Commodity;
import org.qingGuo.model.ShoppingCartDetail;
import org.qingGuo.model.User;
import org.qingGuo.service.impl.CommodityService;
import org.qingGuo.service.impl.ShoppingCartDetailService;
import org.qingGuo.service.impl.ShoppingCartService;
import org.qingGuo.service.impl.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.HttpRequestHandlerServlet;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/commodity")
public class CommodityController {
    @Resource
    CommodityService commodityService;
    @Resource
    ShoppingCartService shoppingCartService;
    @Resource
    ShoppingCartDetailService shoppingCartDetailService;
    @Resource
    UserService userService;


    @RequestMapping(value = "commodityCatalog")
    public String commodityCatalog(Commodity commodity, @RequestParam(value = "currPage", required = false) String page, HttpServletRequest request, ModelMap modelMap) {
        PageParams pageParams = commodityService.getByPage(commodity, page);
        modelMap.put("pageParams", pageParams);
        modelMap.put("firstClassName", commodity.getFirstClassName());
        modelMap.put("secondClassName", commodity.getSecondClassName());
        return "commodity/commodityCatalog";
    }

    @RequestMapping(value = "commodityInfo")
    public String commodityInfo(Commodity commodity,HttpServletRequest request,ModelMap modelMap) {
        Map<String,Object> map = new HashMap<>();
        map.put("commodity",commodity);
        List<Commodity> commodities = commodityService.get(map);
        modelMap.put("commodity",commodities.get(0));
        return "commodity/commodityInfo";
    }

    @RequestMapping(value = "shoppingCart")
    public String shoppingCart(HttpServletRequest request, ModelMap modelMap) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {//用户未登录
            modelMap.put("message", "请先登录");
            return "/index";
        }
        user = userService.getLatestUser(user);
        request.getSession().setAttribute("user",user);
        return "commodity/shoppingCart";
    }


    @RequestMapping(value = "addShoppingCart", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public @ResponseBody
    String addShoppingCart(ShoppingCartDetail shoppingCartDetail, HttpServletRequest request, ModelMap modelMap) {
        String message = "";
        JSONObject json = new JSONObject();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {//用户未登录
            message = "请先登录！";
            json.put("message", message);
            return json.toJSONString();
        }
        //更新shoppingCartDetail
        shoppingCartDetailService.addItem(user, shoppingCartDetail);
        //更新shoppingCart
        shoppingCartService.calCountAndMoney(user.getShoppingCart());
        user = userService.getLatestUser(user);
        request.getSession().setAttribute("user", user);
        json.put("shoppingCartTotalAmount", user.getShoppingCart().getTotalAmount());
        return json.toJSONString();
    }


    @RequestMapping(value = "updateShoppingCartDetailCount", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public @ResponseBody
    String updateShoppingCartDetailCount(ShoppingCartDetail oldShoppingCartDetail, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("shoppingCartDetail", oldShoppingCartDetail);
        List<ShoppingCartDetail> shoppingCartDetails = shoppingCartDetailService.get(map);
        ShoppingCartDetail shoppingCartDetail = shoppingCartDetails.get(0);
        shoppingCartDetail.setGoodsCount(oldShoppingCartDetail.getGoodsCount());
        shoppingCartDetail.setGoodsMoney(oldShoppingCartDetail.getGoodsCount() * shoppingCartDetail.getCommodity().getPrice());
        map.put("shoppingCartDetail", shoppingCartDetail);
        shoppingCartDetailService.update(map);
        User user = (User) request.getSession().getAttribute("user");
        user = userService.getLatestUser(user);
        shoppingCartService.calCountAndMoney(user.getShoppingCart());
        user = userService.getLatestUser(user);
        request.getSession().setAttribute("user", user);
        JSONObject json = new JSONObject();
        DecimalFormat df = new DecimalFormat("######0.00");
        json.put("shoppingCartTotalAmount", user.getShoppingCart().getTotalAmount());
        json.put("shoppingCartTotalMoney", df.format(user.getShoppingCart().getTotalMoney()));
        json.put("goodsMoney", df.format(shoppingCartDetail.getGoodsMoney()));
        return json.toJSONString();
    }


    @RequestMapping(value = "deleteShoppingCartDetail",method = RequestMethod.POST)
    public String deleteShoppingCartDetail(@RequestParam("ids") String[] ids,HttpServletRequest request){
        for(String id : ids){
            ShoppingCartDetail shoppingCartDetail = new ShoppingCartDetail();
            shoppingCartDetail.setId(Integer.parseInt(id));
            Map<String,Object> map = new HashMap<>();
            map.put("shoppingCartDetail",shoppingCartDetail);
            shoppingCartDetailService.delete(map);
        }
        User user = (User)request.getSession().getAttribute("user");
        user = userService.getLatestUser(user);
        shoppingCartService.calCountAndMoney(user.getShoppingCart());
        request.getSession().setAttribute("user",user);
        return "redirect:shoppingCart";
    }

    @RequestMapping(value = "search", method = RequestMethod.POST)
    public String search(Commodity commodity, HttpRequestHandlerServlet request, @RequestParam(value = "currPage", required = false) String page,ModelMap modelMap){
        PageParams<Commodity> pageParams = commodityService.getByPage(commodity,page);
        String firstClassName = commodity.getName();
        modelMap.put("pageParams",pageParams);
        modelMap.put("firstClassName","关键词："+firstClassName);
        return "commodity/commodityCatalog";
    }

}
