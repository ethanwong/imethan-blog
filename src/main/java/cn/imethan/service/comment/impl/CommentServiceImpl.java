package cn.imethan.service.comment.impl;


import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.imethan.common.repository.DynamicSpecifications;
import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.comment.Comment;
import cn.imethan.repository.jpa.comment.CommentRepository;
import cn.imethan.service.comment.CommentService;


@Service
@Transactional(readOnly = true)
public class CommentServiceImpl implements CommentService {
	
	private Logger logger = LogManager.getLogger(CommentServiceImpl.class);
	
	@Autowired
	private CommentRepository commentRepository;
	

	@Override
	@Transactional(readOnly = false)
	public ReturnDto save(Comment entity) {
		boolean isSuccess = true;
		String message = "保存成功";
		try {
			entity.setCreateTime(new Date());
			entity = commentRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "保存失败";
			logger.error(e.getMessage());
		}
		return new ReturnDto(isSuccess,message,entity);
	}


	@Override
	public Page<Comment> findPage(List<SearchFilter> filters,PageRequest pageable) {
		Page<Comment> result = null;
		
		try {
			Specification<Comment> spec = DynamicSpecifications.bySearchFilter(filters, Comment.class);
			
			result = commentRepository.findAll(spec, pageable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}


