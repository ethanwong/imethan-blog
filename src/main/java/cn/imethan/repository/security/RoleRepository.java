package cn.imethan.repository.security;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cn.imethan.entity.security.Role;


/**
 * RoleRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:59:21
 */
@Repository
public interface RoleRepository  extends JpaRepository<Role, Long>,CrudRepository<Role, Long>{

}


