package cn.imethan.entity.cms;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ToStringBuilder;

import cn.imethan.common.entity.BaseEntity;

/**
 * Channel.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:32
 */
@Entity
@Table(name="imethan_cms_channel")
public class Channel extends BaseEntity {
	
	private static final long serialVersionUID = 567346114281964527L;
	
	@NotNull
	@Size(min=1, max=20,message="name must be between 1 and 20")
	private String name;//标题
	
	@NotNull
	@Size(min=1,message="intro must not by null")
	private String intro;//介绍
	
	private boolean isPublish;//是否发布
	
	private int articleAmount = 0;//文章数量
	
	private Integer orderNo = 0;//排序
	
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	public int getArticleAmount() {
		return articleAmount;
	}
	public void setArticleAmount(int articleAmount) {
		this.articleAmount = articleAmount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	public boolean isPublish() {
		return isPublish;
	}
	public void setPublish(boolean isPublish) {
		this.isPublish = isPublish;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
