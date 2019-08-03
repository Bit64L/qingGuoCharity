package org.qingGuo.service.impl;


import org.qingGuo.dao.ShoppingCartDetailDao;
import org.qingGuo.model.Commodity;
import org.qingGuo.model.ShoppingCartDetail;
import org.qingGuo.model.User;
import org.qingGuo.service.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShoppingCartDetailService implements BaseService {
    @Resource
    ShoppingCartDetailDao shoppingCartDetailDao;
    @Resource
    CommodityService commodityService;
    @Resource
    UserService userService;

    @Override
    public List get(Map map) {
        return shoppingCartDetailDao.get(map);
    }

    @Override
    public boolean insert(Map map) {
        return shoppingCartDetailDao.insert(map);
    }

    @Override
    public boolean delete(Map map) {
        return shoppingCartDetailDao.delete(map);
    }

    @Override
    public boolean update(Map map) {
        return shoppingCartDetailDao.update(map);
    }

    public boolean addItem(User user, ShoppingCartDetail shoppingCartDetail) {
        user = userService.getLatestUser(user);
        boolean isExist = false;
        if (user.getShoppingCart().getShoppingCartDetails() != null)
            for (ShoppingCartDetail shoppingCartDetail1 : user.getShoppingCart().getShoppingCartDetails()) {
                if (shoppingCartDetail1.getCommodity().getId() == shoppingCartDetail.getCommodity().getId()) {
                    shoppingCartDetail.setId(shoppingCartDetail1.getId());
                    shoppingCartDetail.setGoodsCount(shoppingCartDetail.getGoodsCount() + shoppingCartDetail1.getGoodsCount());
                    shoppingCartDetail.setGoodsMoney(shoppingCartDetail.getGoodsCount() * shoppingCartDetail1.getCommodity().getPrice());
                    isExist = true;
                    break;
                }
            }
        if (!isExist) {
            Map<String, Object> map = new HashMap<>();
            map.put("commodity",shoppingCartDetail.getCommodity());
            List<Commodity> commodities = commodityService.get(map);
            shoppingCartDetail.setShoppingCart(user.getShoppingCart());
            shoppingCartDetail.setGoodsMoney(commodities.get(0).getPrice() * shoppingCartDetail.getGoodsCount());
            map.put("shoppingCartDetail",shoppingCartDetail);
            insert(map);
        } else {
            Map<String,Object> map = new HashMap<>();
            map.put("shoppingCartDetail",shoppingCartDetail);
            update(map);
        }
        return true;
    }
}
