package cn.imethan.service.system.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.system.Menu;
import cn.imethan.repository.system.MenuRepository;
import cn.imethan.service.system.MenuService;

/**
 * MenuServiceImpl.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年11月28日上午10:11:51
 */
@Service
@Transactional(readOnly = true)
public class MenuServiceImpl implements MenuService {
	
	private Logger logger = LogManager.getLogger(MenuServiceImpl.class);
	
	@Autowired
	private MenuRepository menuRepository;

	@Override
	@Transactional(readOnly = false)
	public ReturnDto save(Menu entity) {
		try {
			menuRepository.save(entity);
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
			menuRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return new ReturnDto(false,"删除异常");
		}
		return new ReturnDto(true,"删除成功");
	}

	@Override
	public Menu getById(Long id) {
		return menuRepository.findOne(id);
	}

	@Override
	public List<Menu> getAll() {
		return menuRepository.findAll();
	}
}


