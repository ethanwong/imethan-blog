package com.the3.repository.comment;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.the3.entity.comment.Comment;


@Repository
public interface CommentRepository extends JpaRepository<Comment, Long>,JpaSpecificationExecutor<Comment> {
	
	

}
