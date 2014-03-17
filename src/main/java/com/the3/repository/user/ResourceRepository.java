package com.the3.repository.user;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import com.the3.entity.user.Resource;


/**
 * ResourceRepository.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午10:09:00
 */
@Repository
public interface ResourceRepository  extends MongoRepository<Resource, String> {


}


