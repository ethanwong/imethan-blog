package com.the3.web.console.cms;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.web.SuperController;
import com.the3.entity.cms.Channel;
import com.the3.service.cms.ChannelService;

/**
 * ChannelController.java
 *
 * @author Ethan Wong
 * @time 2014年3月8日下午1:15:59
 */
@Controller
@RequestMapping("/console/cms/channel")
public class ChannelController extends SuperController{
	
	@Autowired
	private ChannelService channelService;
	
	@RequestMapping(value = "" , method = RequestMethod.GET)
	public String channel(){
		return "/console/cms/channel";
	}
	
	@ResponseBody
	@RequestMapping(value = "json" , method = RequestMethod.POST)
	public List<Channel> json(){
		List<Channel> list = channelService.getList();
		return list;
	}
	
	
}
