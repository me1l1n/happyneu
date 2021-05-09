package com.example.mapper;

import com.example.pojo.Problem;

import java.util.List;

public interface ProblemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Problem record);

    int insertSelective(Problem record);

    List<Problem> selectByPrimaryKey();

    int updateByPrimaryKeySelective(Problem record);

    int updateByPrimaryKey(Problem record);
}