package cn.wzc.cloud.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
@NoArgsConstructor
public class DBInfo implements Serializable {

    int dbId;
    int ram;
    int cpu;
    String version;
    String state;
    int storage;
    String type;
    int port;
    String IP;
    int userId;


}
