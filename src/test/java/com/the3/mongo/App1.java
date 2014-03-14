package com.the3.mongo;

import static org.springframework.data.mongodb.core.query.Criteria.where;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;

import com.mongodb.Mongo;
import com.the3.entity.cms.Article;

public class App1 {

  private static final Log log = LogFactory.getLog(App1.class);

  public static void main(String[] args) throws Exception {

    MongoOperations mongoOps = new MongoTemplate(new Mongo(), "database");


    log.info(mongoOps.findOne(new Query(where("title").is("Ethan")), Article.class));

//    mongoOps.dropCollection("person");
  }
}
