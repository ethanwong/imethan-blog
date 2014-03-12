package com.the3.web.console.cms;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;
import org.springframework.web.util.WebUtils;

import com.the3.base.web.SearchFilter;
import com.the3.base.web.SuperController;
import com.the3.base.web.ServletUtils;
import com.the3.dto.service.ServiceReturnDto;
import com.the3.dto.web.WebReturnDto;
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
public class ChannelController extends SuperController{
	
	private ServiceReturnDto<Channel> returnDto;
	private int page = 0;
	private int size = 10;
	
	@Autowired
	private ChannelService channelService;
	
	@RequestMapping(value={"list",""}, method = {RequestMethod.GET,RequestMethod.POST})
	public String list(Model model,ServletRequest request) {
		Map<String,Object> parameters = WebUtils.getParametersStartingWith(request, SearchFilter.prefix);
		
		System.out.println(request.getParameter("search_like_title"));
		page = ServletUtils.getRequestIntParameter(request, "page")>=0 ? ServletUtils.getRequestIntParameter(request, "page") : page;
		size = ServletUtils.getRequestIntParameter(request, "size")>0 ? ServletUtils.getRequestIntParameter(request, "size") : size;
		
		Page<Channel> result = channelService.getPage(parameters,new PageRequest(page,size,Direction.DESC,"createTime"));
		model.addAttribute("result", result);
		
		Debug.println("result:"+result);
		
		return "console/cms/channel";
	}
	
	@RequestMapping(value="/input", method = RequestMethod.GET)
	public String input(Model model) {
		return "console/cms/channel-input";
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST)
	@ResponseBody
	public WebReturnDto save(@ModelAttribute("channel") Channel channel, BindingResult result, Model model) {
		boolean isSuccess = true;
		String message = "添加成功。";
		if(result.hasErrors()||StringUtils.isEmpty(channel.getTitle())||StringUtils.isEmpty(channel.getDescribe())){
			isSuccess = false;
			message = "添加失败，标题和描述为必填项。";
		}else{
			isSuccess = channelService.save(channel).isSuccess();
		}
		
		return new WebReturnDto(isSuccess,message);
	}
	
	@RequestMapping(value="/save2",method = RequestMethod.POST)
	public String save2(@ModelAttribute("channel") Channel channel, BindingResult result, RedirectAttributesModelMap redirectAttributesModelMap) {
		boolean isSuccess = true;
		String message = "添加成功。";
		if(result.hasErrors()||StringUtils.isEmpty(channel.getTitle())||StringUtils.isEmpty(channel.getDescribe())){
			isSuccess = false;
			message = "添加失败，标题和描述为必填项。";
		}else{
			isSuccess = channelService.save(channel).isSuccess();
		}
		redirectAttributesModelMap.addFlashAttribute("WebReturnDto", new WebReturnDto(isSuccess,message));
		return "redirect:/console/cms/channel";
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
	
	@RequestMapping(value="/modify",method = RequestMethod.POST)
	public String modify(@ModelAttribute("channel") Channel channel, BindingResult result,RedirectAttributesModelMap redirectAttributesModelMap) {
		boolean isSuccess = true;
		String message = "修改成功。";
		Debug.println("channel:"+channel);
		if(result.hasErrors()||StringUtils.isEmpty(channel.getTitle())||StringUtils.isEmpty(channel.getDescribe())){
			isSuccess = false;
			message = "修改失败，标题和描述为必填项。";
		}else{
			isSuccess = channelService.modify(channel).isSuccess();
		}
		
		redirectAttributesModelMap.addFlashAttribute("WebReturnDto", new WebReturnDto(isSuccess,message));
		return "redirect:/console/cms/channel";
	} 
	
	
}
