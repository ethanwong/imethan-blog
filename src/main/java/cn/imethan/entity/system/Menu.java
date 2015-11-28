package cn.imethan.entity.system;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.imethan.common.entity.BaseEntity;


/**
 * Menu.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年11月28日上午10:06:33
 */
@Entity
@Table(name="imethan_sys_menu")
public class Menu extends BaseEntity {
	
	private static final long serialVersionUID = 8181933331896342979L;
	private String name;
	private String url;
	private Integer orderNo;
	private boolean isShow;
	private String description;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	public boolean isShow() {
		return isShow;
	}
	public void setShow(boolean isShow) {
		this.isShow = isShow;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
