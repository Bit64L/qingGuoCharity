package org.qingGuo.dao;

import org.qingGuo.model.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    List<User> getUser(Map<String, Object> map);
}