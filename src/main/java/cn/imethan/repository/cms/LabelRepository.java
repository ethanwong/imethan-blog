package cn.imethan.repository.cms;

import org.springframework.stereotype.Repository;

import cn.imethan.common.jpa.BaseJpaRepository;
import cn.imethan.entity.cms.Label;


/**
 * LabelRepository.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年12月16日下午2:30:02
 */
@Repository
public interface LabelRepository extends BaseJpaRepository<Label, Long>{



}
