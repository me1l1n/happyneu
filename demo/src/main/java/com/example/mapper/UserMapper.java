package com.example.mapper;

import com.example.pojo.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(String id);

    int insertSelective(Map map);

    List<User> selectByPrimaryKey();

    int updateByPrimaryKeySelective(User record);

    @Select("select * from `user` where openId=#{openId}")
    Map sel(String openId);
}