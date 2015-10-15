package com.the3.web.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
    public String blog(Model model,ServletRequest request) {
    	//文章检索条件
    	String searchTitle = request.getParameter("search_title");
    	List<SearchFilter> articleFilters = new ArrayList<SearchFilter>();
    	if(!StringUtils.isEmpty(searchTitle)){
    		SearchFilter articleFilter1 = new SearchFilter("title",SearchFilter.Operator.LIKE,searchTitle);
    		articleFilters.add(articleFilter1);
    		model.addAttribute("search_title", searchTitle);
    	}
    	//获取默认文章首页
    	PageRequest pageable = new PageRequest(0, size, Direction.DESC, "id");
    	Page<Article> result = articleService.findPage(articleFilters, pageable);
    	model.addAttribute("articleList", result.getContent());
    	
    	
    	//栏目检索条件
    	List<SearchFilter> channelFilters = new ArrayList<SearchFilter>();
    	List<Channel> list = channelService.getList(channelFilters);//获取栏目信息
    	model.addAttribute("channelList", list);
    	
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
    public String channel(Model model,@PathVariable Long channelId,ServletRequest request){
    	
    	//文章检索条件
    	String searchTitle = request.getParameter("search_title");
    	List<SearchFilter> filters = new ArrayList<SearchFilter>();
    	if(!StringUtils.isEmpty(searchTitle)){
    		SearchFilter searchFilter = new SearchFilter("title",SearchFilter.Operator.LIKE,searchTitle);
    		filters.add(searchFilter);
    		model.addAttribute("search_title", searchTitle);
    	}
    	PageRequest pageable = new PageRequest(0, size, Direction.DESC, "id");
		if(channelId != null && channelId != 0){
			SearchFilter searchFilter = new SearchFilter("channel.id",SearchFilter.Operator.EQ,channelId.toString());
			filters.add(searchFilter);
		}
    	Page<Article> result = articleService.findPage(filters, pageable);//获取文章第一页内容
    	model.addAttribute("articleList", result.getContent());//获取栏目信息
    	
    	//栏目检索条件
    	List<SearchFilter> channelFilters = new ArrayList<SearchFilter>();
    	List<Channel> list = channelService.getList(channelFilters);//获取栏目信息
    	model.addAttribute("channelList", list);
    	
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
    public List<Article> getArticleList(Model model,@PathVariable Integer page,@PathVariable Long channelId,ServletRequest request){
    	
    	//检索条件
    	List<SearchFilter> articleFilters = new ArrayList<SearchFilter>();
    	
    	String searchTitle = request.getParameter("search_title");
    	if(!StringUtils.isEmpty(searchTitle)){
    		SearchFilter searchFilter = new SearchFilter("title",SearchFilter.Operator.LIKE,searchTitle);
    		articleFilters.add(searchFilter);
    		model.addAttribute("search_title", searchTitle);
    	}
    	PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		if(channelId != null && channelId != 0){
			SearchFilter searchFilter = new SearchFilter("channel.id",SearchFilter.Operator.EQ,channelId.toString());
			articleFilters.add(searchFilter);
		}
    	Page<Article> result = articleService.findPage(articleFilters, pageable);
    	
    	return result.getContent();
    }
    
    /**
     * 添加文章
     * @param channelId
     * @param articleId
     * @param model
     * @return
     */
    @RequiresAuthentication
	@RequestMapping("/article/input/{channelId}/{articleId}")
	public String inputArticle(@PathVariable Long channelId,@PathVariable Long articleId,Model model,ServletRequest request){
    	//获取栏目信息
    	List<Channel> list = channelService.getList(null);
    	model.addAttribute("channelList", list);
    	
    	if(articleId != null && articleId != 0l){
    		Article article = articleService.getById(articleId);
    		model.addAttribute("article", article);
    	}
    	model.addAttribute("locate", request.getParameter("locate"));//发起跳转位置
		model.addAttribute("channelId", channelId);
		return "front/article-input";
	}
    
    /**
     * 添加栏目
     * @param channelId
     * @param model
     * @return
     */
	@RequiresUser//当前用户需为已认证用户或已记住用户 
    @RequestMapping("/channel/input/{channelId}")
    public String inputChannel(@PathVariable Long channelId,Model model){
    	
    	if(channelId != null && channelId !=0l){
    		Channel channel = channelService.getById(channelId);
    		model.addAttribute("channel", channel);
    	}
    	
    	return "front/channel-input";
    }
    
    /**
     * 文章详情
     * @param articleId
     * @return
     */
    @RequestMapping(value="/article/{articleId}",method = {RequestMethod.GET})
    public String article(@PathVariable Long articleId,Model model){
    	//获取文章信息
    	if(articleId != null && articleId != 0l){
    		Article article = articleService.getById(articleId);
    		model.addAttribute("article", article);
    		
        	
        	//获取栏目信息
        	List<SearchFilter> channelFilters = new ArrayList<SearchFilter>();
        	List<Channel> list = channelService.getList(channelFilters);//获取栏目信息
        	model.addAttribute("channelList", list);
        	
        	//设置默认栏目ID
        	model.addAttribute("channelId", article.getChannelId());
    		
    		
    	}
    	return "front/article-detail";
    }

}