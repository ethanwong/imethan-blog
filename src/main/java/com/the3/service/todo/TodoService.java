package com.the3.service.todo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.todo.Todo;


public interface TodoService {
	
	/**
	 * 保存
	 * @param entity
	 * @return
	 */
	public ReturnDto save(Todo entity);
	
	/**
	 * 获取分页列表
	 * @param filters
	 * @param pageable
	 * @return
	 */
	public Page<Todo> findPage(List<SearchFilter> filters,PageRequest pageable);

}


