package com.the3.service.cms;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.cms.Article;


/**
 * ArticleService.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:45:56
 */
public interface ArticleService {
	
	/**
	 * 保存或者修改
	 * @param entity
	 * @return
	 */
	public ReturnDto saveOrModify(Article entity);
	
	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 */
	public Article getById(Long id);
	
	/**
	 * 根据ID删除
	 * @param id
	 * @return
	 */
	public ReturnDto deleteById(Long id);
	
	/**
	 * 获取文章列表
	 * @param filters
	 * @param pageable
	 * @return
	 */
	Page<Article> findPage(List<SearchFilter> filters, PageRequest pageable);
	

}
