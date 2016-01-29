package cn.imethan.entity.cms;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import cn.imethan.common.entity.BaseEntity;

/**
 * Article.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:26
 */
@Entity
@Table(name="imethan_cms_article")
@JsonIgnoreProperties(value={"channel"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE,region="cmsCache")
@Indexed//标明这个实体需要被Lucene创建索引，从而使之可以被检索
@Analyzer(impl = org.apache.lucene.analysis.standard.StandardAnalyzer.class)//告诉Hibernate Search来标记它的域以及更新Lucene索引的时候使用哪个Lucene分析器。
public class Article extends BaseEntity {

	private static final long serialVersionUID = 3135828776040100046L;
	
	@Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)
	private String title;//标题
	
	@Field(index=Index.YES, analyze=Analyze.YES, store=Store.NO)//诉Hibernate Search为该字段创建爱你索引，并且提供一些其他信息，比如该字段在索引中需要被如何处置。
	private String content;//内容
	
	private boolean isPublish;//是否发布
	
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE,region="cmsCache") 
	@ManyToOne(cascade = {CascadeType.REFRESH},fetch = FetchType.EAGER)
	@JoinColumn(name="channelId")
	private Channel channel;//栏目
	
	@Transient
	private String channelName;//栏目名称
	@Transient
	private Long channelId;//栏目ID
	@Transient
	private Article prev;//上一篇文章
	@Transient
	private Article next;//下一篇文章
	
	
	public Article getPrev() {
		return prev;
	}
	public void setPrev(Article prev) {
		this.prev = prev;
	}
	public Article getNext() {
		return next;
	}
	public void setNext(Article next) {
		this.next = next;
	}
	
	//ManyToMany双向级联问题描述
	//CascadeType.MERGE  级联删除、更新、保存关系，
	//新增加article,并且添加一条article和lable的关系级联，不能配置CascadeType.PERSIST，否则hibernate会插入一条新记录中，但是因为ID相同导致插入失败
	//CascadeType.PERSIST 级联添加，例如保存article时同时添加一条label记录
	//CascadeType.REMOVE 级联删除记录和关系
	
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE,region="cmsCache") 
	@ManyToMany(fetch = FetchType.LAZY,cascade = {CascadeType.MERGE})
    @JoinTable(name="imethan_cms_article_label",joinColumns = { @JoinColumn(name ="articleId" )} ,inverseJoinColumns = { @JoinColumn(name = "labelId")})
	@OrderBy("orderNo")
	private List<Label> labels = new ArrayList<Label>();//标签集合
	public List<Label> getLabels() {
		return labels;
	}
	public void setLabels(List<Label> labels) {
		this.labels = labels;
	}
	public Long getChannelId() {
		if(channel != null){
			return channel.getId();
		}else{
			return channelId;
		}
		
	}
	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}
	public String getChannelName() {
		if(channel != null){
			return channel.getName();
		}else{
			return channelName;
		}
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public Channel getChannel() {
		return channel;
	}
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
