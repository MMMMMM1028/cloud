package cn.wzc.cloud;

import cn.wzc.cloud.dao.DBInfoDao;
import cn.wzc.cloud.dao.UserDao;
import cn.wzc.cloud.domain.DBInfo;
import cn.wzc.cloud.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CloudApplicationTests {

	@Autowired
	UserDao ud;
	@Autowired
	DBInfoDao dd;
	@Test
	public void contextLoads() {
	}

	@Test
	public void testUserDao(){
		User user = new User();
		user.setUname("hhh");
		user.setPwd("123456");
//		ud.insertUser(user);
		ud.selectUser(user);
	}

	@Test
	public void testDBDao(){
        DBInfo dbInfo = new DBInfo();
        dbInfo.setCpu(1);
        dbInfo.setIP("10.1.1.1");
        dbInfo.setPort(25555);
        dbInfo.setRam(10);
        dbInfo.setType("MySql");
        dbInfo.setVersion("8.0");
        dd.insertDB(dbInfo);
    }

}
