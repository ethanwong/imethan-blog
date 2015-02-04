package com.the3.repository.todo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.the3.entity.todo.Todo;


@Repository
public interface TodoRepository extends JpaRepository<Todo, Long>,JpaSpecificationExecutor<Todo> {
	
	@Modifying 
	@Query("update Todo a set a.finish = ?2 where a.id = ?1")
	int updateFinish(long id, boolean finish);
	
	@Modifying 
	@Query("update Todo a set a.content = ?2 where a.id = ?1")
	int updateContent(Long id, String content);
	
	

}
