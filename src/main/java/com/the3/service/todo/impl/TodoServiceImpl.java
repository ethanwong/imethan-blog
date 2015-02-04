package com.the3.service.todo.impl;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.base.repository.DynamicSpecifications;
import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.todo.Todo;
import com.the3.repository.todo.TodoRepository;
import com.the3.service.todo.TodoService;


@Service
@Transactional(readOnly = true)
public class TodoServiceImpl implements TodoService {
	
	private Logger logger = Logger.getLogger(TodoServiceImpl.class);  
	
	@Autowired
	private TodoRepository todoRepository;
	

	@Override
	@Transactional(readOnly = false)
	public ReturnDto save(Todo entity) {
		boolean isSuccess = true;
		String message = "保存成功";
		try {
			if(entity.getId() != null){
				int result = todoRepository.updateContent(entity.getId(),entity.getContent());
			}else{
				entity = todoRepository.save(entity);
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
	public Page<Todo> findPage(List<SearchFilter> filters,PageRequest pageable) {
		Page<Todo> result = null;
		
		try {
			Specification<Todo> spec = DynamicSpecifications.bySearchFilter(filters, Todo.class);
			result = todoRepository.findAll(spec, pageable);
			
			List<Todo> list = result.getContent();
			int i = 0;
			int size = list.size();
			int last = size -1;

			for(;i<size;i++){
				Integer currentId = 0;
				Integer nextOrderNo = 0;
				Integer previousOrderNo = 0;
				
				if(i != last){
					nextOrderNo = list.get(i+1).getOrderNo();
				}
				if(i != 0){
					previousOrderNo = list.get(i-1).getOrderNo();
				}
				
				currentId = list.get(i).getOrderNo();
				
				list.get(i).setNextOrderNo(nextOrderNo);
				list.get(i).setPreviousOrderNo(previousOrderNo);
				
				System.out.println("currentId:"+currentId +"-nextId:"+nextOrderNo+"-previousId:"+previousOrderNo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	@Override
	@Transactional(readOnly = false)
	public ReturnDto finish(long id, boolean finish) {
		boolean isSuccess = true;
		String message = "更新成功";
		try {
			int result = todoRepository.updateFinish(id,!finish);
		} catch (Exception e) {
			isSuccess = false;
			message = "更新失败";
			e.printStackTrace();
		}
		return new ReturnDto(isSuccess,message);
	}


	@Override
	@Transactional(readOnly = false)
	public ReturnDto delete(long id) {
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			todoRepository.delete(id);
		} catch (Exception e) {
			isSuccess = false;
			message = "删除失败";
			e.printStackTrace();
		}
		return new ReturnDto(isSuccess,message);
	}

}


