package com.the3.web.console.cms;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.repository.SearchFilter;
import com.the3.base.web.SuperController;
import com.the3.dto.common.ReturnDto;
import com.the3.dto.page.JqGridPageDto;
import com.the3.entity.cms.Article;
import com.the3.service.cms.ArticleService;
import com.the3.service.cms.ChannelService;
import com.the3.utils.JsonUtils;

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
	@Autowired
	private ChannelService channelService;
	
	@RequestMapping(value = "" , method = RequestMethod.GET)
	public String article(){
		return "/console/cms/article";
	}
	
	@ResponseBody
	@RequestMapping(value = "json/{channelId}" , method = {RequestMethod.POST , RequestMethod.GET })
	public String json(@RequestParam("page") Integer page,@RequestParam("rows") Integer size,@PathVariable("channelId") Long channelId){
		PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		SearchFilter searchFilter = new SearchFilter("channel.id",SearchFilter.Operator.EQ,channelId.toString());
		filters.add(searchFilter);
		
		Page<Article> result = articleService.findPage(filters, pageable);
		return  JsonUtils.writeValueAsString(new JqGridPageDto<Article>(result));
	} 
	
	/**
	 * 保存文章
	 * @param article
	 * @param result
	 * @param request
	 * @return
	 */
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "save" , method = {RequestMethod.POST,RequestMethod.GET })
	public ReturnDto save(@Valid @ModelAttribute("article") Article article, BindingResult result,ServletRequest request){
		ReturnDto returnDto = new ReturnDto();
		if(result.hasFieldErrors()){
			returnDto.setMessage("参数验证出现异常:"+result.getFieldError().getDefaultMessage());
			returnDto.setSuccess(false);
		}else{
			returnDto = articleService.saveOrModify(article);
		}
		return returnDto;
	}
	
	/**
	 * 删除文章
	 * @param id
	 * @return
	 */
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "delete/{id}" , method = RequestMethod.POST)
	public ReturnDto delete(@PathVariable Long id){
		return articleService.deleteById(id);
	}
	
	/**
	 * 查看文章详情
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "detail/{id}" , method = RequestMethod.POST)
	public Article detail(@PathVariable Long id){
		return articleService.getById(id);
	} 
	
	/**
	 * 更新发布状态
	 * @param id
	 * @return
	 */
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "publish/{id}" , method = RequestMethod.POST)
	public ReturnDto publish(@PathVariable Long id){
		return articleService.updatePublish(id);
	}
}