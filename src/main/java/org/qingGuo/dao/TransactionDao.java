package org.qingGuo.dao;


import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface TransactionDao {
    boolean insert(Map map);
}
