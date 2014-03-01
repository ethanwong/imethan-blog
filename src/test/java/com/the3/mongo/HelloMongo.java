package com.the3.mongo;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.stereotype.Repository;

import com.the3.entity.mongo.Account;
import com.the3.entity.mongo.Person;

@Repository
public class HelloMongo {

	@Autowired
	MongoOperations mongoOperations;

	public void run() {

		if (mongoOperations.collectionExists(Person.class)) {
//			mongoOperations.dropCollection(Person.class);
		}else{
			System.out.println("create collection");
			mongoOperations.createCollection(Person.class);
		}

		Random r = new Random(100);
		int number = r.nextInt();
		Person p = new Person("John"+number, 39);
		Account a = new Account("1234-59873-893-1", Account.Type.SAVINGS, 123.45D);
		p.getAccounts().add(a);
		
		p.setCreateTime(new Date());
		p.setLongDate(123456l);
		mongoOperations.insert(p);

		List<Person> results = mongoOperations.findAll(Person.class);
		System.out.println("Results: " + results);
	}

}
