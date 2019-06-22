package cn.wzc.cloud.service.service_impl;

import cn.wzc.cloud.common.util.NetUtil;
import cn.wzc.cloud.dao.DBInfoDao;
import cn.wzc.cloud.dao.UserDao;
import cn.wzc.cloud.domain.DBInfo;
import cn.wzc.cloud.domain.User;
import cn.wzc.cloud.service.service_api.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;
import java.util.Random;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserDao userDao;
    @Autowired
    DBInfoDao dbInfoDao;
    @Override
    public int register(User user) {
        int userId;
        try {
            userId = userDao.insertUser(user);
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
        return userId;
    }

    @Override
    public int login(User user) {
        User u = new User();
        try {
            u = userDao.selectUser(user);
            if (u == null){
                return -1;
            }else{
                return u.getUserId();
            }
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    @Override
    public List<DBInfo> getDBList(int userId) {
        return userDao.selectOwnDBInfoById(userId);
    }

    @Override
    public boolean purchaseDB(DBInfo dbInfo) {
        try{
            //todo 执行shell创建，设置IP以及端口
            // 默认密码root
            Random random = new Random();
            int port = random.nextInt(15000)+50000;
            while (!NetUtil.isPortUsing("127.0.0.1", port)){
                port = random.nextInt(15000)+50000;
            }
            dbInfo.setPort(port);
            String cmd = "docker run -itd --name="+dbInfo.getDbId()+
                    " -p "+dbInfo.getPort()+":3306 "+
                    " -e MYSQL_ROOT_PASSWORD=\"root\" "+
                    " -m "+dbInfo.getRam()+
                    " --cpuset-cpus="+dbInfo.getCpu()+
                    " mysql:"+dbInfo.getVersion()+
                    " --default-authentication-plugin=mysql_native_password";
            Runtime runtime = Runtime.getRuntime();
            try {
                Process process = runtime.exec(cmd);
                int status = process.waitFor();
                if(status != 0){//执行失败
                    return false;
                }
                dbInfoDao.insertDB(dbInfo);
                return true;
            } catch (IOException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }


    }
}
