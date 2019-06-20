package cn.wzc.cloud.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Data
@NoArgsConstructor
public class User {
    int userId;
    String pwd;
    String uname;
    List<DBInfo> dbList;
}
