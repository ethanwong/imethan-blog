package com.the3.web.front;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
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
import com.the3.entity.cms.Channel;
import com.the3.service.cms.ArticleService;
import com.the3.service.cms.ChannelService;

/**
 * BlogController.java
 *
 * @author Ethan Wong
 * @time 2014年12月15日下午10:56:28
 */
@Controller
@RequestMapping("/blog")
public class BlogController extends SuperController{
	
	@Autowired
	private ChannelService channelService;
	@Autowired
	private ArticleService articleService;
	
	/**
	 * blog首页
	 * @param model
	 * @return
	 */
    @RequestMapping(value = "" ,method = {RequestMethod.GET})
    public String blog(Model model) {
    	//获取栏目信息
    	List<Channel> list = channelService.getList();
    	model.addAttribute("channelList", list);
    	
    	//获取默认文章首页
    	PageRequest pageable = new PageRequest(0, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
    	Page<Article> result = articleService.findPage(filters, pageable);
    	model.addAttribute("articleList", result.getContent());
    	
    	//设置默认栏目ID
    	model.addAttribute("channelId", 0);
    	
        return "front/blog";
    }
    
    /**
     * 根据栏目加载信息
     * @param model
     * @param channelId
     * @return
     */
    @RequestMapping(value = "/{channelId}" ,method = {RequestMethod.GET})
    public String channel(Model model,@PathVariable Long channelId){
    	//获取栏目信息
    	List<Channel> list = channelService.getList();
    	model.addAttribute("channelList", list);
    	
    	//获取文章第一页内容
    	PageRequest pageable = new PageRequest(0, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		if(channelId != null && channelId != 0){
			SearchFilter searchFilter = new SearchFilter("channel.id",SearchFilter.Operator.EQ,channelId.toString());
			filters.add(searchFilter);
		}
    	Page<Article> result = articleService.findPage(filters, pageable);
    	
    	//设置文章内容
    	model.addAttribute("articleList", result.getContent());
    	//设置栏目ID
    	model.addAttribute("channelId", channelId);
    	
    	return "front/blog";
    }
    
    /**
     * readmore加载信息
     * @param page
     * @param channelId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/article/{channelId}/{page}" , method = {RequestMethod.POST,RequestMethod.GET})
    public List<Article> getArticleList(@PathVariable Integer page,@PathVariable Long channelId){
    	
    	PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		if(channelId != null && channelId != 0){
			SearchFilter searchFilter = new SearchFilter("channel.id",SearchFilter.Operator.EQ,channelId.toString());
			filters.add(searchFilter);
		}
    	Page<Article> result = articleService.findPage(filters, pageable);
    	
    	return result.getContent();
    }
    
    @RequiresAuthentication
	@RequestMapping("/article/input/{channelId}/{articleId}")
	public String inputArticle(@PathVariable Long channelId,@PathVariable Long articleId,Model model){
    	//获取栏目信息
    	List<Channel> list = channelService.getList();
    	model.addAttribute("channelList", list);
    	
    	if(articleId != null && articleId != 0l){
    		Article article = articleService.getById(articleId);
    		model.addAttribute("article", article);
    	}
		
		model.addAttribute("channelId", channelId);
		return "front/article-input";
	}
    
    @RequiresAuthentication
    @RequestMapping("/channel/input/{channelId}")
    public String inputChannel(@PathVariable Long channelId,Model model){
    	
    	if(channelId != null && channelId !=0l){
    		Channel channel = channelService.getById(channelId);
    		model.addAttribute("channel", channel);
    	}
    	
    	return "front/channel-input";
    }

}