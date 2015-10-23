package cn.imethan.service.todo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.todo.Todo;


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
	
	/**
	 * 更新是否完成
	 * @param id
	 * @param finish
	 * @return
	 */
	public ReturnDto finish(long id, boolean finish);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public ReturnDto delete(long id);
	
	/**
	 * 提升排序
	 * @param id
	 * @param nextOrderNo
	 * @param previousOrderNo
	 * @return
	 */
	public ReturnDto upTodo(Long id, int nextOrderNo, int previousOrderNo);
	
	/**
	 * 降低排序
	 * @param id
	 * @param nextOrderNo
	 * @param previousOrderNo
	 * @return
	 */
	public ReturnDto downTodo(Long id, int nextOrderNo, int previousOrderNo);
	
	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 */
	public Todo getById(Long id);

}


