package com.the3.repository.cms;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.the3.entity.cms.Article;

/**
 * ArticleRepositoryTest.java
 *
 * @author Ethan Wong
 * @time 2015年9月1日下午1:41:58
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class ArticleRepositoryTest {
	
	@Autowired
	private ArticleRepository articleRepository;
	
	@Test
	public void testFindAll(){
		List<Article> list = articleRepository.findAll();
		System.out.println("-----list:"+list);
	}
}


