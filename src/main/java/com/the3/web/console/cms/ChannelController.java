package com.the3.web.console.cms;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.web.SuperController;
import com.the3.dto.common.ReturnDto;
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
		List<Channel> list = channelService.getList(null);
		return list;
	}
	
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "save" , method = RequestMethod.POST)
	public ReturnDto save(@Valid @ModelAttribute("channel") Channel channel, BindingResult result,ServletRequest request){
		System.out.println("------------channel:"+channel);
		ReturnDto returnDto = new ReturnDto();
		if(result.hasFieldErrors()){
			
			returnDto.setMessage("参数验证出现异常:"+result.getFieldError().getDefaultMessage());
			returnDto.setSuccess(false);
		}else{
			returnDto = channelService.saveOrModify(channel);
		}
		return returnDto;
	}
	
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "delete/{id}" , method = RequestMethod.POST)
	public ReturnDto delete(@PathVariable Long id){
		
		return channelService.deleteById(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "detail/{id}" , method = RequestMethod.POST)
	public Channel detail(@PathVariable Long id){
		return channelService.getById(id);
	}
	
}
