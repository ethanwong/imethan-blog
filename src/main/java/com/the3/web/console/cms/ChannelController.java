package com.the3.web.console.cms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.entity.cms.Channel;

/**
 * ChannelController.java
 *
 * @author suncco
 * @time 2014年3月8日下午1:15:59
 */
@Controller
@RequestMapping("/console/cms/channel")
public class ChannelController{
	
//	private final Channel channel;
//	
//	@Autowired
//	public ChannelController(Channel channel){
//		this.channel = channel;
//	}
	
//	@RequestMapping(value="/{day}", method = RequestMethod.GET)
//    public Map<String, Appointment> getForDay(@PathVariable @DateTimeFormat(iso=ISO.DATE) Date day, Model model) {
	
	@RequestMapping(value="/list/{title}", method = RequestMethod.GET)
	public String list(Model model,@PathVariable String title) {
		System.out.println("title:"+title);
		model.addAttribute("message", "This is channel!");
		
		return "console/cms/channel";
	}
	
	@RequestMapping(value="/list1/{title}", method = RequestMethod.GET)
	public String list1(@PathVariable String title,@MatrixVariable int q) {
		System.out.println("title:"+title);
		System.out.println("q:"+q);
		return "console/cms/channel";
	}
	
	@RequestMapping(value="/list2/{title}", method = RequestMethod.GET,produces="application/json")
	public String list2(Model model,@PathVariable String title) {
		System.out.println("title:"+title);
		model.addAttribute("message", "This is channel!");
		return "console/cms/channel";
	}
	
	@RequestMapping(value = "/something", method = RequestMethod.PUT)
	@ResponseBody
	public String helloWorld() {
	    return "Hello World";
	}

	public String detail(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	public String add(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	public String save(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	public String modify(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	public String delete(Model model) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
