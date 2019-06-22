package cn.wzc.cloud.service.service_api;

import cn.wzc.cloud.domain.DBInfo;
import cn.wzc.cloud.domain.User;

import java.util.List;

public interface UserService {
    /**
     * 注册
     * @param user
     * @return 成功返回UserId，失败返回-1
     */
    int register(User user);

    /**
     * 登陆，
     * @param user
     * @return 成功返回userId，失败返回-1
     */
    int login(User user);

    List<DBInfo> getDBList(int userId);
    boolean purchaseDB(DBInfo dbInfo);
}
