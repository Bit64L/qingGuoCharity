package org.qingGuo.service.impl;


import org.qingGuo.dao.CommodityTypeDao;
import org.qingGuo.model.CommodityType;
import org.qingGuo.service.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class CommodityTypeService implements BaseService{

    @Resource
    CommodityTypeDao commodityTypeDao;


    public List get(Map map) {
        return commodityTypeDao.get(map);
    }

    public boolean insert(Map map) {
        return false;
    }

    public boolean delete(Map map) {
        return false;
    }

    public boolean update(Map map) {
        return false;
    }

    public List<CommodityType> getFirstClasses() {
        return commodityTypeDao.getFirstClasses();
    }
}
