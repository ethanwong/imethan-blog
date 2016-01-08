package cn.imethan.service.system.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.system.Setting;
import cn.imethan.entity.system.SettingCode;
import cn.imethan.repository.system.SettingRepository;
import cn.imethan.service.system.SettingService;

/**
 * SettingServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:01:34
 */
@Service
@Transactional(readOnly = true)
public class SettingServiceImpl implements SettingService {
	
	private Logger logger = LogManager.getLogger(SettingServiceImpl.class);
	
	@Autowired
	private SettingRepository settingRepository;

	@Override
	@Transactional(readOnly = false)
	public ReturnDto save(Setting entity) {
		try {
			settingRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return new ReturnDto(false,"保存失败");
		}
		return new ReturnDto(true,"保存成功");
	}

	@Override
	@Transactional(readOnly = false)
	public ReturnDto deleteById(Long id) {
		try {
			settingRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return new ReturnDto(false,"删除异常");
		}
		return new ReturnDto(true,"删除成功");
	}

	@Override
	public Setting getById(Long id) {
		return settingRepository.findOne(id);
	}

	@Override
	public Setting getByCode(String code) {
		return settingRepository.findByCode(code);
	}

	@Override
	@Transactional(readOnly = false)
	public ReturnDto updateAboutSet(boolean isPublish, String content) {
		try {
			String code = SettingCode.RESUME.name();
			Setting setting = this.getByCode(code);
			if(setting != null){
				setting.setName("简历发布配置");
				setting.setDescription(content);
				setting.setContent(String.valueOf(isPublish));
			}else{
				setting = new Setting();
				setting.setName("简历发布配置");
				setting.setCode(code);
				setting.setDescription(content);
				setting.setContent(String.valueOf(isPublish));
			}
			
			settingRepository.save(setting);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			new ReturnDto(false,"更新异常");
		}
		
		return new ReturnDto(true,"更新成功");
	}

	@Override
	@Transactional(readOnly = false)
	public ReturnDto updateSiteInfo(String sitename, String copyright) {
		try {
			Setting sitenameDb = this.getByCode(SettingCode.SITENAME.name());
			Setting copyrightDb = this.getByCode(SettingCode.COPYRIGHT.name());
			
			if(sitenameDb != null && copyrightDb!=null ){
				sitenameDb.setContent(sitename);
				copyrightDb.setContent(copyright);
				
				settingRepository.save(sitenameDb);
				settingRepository.save(copyrightDb);
			}else{
				
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			new ReturnDto(false,"更新异常");
		}
		
		return new ReturnDto(true,"更新成功");
	}
}