package cn.imethan.service.cms;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.cms.Article;


/**
 * ArticleService.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:45:56
 */
public interface ArticleService {
	
	/**
	 * 测试方法
	 *
	 * @author Ethan
	 * @datetime 2015年9月1日 下午2:10:15
	 */
	public void test();
	
	
	public void  testSearch();
	
	/**
	 * 保存或者修改
	 * @param entity
	 * @return
	 */
	public ReturnDto saveOrModify(Article entity);
	
	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 */
	public Article getById(Long id);
	
	/**
	 * 根据ID删除
	 * @param id
	 * @return
	 */
	public ReturnDto deleteById(Long id);
	
	/**
	 * 获取文章列表
	 * @param filters
	 * @param pageable
	 * @return
	 */
	Page<Article> findPage(List<SearchFilter> filters, PageRequest pageable);
	
	/**
	 * 更新发布状态
	 * @param id
	 * @return
	 */
	public ReturnDto updatePublish(Long id);
	
	/**
	 * 获取最新发布的文章
	 * @param count
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2015年12月19日下午4:19:03
	 */
	public List<Article> getTopCountArticleList(Integer count);
	
	
	/**
	 * 获取包括文章的上一篇和下一篇的文章详情
	 * @param article
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2016年1月1日上午8:41:12
	 */
	public Article getArticleWithPrevAndNext(Long articleId);
	
	/**
	 * 获取首页文章统计数
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2016年1月5日下午3:46:08
	 */
	public Long getIndexArticleCount();
	

}
