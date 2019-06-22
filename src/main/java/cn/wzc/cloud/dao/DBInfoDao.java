package cn.wzc.cloud.dao;

import cn.wzc.cloud.domain.DBInfo;
import org.apache.ibatis.annotations.Param;

public interface DBInfoDao {

    /**
     * 插入DB
     * @param dbInfo
     */
    void insertDB(DBInfo dbInfo);

    /**
     * 更新
     * @param dbId
     * @param state
     */
    void updateDB(@Param("dbId") int dbId, @Param("state") String state);

    /**
     * 删除docker
     * @param dbId
     */
    void deleteDB(int dbId);
}
