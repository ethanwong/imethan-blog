package cn.imethan.service.cms.impl;

import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.imethan.common.repository.DynamicSpecifications;
import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.cms.Label;
import cn.imethan.repository.cms.LabelRepository;
import cn.imethan.service.cms.LabelService;

/**
 * LabelServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:45:52
 */
@Service
@Transactional(readOnly = true)
public class LabelServiceImpl implements LabelService {
	
	private Logger logger = LogManager.getLogger(LabelServiceImpl.class);
	
	@Autowired
	private LabelRepository labelRepository;

	@Transactional(readOnly = false)
	@Override
	public ReturnDto saveOrModify(Label entity) {
		boolean isSuccess = true;
		String message = "保存成功";
		try {
			if(entity.getId() != null){
				entity.setModifyTime(new Date());
			}else{
				entity.setCreateTime(new Date());
			}
			entity = labelRepository.saveAndFlush(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "保存失败";
			logger.error(e.getMessage());
		}
		return new ReturnDto(isSuccess,message,entity);
	}
	
	@Override
	public Page<Label> findPage(List<SearchFilter> filters, PageRequest pageable) {
		Page<Label> result = null;
		try {
			Specification<Label> spec = DynamicSpecifications.bySearchFilter(filters, Label.class);
			result = labelRepository.findAll(spec, pageable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Label getById(Long id) {
		Label entity = new Label();
		try {
			entity = labelRepository.findOne(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return entity;
	}
	
	@Override
	@Transactional(readOnly = false)
	public ReturnDto deleteById(Long id) {
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			labelRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSuccess = false;
			message = "删除失败";
		}
		return new ReturnDto(isSuccess,message);
	}


	@Override
	public List<Label> getList(List<SearchFilter> filters) {
		try {
	    	
			Specification<Label> spec = DynamicSpecifications.bySearchFilter(filters, Label.class);
			return labelRepository.findAll(spec,new Sort(new Order(Direction.DESC, "orderNo")).and(new Sort(new Order(Direction.DESC, "id"))));
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}