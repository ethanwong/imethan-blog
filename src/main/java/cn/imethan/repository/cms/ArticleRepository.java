package cn.imethan.repository.cms;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import cn.imethan.common.jpa.BaseJpaRepository;
import cn.imethan.entity.cms.Article;


/**
 * ArticleRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:41
 */
@Repository
public interface ArticleRepository extends BaseJpaRepository<Article, Long>{
	
	@Modifying 
	@Query("update Article a set a.isPublish = ?2 where a.id = ?1")
	public int updatePublish(Long id, boolean publish);
	

}
