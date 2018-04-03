package org.qingGuo.service;


import org.qingGuo.dao.UserDao;
import org.qingGuo.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {
    @Resource
    UserDao userDao;

    public User getUser(User user){
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("user",user);
        return userDao.getUser(map);
    }
}
