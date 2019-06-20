package cn.wzc.cloud.service.service_api;

import cn.wzc.cloud.domain.DBInfo;
import cn.wzc.cloud.domain.User;

import java.util.List;

public interface UserService {
    boolean register(User user);
    boolean login(User user);
    List<DBInfo> getDBList(int userId);
    boolean purchaseDB(DBInfo dbInfo);
}
