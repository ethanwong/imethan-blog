package cn.imethan.entity.cms;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.imethan.common.entity.BaseEntity;

/**
 * Label.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年12月16日下午2:27:44
 */
@Entity
@Table(name="imethan_cms_label")
public class Label extends BaseEntity {

	private static final long serialVersionUID = -2463983764239869080L;
	
	private String name;//标签名称
	private Integer orderNo;//排序

	public Integer getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
