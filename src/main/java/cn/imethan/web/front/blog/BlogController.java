package cn.imethan.web.front.blog;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.common.web.SuperController;
import cn.imethan.dto.page.JqGridPageDto;
import cn.imethan.entity.cms.Article;
import cn.imethan.entity.cms.Channel;
import cn.imethan.entity.cms.Label;
import cn.imethan.service.cms.ArticleService;
import cn.imethan.service.cms.ChannelService;
import cn.imethan.service.cms.LabelService;
import cn.imethan.utils.JsonUtils;

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
	@Autowired
	private LabelService labelService;
	
	/**
	 * 设置基础栏目和标签信息
	 * @param model
	 *
	 * @author Ethan Wong
	 * @datetime 2015年12月18日下午3:21:27
	 */
	private void setBaseInfo(Model model){
    	//获取栏目信息
    	List<Channel> list = channelService.getList(new ArrayList<SearchFilter>());
    	model.addAttribute("channelList", list);
    	//获取标签信息
    	List<Label> allLabel = labelService.getList(new ArrayList<SearchFilter>());
    	model.addAttribute("allLabel", allLabel);
	}
	
	
	/**
	 * blog首页
	 * @param model
	 * @return
	 */
    @RequestMapping(value = "" ,method = {RequestMethod.GET})
    public String blog(Model model,ServletRequest request) {
    	
    	//获取栏目信息和标签信息
    	setBaseInfo(model);
    	
    	//获取默认文章首页
    	PageRequest pageable = new PageRequest(0, size, Direction.DESC, "id");
    	//检索条件设置
    	List<SearchFilter> articleFilters = new ArrayList<SearchFilter>();
    	
    	//文章检索条件
    	String searchTitle = request.getParameter("search_title");
    	if(!StringUtils.isEmpty(searchTitle)){
    		SearchFilter articleFilter1 = new SearchFilter("title",SearchFilter.Operator.LIKE,searchTitle);
    		articleFilters.add(articleFilter1);
    		model.addAttribute("search_title", searchTitle);
    	}
    	
    	//查询文章
    	Page<Article> result = articleService.findPage(articleFilters, pageable);
    	model.addAttribute("articleList", result.getContent());
    	
    	//设置默认栏目ID和默认标签ID
    	model.addAttribute("channelId", 0);
    	model.addAttribute("labelId", 0);
    	
        return "front/blog/blog";
    }
    
    /**
     * 根据栏目加载信息
     * @param model
     * @param channelId
     * @return
     */
    @RequestMapping(value = "/{channelId}" ,method = {RequestMethod.GET})
    public String channelBlog(Model model,@PathVariable Long channelId,ServletRequest request){
    	//获取栏目信息和标签信息
    	setBaseInfo(model);
    	
    	PageRequest pageable = new PageRequest(0, size, Direction.DESC, "id");
    	List<SearchFilter> filters = new ArrayList<SearchFilter>();
    	
    	//文章检索条件
    	String searchTitle = request.getParameter("search_title");
    	if(!StringUtils.isEmpty(searchTitle)){
    		SearchFilter searchFilter = new SearchFilter("title",SearchFilter.Operator.LIKE,searchTitle);
    		filters.add(searchFilter);
    		model.addAttribute("search_title", searchTitle);
    	}
    	//栏目检索条件
		if(channelId != null && channelId != 0){
			SearchFilter searchFilter = new SearchFilter("channel.id",SearchFilter.Operator.EQ,channelId.toString());
			filters.add(searchFilter);
		}
		
		//获取文章第一页内容
    	Page<Article> result = articleService.findPage(filters, pageable);
    	model.addAttribute("articleList", result.getContent());
    	
    	//设置栏目ID
    	model.addAttribute("channelId", channelId);
    	//设置默认标签ID
    	model.addAttribute("labelId", 0);
    	
    	return "front/blog/blog";
    }
    
    /**
     * 根据标签获取文章
     * @param model
     * @param labelId
     * @param request
     * @return
     *
     * @author Ethan Wong
     * @datetime 2015年12月18日下午3:18:07
     */
    @RequestMapping(value = "tag/{labelId}" ,method = {RequestMethod.GET})
    public String labelBlog(Model model,@PathVariable Long labelId,ServletRequest request){
    	
    	//获取栏目信息和标签信息
    	setBaseInfo(model);
    	
    	Page<Article> result = null;
    	PageRequest pageable = new PageRequest(0, size, Direction.DESC, "id");
    	List<SearchFilter> filters = new ArrayList<SearchFilter>();
    	
    	//文章检索条件
    	String searchTitle = request.getParameter("search_title");
    	if(!StringUtils.isEmpty(searchTitle)){
    		SearchFilter searchFilter = new SearchFilter("title",SearchFilter.Operator.LIKE,searchTitle);
    		filters.add(searchFilter);
    		model.addAttribute("search_title", searchTitle);
    	}
    	
    	//设置标签参数
		if(labelId != null && labelId != 0){
	    	Label label = labelService.getById(labelId);
	    	List<Article> aritlceList = label.getArticles();
	    	String ids = "";
	    	for(Article article:aritlceList){
	    		if(!ids.trim().equals("")){ids+=",";}
	    		ids += article.getId();
	    	}
	    	if(!StringUtils.isEmpty(ids)){
				SearchFilter searchFilter = new SearchFilter("id",SearchFilter.Operator.IN,ids);
				filters.add(searchFilter);
				
				result = articleService.findPage(filters, pageable);//获取文章第一页内容
				model.addAttribute("articleList", result.getContent());//获取栏目信息
	    	}
		}
    	
    	//设置标签ID
    	model.addAttribute("labelId", labelId);
    	//设置栏目ID
    	model.addAttribute("channelId", 0);

    	
    	return "front/blog/blog";
    }
    
    
    
    /**
     * readmore加载信息
     * @param page
     * @param channelId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/article/{channelId}/{labelId}/{page}" , method = {RequestMethod.POST,RequestMethod.GET})
    public List<Article> getArticleList(Model model,@PathVariable Integer page,@PathVariable Long channelId,
    		@PathVariable Long labelId,ServletRequest request){
    	
    	PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
    	Page<Article> result = null;
    	//检索条件
    	List<SearchFilter> articleFilters = new ArrayList<SearchFilter>();
    	
    	String searchTitle = request.getParameter("search_title");
    	if(!StringUtils.isEmpty(searchTitle)){
    		SearchFilter searchFilter = new SearchFilter("title",SearchFilter.Operator.LIKE,searchTitle);
    		articleFilters.add(searchFilter);
    		model.addAttribute("search_title", searchTitle);
    	}
    	
		if(channelId != null && channelId != 0){
			SearchFilter searchFilter = new SearchFilter("channel.id",SearchFilter.Operator.EQ,channelId.toString());
			articleFilters.add(searchFilter);
		}
		
		
    	//设置标签参数
		if(labelId != null && labelId != 0){
	    	Label label = labelService.getById(labelId);
	    	List<Article> aritlceList = label.getArticles();
	    	String ids = "";
	    	for(Article article:aritlceList){
	    		if(!ids.trim().equals("")){ids+=",";}
	    		ids += article.getId();
	    	}
	    	if(!StringUtils.isEmpty(ids)){
				SearchFilter searchFilter = new SearchFilter("id",SearchFilter.Operator.IN,ids);
				articleFilters.add(searchFilter);
	    	}
		}
		
    	result = articleService.findPage(articleFilters, pageable);
    	
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
//    @RequiresUser//当前用户需为已认证用户或已记住用户 
	@RequestMapping("/article/input/{channelId}/{articleId}")
	public String inputArticle(@PathVariable Long channelId,@PathVariable Long articleId,Model model,ServletRequest request){
    	//获取栏目信息
    	List<Channel> list = channelService.getList(null);
    	model.addAttribute("channelList", list);
    	
    	//获取标签信息并且设置
    	List<Label> allLabel = labelService.getList(new ArrayList<SearchFilter>());
    	if(articleId != null && articleId != 0l){
    		Article article = articleService.getById(articleId);
    		model.addAttribute("article", article);
    		
    		//设置是否选中标签
    		List<Label> allLabelDb = article.getLabels();
    		for(Label label:allLabel){
    			for(Label labelDb:allLabelDb){
    				if(label.getId().equals(labelDb.getId())){
    					label.setCheck(true);
    				}
    			}
    		}
    	}
    	
    	model.addAttribute("locate", request.getParameter("locate"));//发起跳转位置
		model.addAttribute("channelId", channelId);
		model.addAttribute("allLabel", allLabel);
		
		
		String editor = request.getParameter("editor");
		if(editor!=null && editor.equals("um")){
			return "front/blog/article-input";
		}
		
		return "front/blog/article-input-ue";
	}
    
    /**
     * 文章详情
     * @param articleId
     * @return
     */
    @RequestMapping(value="/article/{articleId}",method = {RequestMethod.GET})
    public String article(@PathVariable Long articleId,Model model){
    	
    	//设置栏目和标签列表信息
    	this.setBaseInfo(model);
    	
    	//获取文章信息
    	try {
			if(articleId != null && articleId != 0l){
				
				//获取文章信息
				Article article = articleService.getArticleWithPrevAndNext(articleId);
				
				
				
				
				model.addAttribute("article", article);
				
				//设置默认栏目ID
				if(article != null){
					model.addAttribute("channelId", article.getChannelId());
				}
				
				
				
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return "front/blog/article-detail";
    }
    
    /**
     * 进入栏目管理页面
     * @return
     *
     * @author Ethan Wong
     * @datetime 2015年12月18日下午3:20:27
     */
    @RequiresUser//当前用户需为已认证用户或已记住用户 
	@RequestMapping("/channel")
    public String channel(){
    	return "/front/blog/channel";
    }
    
    /**
     * 栏目分页json
     * @param page
     * @param size
     * @return
     *
     * @author Ethan Wong
     * @datetime 2015年12月18日下午3:20:40
     */
    @RequiresUser//当前用户需为已认证用户或已记住用户 
    @ResponseBody
	@RequestMapping("/channel/json")
    public String channelJson(@RequestParam("page") Integer page,@RequestParam("rows") Integer size){
		PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "orderNo","id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		Page<Channel> result = channelService.findPage(filters, pageable);
		return  JsonUtils.writeValueAsString(new JqGridPageDto<Channel>(result));
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
    	
    	return "front/blog/channel-input";
    }
    

}