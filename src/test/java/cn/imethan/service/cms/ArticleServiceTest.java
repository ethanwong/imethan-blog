package cn.imethan.service.cms;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.entity.cms.Article;
import cn.imethan.entity.cms.Channel;
import cn.imethan.entity.cms.Label;

/**
 * ArticleServiceTest.java
 *
 * @author Ethan Wong
 * @time 2014年3月14日下午9:42:42
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class ArticleServiceTest {
	
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ChannelService channelService;
	@Autowired
	private LabelService labelService;
	
	@Test
	public void testSave(){
		Article entity  = new Article();
		entity.setTitle("121231233第一篇文章的标题"+new Date());
		entity.setContent("123123这个是文章的内容"+new Date());
		
//		Channel channel = channelService.getById("5321d66e01f2fd536c327283");
		Channel channel = new Channel();
//		channel.setId("5321d66e01f2fd536c327283");
//		entity.setChannel(channel);
		
//		articleService.save(entity);
		
	}
	
	@Test
	public void testGetById(){
//		Article article = articleService.getById("532316bb0a5eec8e9684e0ee");
//		System.out.println("article:"+article);
	}
	
	
	@Test
	public void testUpdatePublish(){
		System.out.println(articleService.updatePublish(39l));
	}
	
	@Test
	public void test(){
		articleService.test();
	}
	
	@Test
	public void testFindPage(){
    	PageRequest pageable = new PageRequest(0, 10, Direction.DESC, "id");
    	
    	//文章检索条件
    	List<SearchFilter> filters = new ArrayList<SearchFilter>();
    	
    	Label label = labelService.getById(1l);
    	List<Article> aritlceList = label.getArticles();
    	String ids = "";
    	for(Article article:aritlceList){
    		if(!ids.trim().equals("")){ids+=",";}
    		ids += article.getId();
    	}
    	
		SearchFilter searchFilter = new SearchFilter("id",SearchFilter.Operator.IN,ids);
		filters.add(searchFilter);
		Page<Article> result = articleService.findPage(filters, pageable);//获取文章第一页内容
		System.out.println("testFindPage:"+result.getContent().size());
	}	

}


