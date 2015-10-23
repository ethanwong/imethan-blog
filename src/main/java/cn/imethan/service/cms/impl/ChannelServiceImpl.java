package cn.imethan.service.cms.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.imethan.common.repository.DynamicSpecifications;
import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.cms.Channel;
import cn.imethan.repository.cms.ChannelRepository;
import cn.imethan.service.cms.ChannelService;

/**
 * ChannelServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:45:52
 */
@Service
@Transactional(readOnly = true)
public class ChannelServiceImpl implements ChannelService {
	
	private Logger logger = LogManager.getLogger(ChannelServiceImpl.class);
	
	@Autowired
	private ChannelRepository channelRepository;

	@Transactional(readOnly = false)
	@Override
	public ReturnDto saveOrModify(Channel entity) {
		boolean isSuccess = true;
		String message = "保存成功";
		try {
			if(entity.getId() != null){
				entity.setArticleAmount(this.getById(entity.getId()).getArticleAmount());
				entity.setModifyTime(new Date());
			}else{
				entity.setCreateTime(new Date());
			}
			entity = channelRepository.saveAndFlush(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "保存失败";
			logger.error(e.getMessage());
		}
		return new ReturnDto(isSuccess,message,entity);
	}
	
	@Override
	public Page<Channel> getPage(Map<String,Object> parameters,PageRequest pageable) {
		try {
//			return super.getPage(parameters, pageable, Channel.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return null;
	}
	
	@Override
	public Channel getById(Long id) {
		Channel entity = new Channel();
		try {
			entity = channelRepository.findOne(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return entity;
	}
	
	@Override
	@Transactional(readOnly = false)
	public ReturnDto deleteById(Long id) {
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			channelRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSuccess = false;
			message = "删除失败";
		}
		return new ReturnDto(isSuccess,message);
	}


	@Override
	public List<Channel> getList(List<SearchFilter> filters) {
		try {
			//如果没有登录不展现未发布栏目
			if(!SecurityUtils.getSubject().isAuthenticated()){
		    	SearchFilter channelFilter = new SearchFilter("isPublish",SearchFilter.Operator.EQ,true);
		    	filters.add(channelFilter);
			}
	    	
			Specification<Channel> spec = DynamicSpecifications.bySearchFilter(filters, Channel.class);
			return channelRepository.findAll(spec);
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public ReturnDto updatePublish(Long id) {
		boolean flag = true;
		String message = "更新成功";
		boolean publish = true;
		if(this.getById(id).isPublish()){
			publish = false;
		};
		
		try {
			channelRepository.updatePublish(id,publish);
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			message = "更新失败";
		}
		
		return new ReturnDto(flag,message);
	}

	@Override
	@Transactional(readOnly = false)
	public ReturnDto updateArticleAmount(Long id,int changeAmount) {
		boolean flag = true;
		String message = "更新成功";
		try {
			int sourceAmount = this.getById(id).getArticleAmount();
			int targetAmount = sourceAmount+changeAmount;
			int result = channelRepository.updateArticleAmount(id,targetAmount);
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			message = "更新失败";
		}
		return new ReturnDto(flag,message);
	}

	@Override
	public Map<String, Object> getChannelArticleChartInfo() {
		Map<String,Object> map = new HashMap<String,Object>();
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		List<Channel> channelList = this.getList(filters);
		String channelName = "[";
		String articleAmount = "[";
		int size = channelList.size();
		for(Channel channel:channelList){
			
			String name = "'"+channel.getName()+"'";
			String amount = String.valueOf(channel.getArticleAmount());
			
			channelName += name;
			articleAmount += amount;
			
			if(channelList.indexOf(channel)!=(size-1)){
				channelName += ",";
				articleAmount += ",";
			}else{
				channelName += "]";
				articleAmount += "]";
			}
		}
		map.put("channelName", channelName);
		map.put("articleAmount", articleAmount);
		
		return map;
	}

}