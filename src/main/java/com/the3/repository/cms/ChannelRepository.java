package com.the3.repository.cms;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.the3.entity.cms.Channel;

/**
 * ChannelRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:45
 */
@Repository
public interface ChannelRepository extends CrudRepository<Channel, String> {

}
