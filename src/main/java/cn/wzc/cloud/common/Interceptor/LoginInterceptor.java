package cn.wzc.cloud.common.Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String servletPath = request.getServletPath();
        HttpSession session = request.getSession();
        //访问登陆页面,主界面通过
        if (servletPath.equals("login") || servletPath.equals("/")){
            return true;
        }
        // 已经登陆
        if (session.getAttribute("userId") != null){
            return true;
        }
        try {
            response.sendRedirect(request.getContextPath()+"/login");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
}
