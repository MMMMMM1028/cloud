package cn.wzc.cloud.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class IndexController {
//    @RequestMapping("/")
//    public String getIndex() {
//        return "index";
//    }
//    @RequestMapping("/login")
//    public String getLogin(){
//        return "login";
//    }
    @RequestMapping("/console")
    public String getConsole(){
        return "redirect:/db";
    }
}

