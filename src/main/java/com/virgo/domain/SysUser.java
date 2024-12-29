package com.virgo.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;


import javax.validation.constraints.Size;
import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "sys_user")
public class SysUser {
    @Id
    @Size(max = 32)
    @Column(name = "id", nullable = false, length = 32)
    private String id;

    @Size(max = 100)
    @Column(name = "username", length = 100)
    private String username;

    @Size(max = 100)
    @Column(name = "realname", length = 100)
    private String realname;

    @Size(max = 255)
    @Column(name = "password")
    private String password;

    @Size(max = 45)
    @Column(name = "salt", length = 45)
    private String salt;

    @Size(max = 255)
    @Column(name = "avatar")
    private String avatar;

    @Column(name = "birthday")
    private Instant birthday;

    @Column(name = "sex")
    private Boolean sex;

    @Size(max = 45)
    @Column(name = "email", length = 45)
    private String email;

    @Size(max = 45)
    @Column(name = "phone", length = 45)
    private String phone;

    @Size(max = 64)
    @Column(name = "org_code", length = 64)
    private String orgCode;

    @Column(name = "status")
    private Boolean status;

    @Column(name = "del_flag")
    private Boolean delFlag;

    @Size(max = 100)
    @Column(name = "third_id", length = 100)
    private String thirdId;

    @Size(max = 100)
    @Column(name = "third_type", length = 100)
    private String thirdType;

    @Column(name = "activiti_sync")
    private Boolean activitiSync;

    @Size(max = 100)
    @Column(name = "work_no", length = 100)
    private String workNo;

    @Size(max = 100)
    @Column(name = "post", length = 100)
    private String post;

    @Size(max = 45)
    @Column(name = "telephone", length = 45)
    private String telephone;

    @Size(max = 32)
    @Column(name = "create_by", length = 32)
    private String createBy;

    @Column(name = "create_time")
    private Instant createTime;

    @Size(max = 32)
    @Column(name = "update_by", length = 32)
    private String updateBy;

    @Column(name = "update_time")
    private Instant updateTime;

    @Column(name = "user_identity")
    private Boolean userIdentity;

    @Size(max = 1000)
    @Column(name = "depart_ids", length = 1000)
    private String departIds;

    @Size(max = 64)
    @Column(name = "client_id", length = 64)
    private String clientId;

    @Column(name = "login_tenant_id")
    private Integer loginTenantId;

    @Size(max = 2)
    @Column(name = "bpm_status", length = 2)
    private String bpmStatus;

}