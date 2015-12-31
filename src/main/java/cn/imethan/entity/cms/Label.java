package cn.imethan.entity.cms;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	
	@JsonIgnore
	@ManyToMany(cascade = {CascadeType.REMOVE}, mappedBy = "labels", fetch = FetchType.LAZY)
	private List<Article> articles = new ArrayList<Article>();
	
	@Transient
	private boolean isCheck;//是否选中参数
	
	public boolean isCheck() {
		return isCheck;
	}
	public void setCheck(boolean isCheck) {
		this.isCheck = isCheck;
	}
	public Label(){
	}
	public Label(Long id){
		this.setId(id);
	}
	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}

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
