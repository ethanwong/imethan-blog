package cn.imethan.repository.cms;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import cn.imethan.common.jpa.BaseJpaRepository;
import cn.imethan.entity.cms.Article;
import cn.imethan.entity.cms.Channel;


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
	
	@QueryHints({@QueryHint(name = "org.hibernate.cacheable", value ="true") }) 
	public List<Article> findTop4ByIsPublish(boolean isPublish,Sort sort);

//	public Page<Article> findByIdIn(List<Long> list, PageRequest pageable);
	
	@QueryHints({@QueryHint(name = "org.hibernate.cacheable", value ="true") }) 
	public List<Article> findFirst1ByChannel(Channel channel, Sort sort);
	

}
