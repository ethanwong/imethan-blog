package com.the3.repository.todo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.the3.entity.todo.TodoItem;


@Repository
public interface TodoItemRepository extends JpaRepository<TodoItem, Long>,JpaSpecificationExecutor<TodoItem> {

	@Modifying 
	@Query("update TodoItem a set a.name = ?2 where a.id = ?1")
	int updateName(Long id, String name);
	

	

}
