package com.example.controller;

import com.example.mapper.AccountMapper;
import com.example.mapper.OrdersMapper;
import com.example.pojo.Account;
import com.example.pojo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("account")
public class AccountController {

    @Autowired
    private AccountMapper accountMapper;

    @Autowired
    private OrdersMapper ordersMapper;

    @RequestMapping("save")
    public void save(@RequestBody Account account){
        Integer id =  ordersMapper.sel(account.getId());
        account.setuId(id);
        accountMapper.insertSelective(account);
    }

    @RequestMapping("upl1")
    public void upl1(@RequestBody Account account){
        Account a1 = new Account();
        a1.setuId(account.getuId());
        a1.setMoney("-"+account.getMoney());
        a1.setType(1);
        accountMapper.insertSelective(a1);
        Account a2 = new Account();
        a2.setuId(account.getuId());
        a2.setMoney(account.getMoney());
        a2.setType(2);
        accountMapper.insertSelective(a2);

    }

    @RequestMapping("getList")
    public Object getList(@RequestBody Account account){
        return accountMapper.getList(account);
    }
}
