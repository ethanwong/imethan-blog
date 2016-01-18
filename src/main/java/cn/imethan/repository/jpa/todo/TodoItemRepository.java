package cn.imethan.repository.jpa.todo;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import cn.imethan.common.jpa.BaseJpaRepository;
import cn.imethan.entity.todo.TodoItem;


@Repository
public interface TodoItemRepository extends BaseJpaRepository<TodoItem, Long>{

	@Modifying 
	@Query("update TodoItem a set a.name = ?2 where a.id = ?1")
	int updateName(Long id, String name);
	
	@Modifying 
	@Query("update TodoItem a set a.publish = ?2 where a.id = ?1")
	int updatePublish(Long id, boolean publish);
	

	

}
