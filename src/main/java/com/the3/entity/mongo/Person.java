package com.the3.entity.mongo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Person {

	@Id
	private String id;

	private String name;

	private int age;

	private List<Account> accounts = new ArrayList<Account>();
	
	private Date createTime;
	
	private Long longDate;
	

	public Long getLongDate() {
		return longDate;
	}

	public void setLongDate(Long longDate) {
		this.longDate = longDate;
	}

	public Person() {
	}

	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public List<Account> getAccounts() {
		return accounts;
	}

	public void addAccount(Account account) {
		this.accounts.add(account);
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Person [id=" + id + ", name=" + name + ", age=" + age
				+ ", accounts=" + accounts + "]";
	}

}
