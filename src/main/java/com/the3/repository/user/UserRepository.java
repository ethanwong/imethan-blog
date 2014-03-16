package com.the3.repository.user;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.the3.entity.user.User;

/**
 * UserRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:58:05
 */
@Repository
public interface UserRepository  extends MongoRepository<User, String> {

	User findByUsername(String username);

}


