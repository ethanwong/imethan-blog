package com.the3.repository.cms;

import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.stereotype.Repository;

import com.the3.entity.cms.Channel;

public interface ChannelRepository  {
	
	public Channel save(Channel entity);
	
}
