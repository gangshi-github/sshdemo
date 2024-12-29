package com.virgo.action.user;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.virgo.action.BaseAction;
import com.virgo.core.exception.BusinessException;
import com.virgo.core.response.R;
import com.virgo.domain.SysUser;
import com.virgo.service.UserService;
import lombok.Getter;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.util.ObjectUtils;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Namespace("/user")
@ParentPackage("json-default")
@Getter
@Setter
@Result(type = "json", params = {"root", "result", "excludeNullProperties", "true"})
public class UserAction extends BaseAction {

    private static final long serialVersionUID = 1L;

    @Autowired
    private UserService userService;

    // 请求参数
    private SysUser user;
    private String id;
    private Integer page = 1;
    private Integer size = 20;
    private String orderBy;
    private String oldPassword;
    private String newPassword;

    // 响应数据
    private R<?> result;

    // 列表页面
    @Action(value = "userList", results = {@Result(name = SUCCESS, location = "/WEB-INF/views/user/userList.jsp")})
    public String userList() {
        return SUCCESS;
    }

    // 编辑页面
    @Action(value = "userEdit", results = {@Result(name = SUCCESS, location = "/WEB-INF/views/user/userEdit.jsp")})
    public String userEdit() {
        return SUCCESS;
    }

    // 获取用户列表数据 , 返回JSON格式数据
    @Action(value = "page")
    public String page() {
        PageRequest pageRequest = PageRequest.of(page - 1, 20);
        try {
            Page<SysUser> pageResult = userService.findByPage(pageRequest);
            result = R.ok(pageResult);
        } catch (BusinessException e) {
            result = R.fail(e.getMessage());
        } catch (Exception e) {
            log.error("Failed to get user list", e);
            result = R.fail("System error, please contact the administrator");
        }
        return SUCCESS;
    }

    // 编辑页面,返回JSON格式数据
    @Action(value = "getOne")
    public String getOne() {
        try {
            if (id != null) {
                user = userService.get(id);
                result = R.ok(user);
            }
            return SUCCESS;
        } catch (Exception e) {
            log.error("获取用户信息失败", e);
            result = R.fail("System error, please contact the administrator");
            return ERROR;
        }
    }

    // 保存更新用户信息,返回JSON格式数据
    @Action(value = "saveOrUpdate")
    public String saveOrUpdate() {
        try {
            // 获取请求体中的 JSON 数据
            String json = ServletActionContext.getRequest().getReader().lines().collect(Collectors.joining(System.lineSeparator()));
            // 解析 JSON 数据
            List<SysUser> users = new Gson().fromJson(json, new TypeToken<List<SysUser>>() {
            }.getType());

            // 使用 Java 8 Stream API 优化循环
            users.forEach(user -> {
                // 如果id为空,则新增用户,随机生成32位
                if (ObjectUtils.isEmpty(user.getId())) {
                    user.setId(UUID.randomUUID().toString().replaceAll("-", ""));
                }
            });
            userService.saveOrUpdate(users);
            result = R.ok();
            return SUCCESS;
        } catch (Exception e) {
            log.error("保存用户信息失败", e);
            result = R.fail("System error, please contact the administrator");
            return ERROR;
        }
    }

    // 删除用户信息,返回JSON格式数据
    @Action(value = "delete")
    public String delete() {
        try {
            if (id != null) {
                userService.delete(id);
                result = R.ok();
            }
            return SUCCESS;
        } catch (Exception e) {
            log.error("删除用户信息失败", e);
            result = R.fail("System error, please contact the administrator");
            return ERROR;
        }
    }

}