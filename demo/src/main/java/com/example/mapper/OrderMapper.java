package com.example.mapper;

import com.example.pojo.Order;
import com.example.pojo.Orders;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    List<Map> getList(Order order);

    List<Map> findList(Orders orders);
}