package com.the3.web.console.cms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.convert.MappingMongoConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.dto.service.ServiceReturnDto;
import com.the3.entity.cms.Channel;
import com.the3.service.ChannelService;
import com.the3.utils.Debug;

/**
 * ChannelController.java
 *
 * @author suncco
 * @time 2014年3月8日下午1:15:59
 */
@Controller
@RequestMapping("/console/cms/channel")
public class ChannelController{
	
	private ServiceReturnDto<Channel> returnDto;
	private int page = 0;
	private int size = 10;
	
	@Autowired
	private ChannelService channelService;
	
	@RequestMapping(value={"/","/{page}/{size}"}, method = RequestMethod.GET)
	public String list(Model model,@PathVariable int page,@PathVariable int size) {
		
		page = page>=0 ? page : 0;
		size = size>0 ? size : 10;
		
		Page<Channel> result = channelService.getPage(new PageRequest(page,size,Direction.DESC,"createTime"));
		model.addAttribute("result", result);
		
		return "console/cms/channel";
	}
	
	@RequestMapping(value="/input", method = RequestMethod.GET)
	public String input(Model model) {
		return "console/cms/channel-input";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String save(@ModelAttribute("channel") Channel channel, BindingResult result, Model model) {
		boolean isSuccess = true;
		if(result.hasErrors()||StringUtils.isEmpty(channel.getTitle())||StringUtils.isEmpty(channel.getDescribe())){
			isSuccess = false;
		}else{
			isSuccess = channelService.save(channel).isSuccess();
		}
		Debug.println("channel:"+channel);
		model.addAttribute("isSuccess", isSuccess);
		return "console/cms/channel-input";
	}
	
	@RequestMapping(value="/jsondetail/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Channel jsondetail(Model model,@PathVariable String id){
		Channel channel  = channelService.getById(id);
		Debug.println("id:"+id);
		model.addAttribute("message","This is jsondetail");
		Debug.println("channel:"+channel);
		return channel;
	}
	
	@RequestMapping(value="/detail/{id}", method = RequestMethod.GET)
	public String detail(Model model,@PathVariable String id){
		
		Channel channel  = channelService.getById(id);
		Debug.println("id:"+id);
		model.addAttribute("message","This is detail");
		model.addAttribute("channel",channel);
		Debug.println("channel:"+channel);
		return "console/cms/channel-detail";
	}
	
	@RequestMapping(value="/delete/{id}", method = RequestMethod.GET)
	@ResponseBody
	public boolean delete(Model model,@PathVariable String id){
		boolean isSuccess = channelService.deleteById(id);
		String message = "";
		if(isSuccess){
			message = "删除成功。";
		}else{
			message = "删除失败。";
		}
		return isSuccess;
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
}
