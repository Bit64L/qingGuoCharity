package org.qingGuo.dao;

import org.qingGuo.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserDao {
    List<User> get(Map<String, Object> map);

    boolean insert(Map<String, Object> map);

    boolean update(Map map);
}