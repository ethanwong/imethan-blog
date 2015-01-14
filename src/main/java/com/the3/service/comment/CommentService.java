package com.the3.service.comment;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.comment.Comment;


public interface CommentService {
	
	/**
	 * 保存消息
	 * @param entity
	 * @return
	 */
	public ReturnDto save(Comment entity);
	
	/**
	 * 获取消息分页列表
	 * @param filters
	 * @param pageable
	 * @return
	 */
	public Page<Comment> findPage(List<SearchFilter> filters,PageRequest pageable);

}


