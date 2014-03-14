package com.the3.web.console.cms;

import java.util.Map;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;
import org.springframework.web.util.WebUtils;

import com.the3.base.web.SearchFilter;
import com.the3.base.web.SuperController;
import com.the3.entity.cms.Article;
import com.the3.service.cms.ArticleService;

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
	/**
	 * 进入栏目首页
	 * @param redirectAttributesModelMap
	 * @return
	 */
	@RequestMapping(value="", method = {RequestMethod.GET,RequestMethod.POST})
	public String article(RedirectAttributesModelMap redirectAttributesModelMap){
		System.out.println("--------article--------");
		return "redirect:/console/cms/article/"+defaultPage+"/"+defaultSize;
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
		
		Page<Article> result = articleService.getPage(parameters,new PageRequest(page,size,Direction.DESC,"createTime"));
		model.addAttribute("result", result);
		
		return "console/cms/article";
	}
	

}


