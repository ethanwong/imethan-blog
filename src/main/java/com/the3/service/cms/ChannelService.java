package com.the3.service.cms;


import java.util.List;

import com.the3.base.service.BaseService;
import com.the3.entity.cms.Channel;

/**
 * ChannelService.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:46:01
 */
public interface ChannelService  extends BaseService<Channel> {
	
	/**
	 * 获取列表
	 * @return
	 */
	public List<Channel> getList();
	
}
