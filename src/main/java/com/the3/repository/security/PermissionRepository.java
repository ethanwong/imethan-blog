package com.the3.repository.security;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.the3.entity.security.Permission;


/**
 * PermissionRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:59:32
 */
@Repository
public interface PermissionRepository  extends JpaRepository<Permission, String> {

}


