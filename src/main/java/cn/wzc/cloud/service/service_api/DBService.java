package cn.wzc.cloud.service.service_api;

import org.springframework.stereotype.Service;

public interface DBService {
//    todo DB=docker 虚拟机
    boolean stopDB(int dbId);
    boolean startDB(int dbId);
    boolean removeDB(int dbID);
}
