package com.the3.repository.security;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.the3.entity.security.User;

/**
 * UserRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:58:05
 */
@Repository
public interface UserRepository  extends JpaRepository<User, Long>,JpaSpecificationExecutor<User> {

	User findByUsername(String username);
	
	@Modifying 
	@Query("update User a set a.password = ?2 where a.username = ?1")
	int updatePassword(String username, String password);

}


