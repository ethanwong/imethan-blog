package com.the3.repository.user;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.the3.entity.user.Role;


/**
 * RoleRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:59:21
 */
@Repository
public interface RoleRepository  extends MongoRepository<Role, String> {

}


