package cn.imethan.repository.system;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cn.imethan.entity.system.Setting;


@Repository
public interface SettingRepository extends JpaRepository<Setting, Long>,JpaSpecificationExecutor<Setting> {
	
	
	Setting findByCode(String code);
	


}
