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
	
    @RequestMapping("")
    public String blog(Model model) {
        return "front/blog";
    }
    
	@ResponseBody
	@RequestMapping(value = "channel/json" , method = RequestMethod.POST)
	public List<Channel> channelJson(){
		List<Channel> list = channelService.getList();
		return list;
	} 
	
    @ResponseBody
    @RequestMapping(value = "/article/{channelId}/{page}" , method = {RequestMethod.POST,RequestMethod.GET})
    public List<Article> getArticleList(@PathVariable Integer page,@PathVariable Long channelId){
    	List<Article> list = new ArrayList<Article>();
    	PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		if(channelId != null && channelId != 0){
			SearchFilter searchFilter = new SearchFilter("channel.id",SearchFilter.Operator.EQ,channelId.toString());
			filters.add(searchFilter);
		}

		
    	Page<Article> result = articleService.findPage(filters, pageable);
    	return result.getContent();
    }

}


