package org.qingGuo.service.impl;


import org.qingGuo.dao.ShoppingCartDao;
import org.qingGuo.model.ShoppingCart;
import org.qingGuo.model.ShoppingCartDetail;
import org.qingGuo.service.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShoppingCartService implements BaseService {
    @Resource
    ShoppingCartDao shoppingCartDao;


    public List get(Map map) {
        return shoppingCartDao.get(map);
    }

    public boolean insert(Map map) {
        return shoppingCartDao.insert(map);
    }

    public boolean delete(Map map) {
        return shoppingCartDao.delete(map);
    }

    public boolean update(Map map) {
        return shoppingCartDao.update(map);
    }

    public ShoppingCart calCountAndMoney(ShoppingCart shoppingCart) {
        Map<String, Object> map = new HashMap<>();
        map.put("shoppingCart", shoppingCart);
        List<ShoppingCart> shoppingCarts = get(map);
        shoppingCart = shoppingCarts.get(0);
        int totalCount = 0;
        double totalMoney = 0;
        if (shoppingCart.getShoppingCartDetails() != null)
            for (ShoppingCartDetail shoppingCartDetail : shoppingCart.getShoppingCartDetails()) {
                totalCount += shoppingCartDetail.getGoodsCount();
                totalMoney += shoppingCartDetail.getGoodsMoney();
            }
        shoppingCart.setTotalAmount(totalCount);
        shoppingCart.setTotalMoney(totalMoney);
        map.put("shoppingCart", shoppingCart);
        update(map);
        return shoppingCart;
    }
}
