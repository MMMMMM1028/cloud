package cn.wzc.cloud.dao;

import cn.wzc.cloud.domain.DBInfo;
import cn.wzc.cloud.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

import java.util.List;

public interface UserDao {
    /**
     * 插入新的用户
     * @param user 用户类
     */
    int insertUser(User user);

    /**
     * 返回用户
     *  1.通过ID
     *  2.通过 账号密码
     * @param user
     * @return
     */
    User selectUser(User user);

    /**
     * 返回用户购买的DB
     * @param userId
     * @return
     */
    List<DBInfo> selectOwnDBInfoById(@Param("userId")int userId);
}
