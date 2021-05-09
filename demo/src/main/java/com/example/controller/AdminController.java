package com.example.controller;

import com.example.mapper.AdminMapper;
import com.example.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private AdminMapper adminMapper;
    @RequestMapping("login")
    public Object login(@RequestBody Admin admin, HttpServletRequest request){
        Admin admin1=adminMapper.selectByPrimaryKey(admin);
        if (admin1!=null){
            request.getSession().setAttribute("admin",admin1);
            return 1;
        }else {
            return 0;
        }
    }
}
