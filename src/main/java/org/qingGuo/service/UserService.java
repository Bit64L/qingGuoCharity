package org.qingGuo.service;


import org.qingGuo.dao.UserDao;
import org.qingGuo.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Resource
    UserDao userDao;

    public User getUser(Map<String,Object> map){
        List<User> users = userDao.getUser(map);
        return users.get(0);
    }

    public boolean addUser(Map<String, Object> map) {
        return true;
    }
}
