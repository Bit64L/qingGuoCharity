package org.qingGuo.dao;


import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface OrderDao {
    List get(Map map);

    boolean insert(Map map);

    boolean delete(Map map);

    boolean update(Map map);

    int getRowCount(Map<String, Object> map);
}
