package com.the3.web.cms;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.the3.entity.cms.Channel;
import com.the3.service.ChannelService;

/**
 * HelloWorldController.java
 *
 * @author ETHAN
 * @time 2014年3月2日下午10:32:13
 */
@Controller
public class HelloWorldController {
	
	@Autowired
	private ChannelService channelService;

    @RequestMapping("/add")
    public String channel(Model model) {
    	System.out.println("HelloWorldController channel:"+new Date());
        model.addAttribute("message", "add channel!");
        
        String title = ""+new Date();
        Channel channel = new Channel();
        channel.setTitle(title);
        channel.setDescribe("这个是描述！");
        channel.setCreateTime(new Date());
        channelService.save(channel);
        
        return "helloWorld";
    }
    
    @RequestMapping("/hello")
    public String hello(Model model) {
    	System.out.println("HelloWorldController hello:"+new Date());
        model.addAttribute("message", "Hello World!");
        
        return "helloWorld";
    }
}


