package org.qingGuo.service.impl;


import org.junit.Test;
import org.qingGuo.common.OrderValue;
import org.qingGuo.dao.UserDao;
import org.qingGuo.model.Order;
import org.qingGuo.model.User;
import org.qingGuo.service.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService implements BaseService {
    @Resource
    UserDao userDao;
    @Resource
    OrderService orderService;

    public List<User> get(Map map) {
        List<User> users = userDao.get(map);
        return users;
    }

    public boolean insert(Map map) {
        boolean status = userDao.insert(map);
        return status;
    }

    public boolean update(Map map) {
        boolean status = userDao.update(map);
        return status;
    }

    public boolean delete(Map map) {
        return false;
    }


    public void headSave(MultipartFile file, String uploadUrl) {
        if (file.getSize() == 0) return;
        String filename = file.getOriginalFilename().hashCode() + "";
        File dir = new File(uploadUrl);// 创建文件夹
        if (!dir.exists()) {
            dir.mkdirs();
        }
        System.out.println("文件上传到: " + uploadUrl + "/" + filename);
        File targetFile = new File(uploadUrl + "/" + filename);// 创建文件
        if (!targetFile.exists()) {
            try {
                targetFile.createNewFile();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        try {
            file.transferTo(targetFile);
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    @Test
    public void test(){
        File dir = new File("/Users/Lwx/Workspace/usst/qingGuoCharity/upload");// 创建文件夹
        if (!dir.exists()) {
            dir.mkdirs();
        }
    }


    public User getLatestUser(User user) {
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("user",user);
        List<User>  users= get(map);
        return users.get(0);
    }

    public void mentorUpdate(User user) {
        user.setRole("导师");
        user.setDepositStatus("已缴费");
        Map<String,Object> map = new HashMap<>();
        map.put("user",user);
        update(map);
    }

    public boolean checkDepositSuccess(User user) {
        Order order = new Order();
        order.setUser(user);
        order.setType(OrderValue.Deposit_TYPE);
        Map<String,Object> map = new HashMap<>();
        map.put("order",order);
        List<Order> orders = orderService.get(map);
        order = orders.get(0);
        if(order.getStatus().equals(OrderValue.PAYED))
            return true;
        else
            return false;
    }
}
