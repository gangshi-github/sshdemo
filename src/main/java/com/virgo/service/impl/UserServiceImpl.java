package com.virgo.service.impl;

import com.virgo.domain.SysUser;
import com.virgo.repositories.UserRepository;
import com.virgo.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Slf4j
@Service("userService")
public class UserServiceImpl implements UserService {

    Logger logger = Logger.getLogger(UserServiceImpl.class.getName());

    @Autowired
    UserRepository userRepository;

    @Override
    public SysUser getUserByUsername(String username) {
        return null;
    }

    @Override
    public SysUser getUserByUsernameAndPassword(String username, String password) {
        return null;
    }

    @Transactional(readOnly = true)
    @Override
    public List<SysUser> getAllUsers() {
        Iterable<SysUser> sysUsers = userRepository.findAll();
        return StreamSupport.stream(sysUsers.spliterator(), false).collect(Collectors.toList());
    }

    @Override
    public Page<SysUser> findByPage(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    @Override
    public SysUser get(Long id) {
        return null;
    }
    @Override
    public SysUser get(String id) {
        Optional<SysUser> optionalSysUser = userRepository.findById(id);
        return optionalSysUser.orElse(new SysUser());
    }

    @Override
    public int save(SysUser user) {
        if (ObjectUtils.isEmpty(user)) {
            logger.warning("User is null");
            return 0;
        }
        try {
            SysUser saved = userRepository.save(user);
            return saved.getId().isEmpty() ? 0 : 1;
        } catch (Exception e) {
            logger.warning("Exception when save user: " + e.getMessage());
            return 0;
        }
    }

    @Override
    public int update(SysUser user) {
        if (ObjectUtils.isEmpty(user)) {
            logger.warning("User is null");
            return 0;
        }
        try {
            SysUser saved = userRepository.save(user);
            return saved.getId().isEmpty() ? 0 : 1;
        } catch (Exception e) {
            logger.warning("Exception when update user: " + e.getMessage());
            return 0;
        }
    }

    @Override
    public int delete(String id) {
        if (StringUtils.isEmpty(id)) {
            logger.warning("Id is null");
            return 0;
        }
        try {
            userRepository.deleteById(id);
            return 1;
        } catch (Exception e) {
            logger.warning("Exception when delete user: " + e.getMessage());
            return 0;
        }
    }

    @Override
    public void updatePassword(Long id, String oldPassword, String newPassword) {

    }

    @Override
    public void saveOrUpdate(List<SysUser> users) {
        userRepository.saveAll(users);
    }
}
