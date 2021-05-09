package com.example.controller;

import com.example.mapper.AccountMapper;
import com.example.mapper.OrderMapper;
import com.example.pojo.Account;
import com.example.pojo.Order;
import com.example.pojo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderMapper orderMapper;

    @RequestMapping("save")
    public void save(@RequestBody Order order){
        if (order.getId()!=null){
            orderMapper.updateByPrimaryKeySelective(order);
        }else {
            order.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            orderMapper.insertSelective(order);
        }
    }

    @RequestMapping("del")
    public void del(@RequestBody Order order){
        orderMapper.deleteByPrimaryKey(order.getId());
    }

    @RequestMapping("getList")
    public Object getList(@RequestBody(required = false) Order order){
        return orderMapper.getList(order);
    }

    @RequestMapping("findList")
    public Object findList(@RequestBody(required = false) Orders orders){
        return orderMapper.findList(orders);
    }

}
