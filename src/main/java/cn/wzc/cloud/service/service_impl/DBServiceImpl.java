package cn.wzc.cloud.service.service_impl;

import cn.wzc.cloud.dao.DBInfoDao;
import cn.wzc.cloud.service.service_api.DBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class DBServiceImpl implements DBService{
    @Autowired
    DBInfoDao dbInfoDao;
    @Override
    public boolean stopDB(int dbId) {
        try{
            dbInfoDao.updateDB(dbId,"close");
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        //todo 停止docker
        return operateDocker("stop", dbId);
    }

    @Override
    public boolean removeDB(int dbId) {
        try{
            dbInfoDao.deleteDB(dbId);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        //todo 删除docker
        return operateDocker("rm",dbId);
    }

    @Override
    public boolean startDB(int dbId) {
        try{
            dbInfoDao.updateDB(dbId,"open");
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        //todo 开启docker
        return operateDocker("start",dbId);
    }

    private boolean operateDocker(String operation, int dbId){
        String cmd = "docker " + operation + dbId;
        Runtime runtime = Runtime.getRuntime();
        try {
            Process process = runtime.exec(cmd);
            int status = process.waitFor();
            if (status != 0){
                return false;
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return false;
    }
}
