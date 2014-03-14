package com.the3.web.console.cms;

import java.util.Map;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;
import org.springframework.web.util.WebUtils;

import com.the3.base.web.SearchFilter;
import com.the3.base.web.SuperController;
import com.the3.dto.web.WebReturnDto;
import com.the3.entity.cms.Channel;
import com.the3.service.cms.ChannelService;
import com.the3.utils.Debug;

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
	
	/**
	 * 进入栏目首页
	 * @param redirectAttributesModelMap
	 * @return
	 */
	@RequestMapping(value="", method = {RequestMethod.GET,RequestMethod.POST})
	public String channel(RedirectAttributesModelMap redirectAttributesModelMap){
		return "redirect:/console/cms/channel/"+defaultPage+"/"+defaultSize;
	}
	
	/**
	 * 获取栏目列表
	 * @param model
	 * @param request
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping(value="/{page}/{size}", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(Model model,ServletRequest request,@PathVariable int page,@PathVariable int size) {
		Map<String,Object> parameters = WebUtils.getParametersStartingWith(request, SearchFilter.prefix);
		
		page = page >=0 ? page : defaultPage;
		size = size >0 ? size : defaultSize;
		
		Page<Channel> result = channelService.getPage(parameters,new PageRequest(page,size,Direction.DESC,"createTime"));
		model.addAttribute("result", result);
		
		return "console/cms/channel";
	}
	
	/**
	 * 跳转添加页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/input", method = RequestMethod.GET)
	public String input(Model model) {
		return "console/cms/channel-input";
	}
	
	/**
	 * 保存添加栏目
	 * @param channel
	 * @param result
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String save(@ModelAttribute("channel") Channel channel, BindingResult result, RedirectAttributesModelMap redirectAttributesModelMap) {
		boolean isSuccess = true;
		String message = "添加成功。";
		if(result.hasErrors()||StringUtils.isEmpty(channel.getTitle())||StringUtils.isEmpty(channel.getDescribe())){
			isSuccess = false;
			message = "添加失败，标题和描述为必填项。";
		}else{
			isSuccess = channelService.save(channel).isSuccess();
		}
		redirectAttributesModelMap.addFlashAttribute("WebReturnDto", new WebReturnDto(isSuccess,message));
		return "redirect:/console/cms/channel/"+defaultPage+"/"+defaultSize;
	}
	
	/**
	 * 查看详情
	 * @param model
	 * @param id
	 * @param response
	 * @return
	 */
	@RequestMapping(value="noDecorate/view/{id}", method = RequestMethod.GET)
	public String detail(Model model,@PathVariable String id,ServletResponse response){
		Channel channel  = channelService.getById(id);
		model.addAttribute("message","This is detail");
		model.addAttribute("channel",channel);
		Debug.println("channel:"+channel);
		return "console/cms/channel-view";
	}
	
	
	/**
	 * 删除
	 * @param model
	 * @param id
	 * @param page
	 * @param size
	 * @param redirectAttributesModelMap
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/delete/{id}/{page}/{size}", method = {RequestMethod.POST,RequestMethod.GET})
	public String delete(Model model,@PathVariable String id,@PathVariable int page,@PathVariable int size,RedirectAttributesModelMap redirectAttributesModelMap,ServletRequest request){
		boolean isSuccess = channelService.deleteById(id);
		String message = "";
		if(isSuccess){
			message = "删除成功。";
		}else{
			message = "删除失败。";
		}
		redirectAttributesModelMap.addFlashAttribute("WebReturnDto", new WebReturnDto(isSuccess,message));
		return "redirect:/console/cms/channel/"+page+"/"+size;
	}
	
	/**
	 * 准备编辑页面
	 * @param model
	 * @param id
	 * @param page
	 * @param size
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/noDecorate/forModify/{id}/{page}/{size}", method = RequestMethod.GET)
	public String forModify(Model model,@PathVariable String id,@PathVariable int page,@PathVariable int size,ServletResponse response){
		Channel channel  = channelService.getById(id);
		Debug.println("id:"+id);
		model.addAttribute("message","This is detail");
		model.addAttribute("channel",channel);
		
		model.addAttribute("page",page);
		model.addAttribute("size",size);
		
		return "console/cms/channel-modify";
	}
	
	/**
	 * 保存编辑
	 * @param channel
	 * @param page
	 * @param size
	 * @param result
	 * @param redirectAttributesModelMap
	 * @return
	 */
	@RequestMapping(value="/modify/{page}/{size}",method = RequestMethod.POST)
	public String modify(@ModelAttribute("channel") Channel channel, @PathVariable int page,@PathVariable int size,BindingResult result,RedirectAttributesModelMap redirectAttributesModelMap) {
		boolean isSuccess = true;
		String message = "修改成功。";
		if(result.hasErrors()||StringUtils.isEmpty(channel.getTitle())||StringUtils.isEmpty(channel.getDescribe())){
			isSuccess = false;
			message = "修改失败，标题和描述为必填项。";
		}else{
			isSuccess = channelService.modify(channel).isSuccess();
		}
		
		redirectAttributesModelMap.addFlashAttribute("WebReturnDto", new WebReturnDto(isSuccess,message));
		return "redirect:/console/cms/channel/"+page+"/"+size;
	} 
	
	
}
