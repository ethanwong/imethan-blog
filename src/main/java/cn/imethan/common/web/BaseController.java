package cn.imethan.common.web;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

/**
 * BaseController.java
 *
 * @author Ethan Wong
 * @time 2014年3月8日下午1:17:07
 */
public interface BaseController {
	
	/**
	 * 进入模块首页
	 * @param redirectAttributesModelMap
	 * @return
	 */
	@RequestMapping(value="", method = {RequestMethod.GET,RequestMethod.POST})
	public String index(RedirectAttributesModelMap redirectAttributesModelMap);
	
	/**
	 * 获取列表
	 * @param model
	 * @param request
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping(value="/{page}/{size}", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(Model model,ServletRequest request,@PathVariable int page,@PathVariable int size);
	
	/**
	 * 跳转添加页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/input", method = RequestMethod.GET)
	public String input(Model model);
	
	
	/**
	 * 查看详情
	 * @param model
	 * @param id
	 * @param response
	 * @return
	 */
	@RequestMapping(value="noDecorate/view/{id}", method = RequestMethod.GET)
	public String view(Model model,@PathVariable String id,ServletResponse response);
	
	
	/**
	 * 准备编辑页面
	 * @param model
	 * @param id
	 * @param page
	 * @param size
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/forModify/{id}/{page}/{size}", method = RequestMethod.GET)
	public String forModify(Model model,@PathVariable String id,@PathVariable int page,@PathVariable int size,ServletResponse response);
	
	
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
	public String delete(Model model,@PathVariable String id,@PathVariable int page,@PathVariable int size,RedirectAttributesModelMap redirectAttributesModelMap,ServletRequest request);
	
}


