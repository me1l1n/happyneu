package com.example.controller;

import com.example.mapper.OpinionMapper;
import com.example.pojo.Opinion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("opinion")
public class OpinionController {

    @Autowired
    private OpinionMapper opinionMapper;

    @RequestMapping("save")
    public void save(@RequestBody Opinion opinion){
        opinion.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        opinionMapper.insertSelective(opinion);
    }

    @RequestMapping("getList")
    public Object getList(){
        return opinionMapper.getList();
    }
}
