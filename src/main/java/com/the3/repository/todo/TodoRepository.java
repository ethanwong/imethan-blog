package com.the3.repository.todo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.the3.entity.todo.Todo;


@Repository
public interface TodoRepository extends JpaRepository<Todo, Long>,JpaSpecificationExecutor<Todo> {
	
	

}
