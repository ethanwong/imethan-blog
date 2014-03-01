package com.the3.mongo;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Hello Mongo!
 */
public class App 
{
	public static void main( String[] args ) {
		System.out.println("Bootstrapping HelloMongo");

		ConfigurableApplicationContext context = null;
		// use @Configuration using Java:
//        context = new ClassPathXmlApplicationContext("bootstrap.xml");

		// use XML application context:
        context = new ClassPathXmlApplicationContext("main/applicationContext.xml");

        HelloMongo hello = context.getBean(HelloMongo.class);
        hello.run();
        
        System.out.println( "DONE!" );
	}
}
