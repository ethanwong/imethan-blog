package cn.imethan.entity.system;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import cn.imethan.common.entity.BaseEntity;


/**
 * Setting.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年11月25日上午9:54:28
 */
@Entity
@Table(name="imethan_sys_setting")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE,region="cmsCache") 
public class Setting extends BaseEntity {
	
	private static final long serialVersionUID = 4060744972143466144L;
	
	private String name;//配置名称
	private String code;//配置编码
	private String content;//名称内容
	private String description;//配置描述
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
