package com.the3.service.cms.impl;

import java.util.Date;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.the3.base.service.impl.BaseServiceImpl;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.cms.Article;
import com.the3.entity.security.Resource;
import com.the3.repository.cms.ArticleRepository;
import com.the3.service.cms.ArticleService;

/**
 * ArticleServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:45:49
 */
@Service
public class ArticleServiceImpl implements ArticleService {
	
	private Logger logger = Logger.getLogger(ArticleServiceImpl.class);  
	
	@Autowired
	private ArticleRepository articleRepository;
	
	
	public ReturnDto saveOrModify(Article entity) {
		boolean isSuccess = true;
		try {
			articleRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return new ReturnDto(isSuccess, entity);
	}


	public Article getById(Long id) {
		try {
//			return articleRepository.findOne(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			
		}
		return null;
	}


	public Page<Article> getPage(Map<String, Object> parameters,PageRequest pageable) {
		try {
//			return super.getPage(parameters, pageable, Article.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			
		}
		return null;
	}


	public ReturnDto deleteById(Long id) {
		try {
//			articleRepository.delete(id);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}
}
