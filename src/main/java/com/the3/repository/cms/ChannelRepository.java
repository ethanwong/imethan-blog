package com.the3.repository.cms;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.the3.entity.cms.Channel;
import com.the3.entity.security.Permission;

/**
 * ChannelRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:45
 */
@Repository
public interface ChannelRepository extends JpaRepository<Channel, Long>,JpaSpecificationExecutor<Channel> {

}
