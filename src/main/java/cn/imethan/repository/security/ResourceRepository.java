package cn.imethan.repository.security;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cn.imethan.entity.security.Resource;


/**
 * ResourceRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午10:09:00
 */
@Repository
public interface ResourceRepository  extends JpaRepository<Resource, Long>,CrudRepository<Resource, Long> {

	
	Set<Resource> findByIsRoot(boolean b);


}

