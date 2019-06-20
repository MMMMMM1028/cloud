package cn.wzc.cloud.service.service_api;

public interface DBService {
//    todo DB=docker 虚拟机
    boolean stopDB(int dbId);
    boolean restartDB(int dbId);
    boolean removeDB(int dbID);
}
