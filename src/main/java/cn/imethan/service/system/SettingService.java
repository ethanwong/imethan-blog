package cn.imethan.service.system;

import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.system.Setting;

/**
 * SettingService.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年11月25日上午9:57:58
 */
public interface SettingService {
	
	/**
	 * 保存
	 * @param entity
	 * @return
	 */
	public ReturnDto save(Setting entity);
	
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
	public Setting getById(Long id);
	
	/**
	 * 根据代码获取
	 * @param code
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2015年11月25日上午10:01:33
	 */
	public Setting getByCode(String code);
	
	/**
	 * 更新简历配置
	 * @param isPublish
	 * @param content
	 * @return
	 *
	 * @author Ethan Wong
	 * @datetime 2015年11月25日下午2:04:12
	 */
	public ReturnDto updateAboutSet(boolean isPublish, String content);

}
