package org.qingGuo.dao;

import java.util.List;
import java.util.Map;

public interface ShoppingCartDetailDao {
    List get(Map map);

    boolean insert(Map map);

    boolean delete(Map map);

    boolean update(Map map);
}
