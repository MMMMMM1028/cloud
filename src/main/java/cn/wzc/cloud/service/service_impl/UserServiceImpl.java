package cn.wzc.cloud.service.service_impl;

import cn.wzc.cloud.dao.DBInfoDao;
import cn.wzc.cloud.dao.UserDao;
import cn.wzc.cloud.domain.DBInfo;
import cn.wzc.cloud.domain.User;
import cn.wzc.cloud.service.service_api.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserDao userDao;
    @Autowired
    DBInfoDao dbInfoDao;
    @Override
    @Transactional
    public boolean register(User user) {
        try {
            userDao.insertUser(user);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean login(User user) {
        try {
            userDao.selectUser(user);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public List<DBInfo> getDBList(int userId) {
        return userDao.selectOwnDBInfoById(userId);
    }

    @Override
    public boolean purchaseDB(DBInfo dbInfo) {
        try{
            dbInfoDao.insertDB(dbInfo);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
