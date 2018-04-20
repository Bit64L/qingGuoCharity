package org.qingGuo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/commodity")
public class CommodityController {
    @RequestMapping(value="commodityCatalog")
    public String commodityCatalog(){
        return "commodity/commodityCatalog";
    }

    @RequestMapping(value = "commodityInfo")
    public String commodityInfo(){
        return "commodity/commodityInfo";
    }

    @RequestMapping(value="shoppingCart")
    public String shoppingCart(){
        return "commodity/shoppingCart";
    }
}
