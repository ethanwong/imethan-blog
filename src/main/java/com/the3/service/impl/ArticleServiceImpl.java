package com.the3.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.the3.entity.cms.Article;
import com.the3.repository.cms.ArticleRepository;
import com.the3.service.ArticleService;

@Component
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private ArticleRepository articleDao;
	
	public Article getArticle(){
		
		return null;
	}

}
