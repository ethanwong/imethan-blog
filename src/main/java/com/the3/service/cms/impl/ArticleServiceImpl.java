package com.the3.service.cms.impl;

import java.util.Date;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import com.the3.base.service.impl.BaseServiceImpl;
import com.the3.dto.service.ServiceReturnDto;
import com.the3.dto.web.WebReturnDto;
import com.the3.entity.cms.Article;
import com.the3.entity.cms.Channel;
import com.the3.repository.cms.ArticleRepository;
import com.the3.service.cms.ArticleService;

/**
 * ArticleServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:45:49
 */
@Service
public class ArticleServiceImpl extends BaseServiceImpl<Article> implements ArticleService {
	
	private Logger logger = Logger.getLogger(ArticleServiceImpl.class);  
	
	@Autowired
	private ArticleRepository articleRepository;
	
	
	@Override
	public ServiceReturnDto<Article> save(Article entity) {
		boolean isSuccess = true;
		try {
			articleRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return new ServiceReturnDto<Article>(isSuccess, entity);
	}


	@Override
	public Article getById(String id) {
		try {
			return articleRepository.findOne(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}


	@Override
	public Page<Article> getPage(Map<String, Object> parameters,PageRequest pageable) {
		try {
			return super.getPage(parameters, pageable, Article.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}


	@Override
	public boolean deleteById(String id) {
		try {
			articleRepository.delete(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return false;
		}
	}
		


	@Override
	public WebReturnDto modify(Article entity) {
		
		boolean isSuccess = true;
		try {
			Update update = new Update().set("title", entity.getTitle())
					.set("content", entity.getContent())
					.set("modifyTime", new Date())
					.set("channel", entity.getChannel());
			mongoTemplate.findAndModify(Query.query(new Criteria("id").is(entity.getId())), update, Article.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSuccess = false;
		}
		return new WebReturnDto(isSuccess,"");
	}

}
