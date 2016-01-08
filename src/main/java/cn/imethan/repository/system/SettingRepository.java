package cn.imethan.repository.system;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import cn.imethan.entity.system.Setting;


@Repository
public interface SettingRepository extends JpaRepository<Setting, Long>,JpaSpecificationExecutor<Setting> {
	
	@QueryHints({@QueryHint(name = "org.hibernate.cacheable", value ="true") }) 
	Setting findByCode(String code);
	


}
