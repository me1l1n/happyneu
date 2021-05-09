package com.example.controller;

import com.example.mapper.LeaveMapper;
import com.example.pojo.Leave;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("leave")
public class LeaveController {
    @Autowired
    private LeaveMapper leaveMapper;
    @RequestMapping("save")
    public void save(@RequestBody Leave leave){
        leave.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        if (leave.getId()!=null){
            leaveMapper.updateByPrimaryKeySelective(leave);
        }else {
            leaveMapper.insertSelective(leave);
        }
    }
    @RequestMapping("getList")
    public Object getList(){
        return leaveMapper.selectByPrimaryKey();
    }
    @RequestMapping("del")
    public void del(@RequestBody Leave leave){
        leaveMapper.deleteByPrimaryKey(leave.getId());
    }
}
