package com.the3.service.cms.impl;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.base.repository.DynamicSpecifications;
import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.cms.Article;
import com.the3.entity.cms.Channel;
import com.the3.repository.cms.ArticleRepository;
import com.the3.repository.cms.ChannelRepository;
import com.the3.service.cms.ArticleService;

/**
 * ArticleServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:45:49
 */
@Service
@Transactional(readOnly = true)
public class ArticleServiceImpl implements ArticleService {
	
	private Logger logger = Logger.getLogger(ArticleServiceImpl.class);  
	
	@Autowired
	private ArticleRepository articleRepository;
	@Autowired
	private ChannelRepository channelRepository;
	
	@Override
	@Transactional(readOnly = false)
	public ReturnDto saveOrModify(Article entity) {
		boolean isSuccess = true;
		String message = "保存成功";
		try {
			Channel channel = channelRepository.getOne(entity.getChannel().getId());
			if(entity.getId() !=null){
				entity.setModifyTime(new Date());
			}else{
				//更新文章数量
				channel.setArticleAmount(channel.getArticleAmount()+1);
				channelRepository.save(channel);
			}
			entity.setChannel(channel);
			articleRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "保存失败";
			logger.error(e.getMessage());
		}
		return new ReturnDto(isSuccess , message , entity);
	}

	@Override
	public Article getById(Long id) {
		Article article = new Article();
		try {
			article = articleRepository.findOne(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return article;
	}

	@Override
	@Transactional(readOnly = false)
	public ReturnDto deleteById(Long id) {
	
		
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			//更新文章数
			Article article = articleRepository.getOne(id);
			Channel channel = article.getChannel();
			
			channel.setArticleAmount(channel.getArticleAmount()-1);
			channelRepository.save(channel);
			channelRepository.flush();
			
			articleRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return new ReturnDto(isSuccess , message);
	}


	@Override
	public Page<Article> findPage(List<SearchFilter> filters, PageRequest pageable) {
		Page<Article> result = null;
		try {
			Specification<Article> spec = DynamicSpecifications.bySearchFilter(filters, Article.class);
			result = articleRepository.findAll(spec, pageable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
