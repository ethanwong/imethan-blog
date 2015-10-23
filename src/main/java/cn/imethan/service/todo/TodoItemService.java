package cn.imethan.service.todo;

import java.util.List;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.todo.TodoItem;


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
	
	/**
	 * 更新发布
	 * @param id
	 * @return
	 */
	public ReturnDto updatePublish(Long id);
	
	

}


