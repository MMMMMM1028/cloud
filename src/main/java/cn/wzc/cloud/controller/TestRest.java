package cn.wzc.cloud.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestRest{
    @RequestMapping("/response")
    public String getResponseBody(){
        return "aaa";
    }
}
