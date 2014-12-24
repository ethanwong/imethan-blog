package com.the3.repository.contact;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;
import com.the3.entity.contact.Message;


/**
 * MessageRepository.java
 *
 * @author Ethan Wong
 * @time 2014年12月24日下午11:40:43
 */
@Repository
public interface MessageRepository extends JpaRepository<Message, Long>,JpaSpecificationExecutor<Message> {

}
