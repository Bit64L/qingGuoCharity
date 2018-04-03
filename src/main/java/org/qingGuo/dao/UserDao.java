package org.qingGuo.dao;


import org.qingGuo.model.User;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface UserDao {

    User getUser(Map<String,Object> map);
}
