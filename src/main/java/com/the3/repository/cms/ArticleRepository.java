package com.the3.repository.cms;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.the3.entity.cms.Article;


/**
 * ArticleRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:41
 */
@Repository
public interface ArticleRepository extends JpaRepository<Article, Long>,JpaSpecificationExecutor<Article> {
	
	@Modifying 
	@Query("update Article a set a.isPublish = ?2 where a.id = ?1")
	public int updatePublish(Long id, boolean publish);
	

}
