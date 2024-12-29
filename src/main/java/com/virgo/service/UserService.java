package com.virgo.service;

import com.virgo.domain.SysUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface UserService {
    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    public SysUser getUserByUsername(String username);
    /**
     * 根据用户名和密码查询用户
     * @param username
     * @param password
     * @return
     */
    public SysUser getUserByUsernameAndPassword(String username,String password);

    /**
     * 查询所有用户
     */
    public List<SysUser> getAllUsers();
    /**
     * 分页查询用户
     * @param pageable
     * @return
     */
    Page<SysUser> findByPage(Pageable pageable);

    SysUser get(Long id);
    SysUser get(String id);

    int save(SysUser user);

    int update(SysUser user);

    int delete(String id);

    void updatePassword(Long id, String oldPassword, String newPassword);

    void saveOrUpdate(List<SysUser> users);
}
