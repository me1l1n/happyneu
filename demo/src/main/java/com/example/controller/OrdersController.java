package com.example.controller;

import com.example.mapper.OrderMapper;
import com.example.mapper.OrdersMapper;
import com.example.pojo.Order;
import com.example.pojo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("orders")
public class OrdersController {

    @Autowired
    private OrdersMapper ordersMapper;

    @Autowired
    private OrderMapper orderMapper;

    @RequestMapping("save")
    public void save(@RequestBody Orders orders){
        Order order = new Order();
        order.setId(orders.getoId());
        order.setStatus("已接单");
        orderMapper.updateByPrimaryKeySelective(order);
        ordersMapper.insertSelective(orders);
    }

    @RequestMapping("del")
    public void del(@RequestBody Orders orders){
        Orders orders1 = ordersMapper.selectByPrimaryKey(orders.getId());
        Order order = new Order();
        order.setStatus("待接单");
        order.setId(orders1.getoId());
        orderMapper.updateByPrimaryKeySelective(order);
        ordersMapper.deleteByPrimaryKey(orders.getId());
    }
}
