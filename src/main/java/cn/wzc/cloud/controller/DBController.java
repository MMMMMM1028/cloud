package cn.wzc.cloud.controller;

import cn.wzc.cloud.domain.DBInfo;
import cn.wzc.cloud.service.service_api.DBService;
import cn.wzc.cloud.service.service_api.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/db")
public class DBController {
    @Autowired
    DBService dbService;
    @Autowired
    UserService userService;
    @RequestMapping(method = RequestMethod.PUT)
    @ResponseBody
    public String purchaseDB(@RequestBody DBInfo dbInfo, HttpServletRequest request){
        HttpSession session = request.getSession();
        int userId = (int)session.getAttribute("userId");
        dbInfo.setUserId(userId);
        boolean result = userService.purchaseDB(dbInfo);
        if (result){
            ObjectMapper mapper = new ObjectMapper();
            try {
                return mapper.writeValueAsString(dbInfo);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String getOwnDBList(HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
//        int userId = 1;
        List<DBInfo> dbInfoList = userService.getDBList(userId);
        model.addAttribute("dbList",dbInfoList);
        return "console";
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public String updateState(@RequestParam int dbId, @RequestParam String state){
        boolean result=false;
        if (state.equals("open")){
            result = dbService.startDB(dbId);
        }else if(state.equals("close")){
            result = dbService.stopDB(dbId);
        }
        return result?"success":null;
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public String removeDB(@RequestParam int dbId){
        boolean result= dbService.removeDB(dbId);
        return result?"success":null;
    }

}
