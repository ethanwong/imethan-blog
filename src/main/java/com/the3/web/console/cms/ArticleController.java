package com.the3.web.console.cms;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.the3.base.web.SuperController;
import com.the3.service.cms.ArticleService;
import com.the3.service.cms.ChannelService;

/**
 * ArticleController.java
 *
 * @author Ethan Wong
 * @time 2014年3月14日下午10:50:58
 */
@Controller
@RequestMapping("/console/cms/article")
public class ArticleController extends SuperController{
	
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ChannelService channelService;
	
	@RequestMapping(value = "" , method = RequestMethod.GET)
	public String article(){
		return "/console/cms/article";
	}
	
//	public 
	

}


