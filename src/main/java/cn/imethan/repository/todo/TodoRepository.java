package cn.imethan.repository.todo;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import cn.imethan.common.jpa.BaseJpaRepository;
import cn.imethan.entity.todo.Todo;


@Repository
public interface TodoRepository extends BaseJpaRepository<Todo, Long>{
	
	@Modifying 
	@Query("update Todo a set a.finish = ?2 where a.id = ?1")
	int updateFinish(long id, boolean finish);
	
	@Modifying 
	@Query("update Todo a set a.content = ?2 where a.id = ?1")
	int updateContent(Long id, String content);
	
	@Modifying 
	@Query("update Todo a set a.orderNo = ?2 where a.id = ?1")
	int updateOrderNO(Long id, int orderNo);

}
