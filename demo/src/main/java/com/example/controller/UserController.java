package com.example.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.mapper.UserMapper;
import com.example.pojo.User;
import com.example.util.AesCbcUtil;
import com.example.util.HttpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserMapper userMapper;
    @RequestMapping("add")
    @ResponseBody
    public Object add(String code,String encryptedData,String iv){
        Map map = new HashMap();
        //登录凭证不能为空
        if (code == null || code.length() == 0) {
            map.put("status", 0);
            map.put("msg", "code 不能为空");
            return map;
        }
        //小程序唯一标识   (在微信小程序管理后台获取)
        String wxspAppid = "wx02361fa853464b6e";
        //小程序的 app secret (在微信小程序管理后台获取)
        String wxspSecret = "3b212dc9929b87f8dbb19c720d7a55da";
        //授权（必填）
        String grant_type = "authorization_code";


        //////////////// 1、向微信服务器 使用登录凭证 code 获取 session_key 和 openid ////////////////
        //请求参数
        String params = "appid=" + wxspAppid + "&secret=" + wxspSecret + "&js_code=" + code + "&grant_type=" + grant_type;
        //发送请求
        String sr = HttpUtil.get("https://api.weixin.qq.com/sns/jscode2session?"+params);
        //解析相应内容（转换成json对象）
        JSONObject json = JSONObject.parseObject(sr);
        //获取会话密钥（session_key）
        String session_key = json.get("session_key").toString();
        //用户的唯一标识（openid）
        String openid = (String) json.get("openid");

        //////////////// 2、对encryptedData加密数据进行AES解密 ////////////////
        try {
            String result = AesCbcUtil.getUserInfo(encryptedData, session_key, iv);
            if (null != result && result.length() > 0) {
                map.put("status", 1);
                map.put("msg", "解密成功");

                JSONObject userInfoJSON = JSONObject.parseObject(result);
                if (userMapper.sel(openid)==null) {
                    Map userInfo = new HashMap();
                    userInfo.put("openId", userInfoJSON.get("openId"));
                    userInfo.put("nickName", userInfoJSON.get("nickName"));
                    userInfo.put("gender", userInfoJSON.get("gender"));
                    userInfo.put("city", userInfoJSON.get("city"));
                    userInfo.put("province", userInfoJSON.get("province"));
                    userInfo.put("country", userInfoJSON.get("country"));
                    userInfo.put("avatarUrl", userInfoJSON.get("avatarUrl"));
                    userInfo.put("unionId", userInfoJSON.get("unionId"));
                    userMapper.insertSelective(userInfo);
                    map.put("userInfo", userInfo);
                    return map;
                }else {
                    Map userInfo = userMapper.sel(openid);
                    map.put("userInfo", userInfo);
                    return map;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("status", 0);
        map.put("msg", "解密失败");
        return map;
    }
    @RequestMapping("getList")
    @ResponseBody
    public Object getList(){
        return userMapper.selectByPrimaryKey();
    }
    @RequestMapping("del")
    @ResponseBody
    public Object del(String openId){
        return userMapper.deleteByPrimaryKey(openId);
    }

    @RequestMapping("upl")
    @ResponseBody
    public Object upl(@RequestBody User user){
        userMapper.updateByPrimaryKeySelective(user);
        return userMapper.sel(user.getOpenid());
    }
    @RequestMapping("userInfo")
    @ResponseBody
    public Object userInfo(String openid){
        return userMapper.sel(openid);
    }
}
