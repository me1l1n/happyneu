package com.example.mapper;

import com.example.pojo.Leave;

import java.util.List;
import java.util.Map;

public interface LeaveMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Leave record);

    int insertSelective(Leave record);

    List<Map> selectByPrimaryKey();

    int updateByPrimaryKeySelective(Leave record);

    int updateByPrimaryKey(Leave record);
}