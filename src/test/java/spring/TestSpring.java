package spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.the3.entity.cms.Article;
import com.the3.service.ArticleService;

public class TestSpring {
	
	public static void main(String args[]){
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml"});
		
	}
	
}
