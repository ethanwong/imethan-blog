package com.the3.repository.cms;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.the3.entity.cms.Article;


/**
 * ArticleRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:41
 */
@Repository
public interface ArticleRepository extends CrudRepository<Article, String> {
	

}
