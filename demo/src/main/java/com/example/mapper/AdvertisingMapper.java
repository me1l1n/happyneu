package com.example.mapper;

import com.example.pojo.Advertising;

import java.util.List;

public interface AdvertisingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Advertising record);

    int insertSelective(Advertising record);

    List<Advertising> selectByPrimaryKey();

    int updateByPrimaryKeySelective(Advertising record);

    int updateByPrimaryKey(Advertising record);
}