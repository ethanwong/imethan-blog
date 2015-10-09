package com.the3.base.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * EntityManagerSupport.java
 *
 * @author Ethan Wong
 * @time 2015年9月1日下午2:05:00
 */
public class EntityManagerSupport<T,Id>{
	
	@PersistenceContext 
	protected EntityManager entityManger;
	
	public void test(){
		System.out.println("EntityManagerSupport test");
	}
	
	
}


