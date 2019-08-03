package org.qingGuo.service.impl;


import org.qingGuo.dao.OrderDetailDao;
import org.qingGuo.service.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class OrderDetailService implements BaseService{

    @Resource
    OrderDetailDao orderDetailDao;

    @Override
    public List get(Map map) {
        return orderDetailDao.get(map);
    }

    @Override
    public boolean insert(Map map) {
        return orderDetailDao.insert(map);
    }

    @Override
    public boolean delete(Map map) {
        return orderDetailDao.delete(map);
    }

    @Override
    public boolean update(Map map) {
        return orderDetailDao.update(map);
    }
}
