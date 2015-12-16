package cn.imethan.repository.cms;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cn.imethan.entity.cms.Label;


/**
 * LabelRepository.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年12月16日下午2:30:02
 */
@Repository
public interface LabelRepository extends JpaRepository<Label, Long>,JpaSpecificationExecutor<Label> {



}
