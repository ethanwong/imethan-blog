package com.the3.web.console.security;

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

import com.the3.base.web.BaseController;
import com.the3.base.web.SearchFilter;
import com.the3.base.web.SuperController;
import com.the3.dto.web.WebReturnDto;
import com.the3.entity.cms.Article;
import com.the3.entity.cms.Channel;
import com.the3.entity.user.Permission;
import com.the3.service.cms.ArticleService;
import com.the3.service.cms.ChannelService;
import com.the3.service.user.PermissionService;
import com.the3.utils.Debug;


/**
 * PermissionController.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午8:50:31
 */
@Controller
@RequestMapping("/console/user/permission")
public class PermissionController extends SuperController implements BaseController{
	
	@Autowired
	private PermissionService permissionService;
	

	@Override
	@RequestMapping(value="", method = {RequestMethod.GET,RequestMethod.POST})
	public String index(RedirectAttributesModelMap redirectAttributesModelMap) {
		return "redirect:/console/user/permission/"+defaultPage+"/"+defaultSize;
	}


	@Override
	@RequestMapping(value="/{page}/{size}", method = {RequestMethod.GET,RequestMethod.POST})
	public String list(Model model, ServletRequest request, @PathVariable int page, @PathVariable int size) {
		Map<String,Object> parameters = WebUtils.getParametersStartingWith(request, SearchFilter.prefix);
		
		page = page >=0 ? page : defaultPage;
		size = size >0 ? size : defaultSize;
		
		Page<Permission> result = permissionService.getPage(parameters,new PageRequest(page,size,Direction.DESC,"createTime"));
		model.addAttribute("result", result);
		
		return "console/user/permission";
	}


	@Override
	public String input(Model model) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String detail(Model model, String id, ServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String forModify(Model model, String id, int page, int size,
			ServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String delete(Model model, String id, int page, int size,
			RedirectAttributesModelMap redirectAttributesModelMap,
			ServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	

}