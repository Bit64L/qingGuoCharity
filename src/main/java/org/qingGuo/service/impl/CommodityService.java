package org.qingGuo.service.impl;

import org.qingGuo.common.PageParams;
import org.qingGuo.dao.CommodityDao;
import org.qingGuo.model.Commodity;
import org.qingGuo.model.User;
import org.qingGuo.service.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommodityService  implements BaseService{
    @Resource
    CommodityDao commodityDao;

    public List get(Map map) {
        List<Commodity> commodities = commodityDao.get(map);
        return commodities;
    }

    public boolean insert(Map map) {
        return commodityDao.insert(map);
    }

    public boolean delete(Map map) {

        return commodityDao.delete(map);
    }

    public boolean update(Map map) {
        return commodityDao.update(map);
    }

    public PageParams getCommoditiesByUser(int currPage, User user) {
        PageParams<Commodity> pageParams = new PageParams<>();
        Commodity commodity = new Commodity();
        User temp = new User();
        temp.setId(user.getId());
        commodity.setUser(temp);
        Map<String, Object> map = new HashMap<>();
        map.put("commodity",commodity);
        int rowCount = commodityDao.getRowCount(map);// 获得商品的总行数rowCount
        pageParams.setRowCount(rowCount);
        if (currPage > pageParams.getTotalPages())// 判断当前页的合法性
            currPage = pageParams.getTotalPages();
        else if (currPage < 1)
            currPage = 1;
        pageParams.setCurrPage(currPage);
        int offset = (pageParams.getCurrPage() - 1) * pageParams.pageSize;
        if(offset < 0) offset = 0;
        int size = pageParams.pageSize;

        Map<String, Object> searchParams = new HashMap<>();// 构造查询参数
        searchParams.put("commodity", commodity);
        searchParams.put("offset", offset);
        searchParams.put("size", size);
        pageParams.setData(get(searchParams));
        return pageParams;
    }

    public PageParams getByPage(Commodity commodity, String page) {
        int currPage = 1;
        if(page == null || page.equals("")) currPage = 1;
        try{
            currPage = Integer.parseInt(page);
        }catch (Exception e){
            currPage = 1;
        }
        PageParams<Commodity> pageParams = new PageParams<>();
        pageParams.setCurrPage(currPage);
        Map<String,Object> map = new HashMap<>();
        map.put("commodity",commodity);
        int rowCount = commodityDao.getRowCount(map);// 获得商品的总行数rowCount
        pageParams.setRowCount(rowCount);
        if (currPage > pageParams.getTotalPages())// 判断当前页的合法性
            currPage = pageParams.getTotalPages();
        else if (currPage < 1)
            currPage = 1;
        pageParams.setCurrPage(currPage);
        int offset = (pageParams.getCurrPage() - 1) * pageParams.pageSize;
        if(offset < 0) offset = 0;
        int size = pageParams.pageSize;

        Map<String, Object> searchParams = new HashMap<>();// 构造查询参数
        searchParams.put("commodity", commodity);
        searchParams.put("offset", offset);
        searchParams.put("size", size);
        pageParams.setData(get(searchParams));
        return pageParams;
    }
}
