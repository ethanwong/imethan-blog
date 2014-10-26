package com.the3.repository.security;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.the3.entity.security.Role;


/**
 * RoleRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:59:21
 */
@Repository
public interface RoleRepository  extends JpaRepository<Role, String> {

}


