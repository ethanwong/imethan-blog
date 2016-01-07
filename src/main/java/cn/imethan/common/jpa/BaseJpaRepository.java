package cn.imethan.common.jpa;

import java.io.Serializable;
import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * BaseJpaRepository.java
 *
 * @author Ethan Wong
 * @time 2015年9月1日上午11:20:23
 */
@NoRepositoryBean
public interface BaseJpaRepository<T,ID extends Serializable> extends JpaRepository<T, ID>,JpaSpecificationExecutor<T>{
	
	//以下接口默认没有实现查询缓存，需要通过添加@QueryHint注解来实现查询缓存
	
	/**
	 * @org.springframework.data.jpa.repository.JpaSpecificationExecutor
	 * Returns all entities matching the given {@link Specification} and {@link Sort}.
	 * 
	 * @param spec
	 * @param sort
	 * @return
	 */
	@QueryHints({@QueryHint(name = "org.hibernate.cacheable", value ="true") }) 
	List<T> findAll(Specification<T> spec, Sort sort);
	
	/**
	 * @org.springframework.data.jpa.repository.JpaSpecificationExecutor
	 * Returns a {@link Page} of entities matching the given {@link Specification}.
	 * 
	 * @param spec
	 * @param pageable
	 * @return
	 */
	@QueryHints({@QueryHint(name = "org.hibernate.cacheable", value ="true") }) 
	Page<T> findAll(Specification<T> spec, Pageable pageable);
	
	/**
	 * @org.springframework.data.jpa.repository.JpaSpecificationExecutor
	 * Returns all entities matching the given {@link Specification}.
	 * 
	 * @param spec
	 * @return
	 */
	@QueryHints({@QueryHint(name = "org.hibernate.cacheable", value ="true") }) 
	List<T> findAll(Specification<T> spec);
	
	//这样设置没有生效，待进一步测试
	@QueryHints({@QueryHint(name = "org.hibernate.cacheable", value ="true") }) 
	long count(Specification<T> spec);

}