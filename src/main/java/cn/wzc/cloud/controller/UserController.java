package cn.wzc.cloud.controller;

import cn.wzc.cloud.domain.DBInfo;
import cn.wzc.cloud.domain.User;
import cn.wzc.cloud.service.service_api.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestBody User user, HttpServletRequest request){
        //todo 获取Request body的内容，无返回值，重定向到主界面，如果失败返回false，js解析alert\
        System.out.println(user.getUname());
        int userId = userService.login(user);
        if (userId != -1){//登陆成功跳转到主界面
            System.out.println("success");
            user.setUserId(userId);
            ObjectMapper mapper = new ObjectMapper();
            HttpSession session = request.getSession();
            session.setAttribute("uname",user.getUname());
            session.setAttribute("userId",user.getUserId());
            try {
                return mapper.writeValueAsString(user);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
                return null;
            }
        }
        //null代表登陆失败
        return null;
    }

    @RequestMapping(method = RequestMethod.PUT)
    @ResponseBody
    public String register(@RequestBody User user){
        int userId = userService.register(user);
        if (userId == -1){//注册失败
            return null;
        }else{
            ObjectMapper mapper = new ObjectMapper();
            try {
                return mapper.writeValueAsString(user);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
                return null;
            }
        }
    }



}
