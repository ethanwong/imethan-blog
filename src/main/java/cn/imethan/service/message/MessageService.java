package cn.imethan.service.message;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.message.Message;

/**
 * ContactService.java
 *
 * @author Ethan Wong
 * @time 2014年12月24日下午11:36:13
 */
public interface MessageService {
	
	/**
	 * 保存消息
	 * @param message
	 * @return
	 */
	public ReturnDto save(Message entity);
	
	/**
	 * 获取消息分页列表
	 * @param filters
	 * @param pageable
	 * @return
	 */
	public Page<Message> findPage(List<SearchFilter> filters,PageRequest pageable);
	
	/**
	 * 隐藏消息
	 * @param id
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2015年10月23日上午11:03:07
	 */
	public ReturnDto hidden(Long id);
	
	/**
	 * 根据ID删除
	 * @param id
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2015年10月23日上午11:12:15
	 */
	public ReturnDto deleteById(Long id);

}


