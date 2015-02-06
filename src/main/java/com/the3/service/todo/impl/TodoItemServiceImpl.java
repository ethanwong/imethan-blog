package com.the3.service.todo.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.base.repository.DynamicSpecifications;
import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.todo.Todo;
import com.the3.entity.todo.TodoItem;
import com.the3.repository.todo.TodoItemRepository;
import com.the3.repository.todo.TodoRepository;
import com.the3.service.todo.TodoItemService;

@Service
@Transactional(readOnly = true)
public class TodoItemServiceImpl implements TodoItemService {
	
	private Logger logger = Logger.getLogger(TodoItemServiceImpl.class);  
	
	@Autowired
	private TodoItemRepository todoItemRepository;
	@Autowired
	private TodoRepository todoRepository;

	@Override
	@Transactional(readOnly = false)
	public ReturnDto save(TodoItem entity) {
		boolean isSuccess = true;
		String message = "保存成功";
		try {
			if(entity.getId() != null){
				int result = todoItemRepository.updateName(entity.getId(),entity.getName());
			}else{
				entity = todoItemRepository.save(entity);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "保存失败";
			logger.error(e.getMessage());
		}
		return new ReturnDto(isSuccess,message,entity);
	}

	@Override
	@Transactional(readOnly = false)
	public ReturnDto delete(long id) {
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			List<SearchFilter> filters = new ArrayList<SearchFilter>();//检索条件列表
			SearchFilter itemSearchFilter = new SearchFilter("todoItem.id",SearchFilter.Operator.EQ,id);
			filters.add(itemSearchFilter);
			Specification<Todo> spec = DynamicSpecifications.bySearchFilter(filters, Todo.class);
			List<Todo> list = todoRepository.findAll(spec);
			if(list.isEmpty()){
				todoItemRepository.delete(id);
			}else{
				isSuccess = false;
				message = "删除失败,请删除关联的todo";
			}
			
			
		} catch (Exception e) {
			isSuccess = false;
			message = "删除失败";
			e.printStackTrace();
		}
		return new ReturnDto(isSuccess,message);
	}

	@Override
	public List<TodoItem> getAll(List<SearchFilter> filters) {
		Specification<TodoItem> spec = DynamicSpecifications.bySearchFilter(filters, TodoItem.class);
		return todoItemRepository.findAll(spec);
	}
}