package cn.imethan.service.cms;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.cms.Channel;

/**
 * ChannelService.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:46:01
 */
public interface ChannelService{
	
	/**
	 * 保存或更新
	 * @param entity
	 * @return
	 */
	public ReturnDto saveOrModify(Channel entity);
	
	/**
	 * 获取列表
	 * @param filters
	 * @return
	 */
	public List<Channel> getList(List<SearchFilter> filters);
	
	/**
	 * 获取分页列表
	 * @param parameters
	 * @param pageable
	 * @return
	 */
	public Page<Channel> findPage(List<SearchFilter> filters, PageRequest pageable);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public ReturnDto deleteById(Long id);
	
	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 */
	public Channel getById(Long id);
	
	/**
	 * 更新发布状态
	 * @param id
	 * @return
	 */
	public ReturnDto updatePublish(Long id);
	
	/**
	 * 更新文章数量
	 * @param id
	 * @param changeAmount 
	 * @return
	 */
	public ReturnDto updateArticleAmount(Long id,int changeAmount);
	
	/**
	 * 获取栏目文章统计图信息
	 * @return
	 */
	public Map<String,Object> getChannelArticleChartInfo();
	
	/**
	 * 获取首页栏目统计数
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2016年1月5日下午3:46:08
	 */
	public Long getIndexChannelCount();

	
	
}