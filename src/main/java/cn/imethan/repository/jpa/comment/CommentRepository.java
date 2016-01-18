package cn.imethan.repository.jpa.comment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cn.imethan.entity.comment.Comment;


@Repository
public interface CommentRepository extends JpaRepository<Comment, Long>,JpaSpecificationExecutor<Comment> {
	
	

}
