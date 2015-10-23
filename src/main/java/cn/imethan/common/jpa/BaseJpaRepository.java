package cn.imethan.common.jpa;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * BaseJpaRepository.java
 *
 * @author Ethan Wong
 * @time 2015年9月1日上午11:20:23
 */
@NoRepositoryBean
public interface BaseJpaRepository<T,ID extends Serializable> extends JpaRepository<T, ID>,JpaSpecificationExecutor<T>{

}


