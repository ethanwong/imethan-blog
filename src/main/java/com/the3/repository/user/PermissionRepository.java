package com.the3.repository.user;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.the3.entity.user.Permission;


/**
 * PermissionRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:59:32
 */
@Repository
public interface PermissionRepository  extends MongoRepository<Permission, String> {

}


