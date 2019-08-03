package org.qingGuo.dao;

import org.qingGuo.model.Commodity;

import java.util.List;
import java.util.Map;

public interface CommodityDao{
    int getRowCount(Map<String, Object> map);

    List<Commodity> get(Map map);

    boolean update(Map map);

    boolean insert(Map map);

    boolean delete(Map map);
}
