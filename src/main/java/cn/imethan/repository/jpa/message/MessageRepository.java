package cn.imethan.repository.jpa.message;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import cn.imethan.entity.message.Message;


/**
 * MessageRepository.java
 *
 * @author Ethan Wong
 * @time 2014年12月24日下午11:40:43
 */
@Repository
public interface MessageRepository extends JpaRepository<Message, Long>,JpaSpecificationExecutor<Message> {
	


	@Modifying
	@Query("update Message m set m.isShow = ?2 where m.id= ?1")
	int updateIsShowById(Long id, int isShow);

}
