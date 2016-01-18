package cn.imethan.service.todo.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.imethan.common.repository.DynamicSpecifications;
import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.todo.Todo;
import cn.imethan.entity.todo.TodoItem;
import cn.imethan.repository.jpa.todo.TodoItemRepository;
import cn.imethan.repository.jpa.todo.TodoRepository;
import cn.imethan.service.todo.TodoItemService;

/**
 * TodoItemServiceImpl.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年12月16日下午3:37:19
 */
@Service
@Transactional(readOnly = true)
public class TodoItemServiceImpl implements TodoItemService {
	
	private Logger logger = LogManager.getLogger(TodoItemServiceImpl.class);
	
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
				entity.setCreateTime(new Date());
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

	@Override
	@Transactional(readOnly = false)
	public ReturnDto updatePublish(Long id) {
		boolean flag = true;
		String message = "更新成功";
		boolean publish = true;
		if(todoItemRepository.findOne(id).isPublish()){
			publish = false;
		};
		
		try {
			todoItemRepository.updatePublish(id,publish);
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			message = "更新失败";
		}
		
		return new ReturnDto(flag,message);
	}
}