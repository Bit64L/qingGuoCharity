package org.qingGuo.dao;

import java.util.List;
import java.util.Map;

public interface ShoppingCartDao {
    boolean insert(Map map);

    List get(Map map);

    boolean delete(Map map);

    boolean update(Map map);
}
