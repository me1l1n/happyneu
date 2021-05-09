package com.example.controller;

import com.example.mapper.AdvertisingMapper;
import com.example.pojo.Advertising;
import com.example.pojo.Leave;
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
@RequestMapping("advertising")
public class AdvertisingController {

    @Autowired
    private AdvertisingMapper advertisingMapper;

    @RequestMapping("save")
    public void save(@RequestBody Advertising advertising){
        advertising.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        if (advertising.getId()!=null){
            advertisingMapper.updateByPrimaryKeySelective(advertising);
        }else {
            advertisingMapper.insertSelective(advertising);
        }
    }

    @RequestMapping("upload")
    public Object upload(MultipartFile file, HttpServletRequest request) throws Exception {
        String oldFileName = file.getOriginalFilename();
        String newFileName = UUID.randomUUID().toString() + oldFileName.substring(oldFileName.indexOf("."));
        String path = request.getSession().getServletContext().getRealPath("/static") + File.separator + newFileName;
        File file1 = new File(path);
        if (!file1.isDirectory()) {
            file1.mkdirs();
        }
        file.transferTo(file1);
        Map map=new HashMap();
        Map map1=new HashMap();
        map.put("code", "0");
        map.put("msg", "上传成功");
        map1.put("src", "/static/"+newFileName);
        map1.put("title", "newFileName");
        map.put("data",map1);
        return map;
    }
    @RequestMapping("getList")
    public Object getList(){
        return advertisingMapper.selectByPrimaryKey();
    }
    @RequestMapping("del")
    public void del(@RequestBody Advertising advertising){
        advertisingMapper.deleteByPrimaryKey(advertising.getId());
    }
}
