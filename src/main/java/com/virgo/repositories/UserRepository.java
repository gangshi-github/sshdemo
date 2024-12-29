package com.virgo.repositories;

import com.virgo.domain.SysUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<SysUser, String> {

    Optional<SysUser> findById(String id);
}
