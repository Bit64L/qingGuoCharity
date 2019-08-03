package org.qingGuo.dao;

import java.util.List;
import java.util.Map;

public interface CommodityTypeDao {
    List get(Map map);

    List getFirstClasses();
}
