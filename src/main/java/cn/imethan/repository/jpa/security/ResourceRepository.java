package cn.imethan.repository.jpa.security;

import java.util.Set;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.QueryHints;
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

	@QueryHints({@QueryHint(name = "org.hibernate.cacheable", value ="true") }) 
	Set<Resource> findByIsRoot(boolean b);


}


