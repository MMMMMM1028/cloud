package cn.wzc.cloud.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@Data
@NoArgsConstructor
public class DBInfo {

    @NotNull
    int dbId;
    @NotNull
    int ram;
    @NotNull
    int cpu;
    @NotNull
    String version;
    @NotNull
    String type;
    @NotNull
    int port;
    String IP;
    @NotNull
    int userId;


}
