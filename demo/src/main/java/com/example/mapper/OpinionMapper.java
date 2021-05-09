package com.example.mapper;

import com.example.pojo.Opinion;

import java.util.List;
import java.util.Map;

public interface OpinionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Opinion record);

    int insertSelective(Opinion record);

    Opinion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Opinion record);

    int updateByPrimaryKey(Opinion record);

    List<Map> getList();
}