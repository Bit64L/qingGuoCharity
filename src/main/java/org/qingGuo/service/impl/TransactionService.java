package org.qingGuo.service.impl;


import org.qingGuo.dao.TransactionDao;
import org.qingGuo.model.Transaction;
import org.qingGuo.model.User;
import org.qingGuo.service.BaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TransactionService implements BaseService{
    @Resource
    TransactionDao transactionDao;
    @Resource
    UserService userService;


    @Override
    public List get(Map map) {
        return null;
    }

    @Override
    public boolean insert(Map map) {
        return transactionDao.insert(map);
    }

    @Override
    public boolean delete(Map map) {
        return false;
    }

    @Override
    public boolean update(Map map) {
        return false;
    }

    public boolean pay(User payer, User charger, double money, String type) {
        Transaction transaction = new Transaction();
        transaction.setCharger(charger);
        transaction.setPayer(payer);
        transaction.setMoney(money);
        transaction.setType(type);
        Map<String,Object> map = new HashMap<>();
        map.put("transaction",transaction);
        insert(map);
        //更新付款者余额
        payer.setAccountBalance(payer.getAccountBalance() - money);
        map.put("user",payer);
        userService.update(map);
        //更新收款者余额
        charger.setAccountBalance(charger.getAccountBalance() + money);
        map.put("user",charger);
        userService.update(map);
        return true;
    }
}
