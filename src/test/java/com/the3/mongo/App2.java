package com.the3.mongo;

import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Update.update;
import static org.springframework.data.mongodb.core.query.Query.query;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;

import com.mongodb.Mongo;
import com.the3.entity.mongo.Person;

public class App2 {

  private static final Log log = LogFactory.getLog(App2.class);

  public static void main(String[] args) throws Exception {

    MongoOperations mongoOps = new MongoTemplate(new SimpleMongoDbFactory(new Mongo(), "database"));

    Person p = new Person("Joe", 34);
    
    // Insert is used to initially store the object into the database.
    mongoOps.insert(p);
    log.info("Insert: " + p);
    
    // Find
    p = mongoOps.findById(p.getId(), Person.class);    
    log.info("Found: " + p);
    
    // Update
    mongoOps.updateFirst(query(where("name").is("Joe")), update("age", 35), Person.class);    
    p = mongoOps.findOne(query(where("name").is("Joe")), Person.class);
    log.info("Updated: " + p);
    
    // Delete
    mongoOps.remove(p);
    
    // Check that deletion worked
    List<Person> people =  mongoOps.findAll(Person.class);
    log.info("Number of people = : " + people.size());

    
    mongoOps.dropCollection(Person.class);
  }
}