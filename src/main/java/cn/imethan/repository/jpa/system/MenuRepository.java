package cn.imethan.repository.jpa.system;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cn.imethan.entity.system.Menu;


/**
 * MenuRepository.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年11月28日上午10:09:42
 */
@Repository
public interface MenuRepository extends JpaRepository<Menu, Long>,JpaSpecificationExecutor<Menu> {
	
	


}
