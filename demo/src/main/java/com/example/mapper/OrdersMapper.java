package com.example.mapper;

import com.example.pojo.Orders;
import org.apache.ibatis.annotations.Select;

public interface OrdersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);

    @Select("select u_id from orders where o_id = #{id}")
    int sel(Integer id);
}