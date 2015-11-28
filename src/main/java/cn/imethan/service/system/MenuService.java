package cn.imethan.service.system;

import java.util.List;

import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.system.Menu;


/**
 * MenuService.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年11月28日上午10:10:44
 */
public interface MenuService {
	
	/**
	 * 保存
	 * @param entity
	 * @return
	 */
	public ReturnDto save(Menu entity);
	
	/**
	 * 根据ID删除
	 * @param id
	 * @return
	 */
	public ReturnDto deleteById(Long id);
	
	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2015年11月25日上午10:00:11
	 */
	public Menu getById(Long id);
	
	/**
	 * 获取列表
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2015年11月28日上午10:18:15
	 */
	public List<Menu> getAll();

}
