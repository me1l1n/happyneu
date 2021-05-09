package com.example.controller;

import com.example.mapper.ProblemMapper;
import com.example.pojo.Problem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("problem")
public class ProblemController {

    @Autowired
    private ProblemMapper problemMapper;

    @RequestMapping("save")
    public void save(@RequestBody Problem problem){
        problem.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        if (problem.getId()!=null){
            problemMapper.updateByPrimaryKeySelective(problem);
        }else {
            problemMapper.insertSelective(problem);
        }
    }

    @RequestMapping("getList")
    public Object getList(){
        return problemMapper.selectByPrimaryKey();
    }
    @RequestMapping("del")
    public void del(@RequestBody Problem problem){
        problemMapper.deleteByPrimaryKey(problem.getId());
    }
}
