package com.the3.service.todo;

import java.util.List;

import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.todo.TodoItem;


public interface TodoItemService {
	
	/**
	 * 保存
	 * @param entity
	 * @return
	 */
	public ReturnDto save(TodoItem entity);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public ReturnDto delete(long id);
	
	/**
	 * 获取列表
	 * @return
	 */
	public List<TodoItem> getAll(List<SearchFilter> filters);
	
	

}


