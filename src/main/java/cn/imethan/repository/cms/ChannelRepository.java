package cn.imethan.repository.cms;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import cn.imethan.entity.cms.Channel;

/**
 * ChannelRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:45
 */
@Repository
public interface ChannelRepository extends JpaRepository<Channel, Long>,JpaSpecificationExecutor<Channel> {

	@Modifying 
	@Query("update Channel a set a.isPublish = ?2 where a.id = ?1")
	int updatePublish(Long id, boolean publish);
	
	@Modifying 
	@Query("update Channel a set a.articleAmount = ?2 where a.id = ?1")
	int updateArticleAmount(Long id, int targetAmount);

}
