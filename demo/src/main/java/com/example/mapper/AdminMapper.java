package com.example.mapper;

import com.example.pojo.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Admin admin);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}