/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package cn.imethan.common.repository;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.domain.Specification;

import com.google.common.collect.Lists;

/**
 * DynamicSpecifications.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2016年1月7日上午11:30:26
 */
public class DynamicSpecifications {

	public static <T> Specification<T> bySearchFilter(final Collection<SearchFilter> filters, final Class<T> entityClazz) {
		return new Specification<T>() {
			@Override
			public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				if (filters != null && !filters.isEmpty()) {

					List<Predicate> predicates = Lists.newArrayList();
					for (SearchFilter filter : filters) {
						// nested path translate, 如Task的名为"user.name"的filedName, 转换为Task.user.name属性
						String[] names = StringUtils.split(filter.fieldName, ".");
						Path expression = root.get(names[0]);
						try {
							for (int i = 1; i < names.length; i++) {
								expression = expression.get(names[i]);
							}
						} catch (Exception e) {
							e.printStackTrace();
						}

						// logic operator
						switch (filter.operator) {
						case EQ:
							predicates.add(builder.equal(expression, filter.value));
							break;
						case LIKE:
							predicates.add(builder.like(expression, "%" + filter.value + "%"));
							break;
						case GT:
							predicates.add(builder.greaterThan(expression, (Comparable) filter.value));
							break;
						case LT:
							predicates.add(builder.lessThan(expression, (Comparable) filter.value));
							break;
						case GTE:
							predicates.add(builder.greaterThanOrEqualTo(expression, (Comparable) filter.value));
							break;
						case LTE:
							predicates.add(builder.lessThanOrEqualTo(expression, (Comparable) filter.value));
							break;
						case IN:
							In in = builder.in(expression);
							String[] valueStrings = StringUtils.split(filter.value.toString(), ",");
							List<Long> list = new ArrayList<Long>();
							for(String value : valueStrings){
								list.add(Long.valueOf(value.trim()));
							}
							in.value(list);
							
							predicates.add(in);
							
							break;
						case NOTIN:
							In in1 = builder.in(expression);
							String[] valueStrings1 = StringUtils.split(filter.value.toString(), ",");
							List<Long> list1 = new ArrayList<Long>();
							for(String value : valueStrings1){
								list1.add(Long.valueOf(value.trim()));
							}
							in1.value(list1);
							
							predicates.add(builder.not(in1));
							break;
						}
					}

					// 将所有条件用 and 联合起来
					if (!predicates.isEmpty()) {
						return builder.and(predicates.toArray(new Predicate[predicates.size()]));
					}
				}
				
				
				//手动设置hibernate二级缓存
				//org.hibernate.ejb.criteria.CriteriaQueryImpl
				if(query instanceof org.hibernate.ejb.QueryImpl) {  
					@SuppressWarnings("rawtypes")
					org.hibernate.ejb.QueryImpl hibernateQuery = (org.hibernate.ejb.QueryImpl)query;  
					org.hibernate.Query hQuery = hibernateQuery.getHibernateQuery();
					hQuery.setCacheable(true);
				}
				
				return builder.conjunction();
			}
		};
	}
}
