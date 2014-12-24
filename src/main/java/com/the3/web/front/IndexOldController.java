package com.the3.web.front;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.repository.SearchFilter;
import com.the3.base.web.SuperController;
import com.the3.entity.cms.Article;
import com.the3.service.cms.ArticleService;
import com.the3.service.cms.ChannelService;
import com.the3.service.security.UserService;

/**
 * IndexController.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日上午12:16:49
 */
@Controller
@RequestMapping("/index/old")
public class IndexOldController extends SuperController{
	
	@Autowired
	private ChannelService channelService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private UserService userService;
	
    @RequestMapping("")
    public String indexOne(Model model) {
    	
    	//获取文章首页信息
    	PageRequest pageable = new PageRequest(0, size, Direction.DESC, "id");
    	List<SearchFilter> articleFilters = new ArrayList<SearchFilter>();
    	Page<Article> result = articleService.findPage(articleFilters, pageable);
    	model.addAttribute("articleList", result.getContent());
    	
    	return "front/index-old";
    }
    
    @ResponseBody
    @RequestMapping(value = "/article/{page}" , method = {RequestMethod.POST,RequestMethod.GET})
    public List<Article> getArticleList(@PathVariable Integer page){
    	PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		List<SearchFilter> articleFilters = new ArrayList<SearchFilter>();
    	Page<Article> result = articleService.findPage(articleFilters, pageable);
    	return result.getContent();
    }

}


