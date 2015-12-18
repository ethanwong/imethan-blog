package cn.imethan.service.cms;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.cms.Label;


/**
 * LabelService.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年12月16日下午2:30:46
 */
public interface LabelService{
	
	/**
	 * 保存或更新
	 * @param entity
	 * @return
	 */
	public ReturnDto saveOrModify(Label entity);
	
	/**
	 * 获取列表
	 * @param filters
	 * @return
	 */
	public List<Label> getList(List<SearchFilter> filters);
	
	/**
	 * 获取分页列表
	 * @param parameters
	 * @param pageable
	 * @return
	 */
	public Page<Label> findPage(List<SearchFilter> filters, PageRequest pageable);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public ReturnDto deleteById(Long id);
	
	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 */
	public Label getById(Long id);

	
	
}