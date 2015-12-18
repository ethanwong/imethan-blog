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
public class Article extends BaseEntity {

	private static final long serialVersionUID = 3135828776040100046L;
	
	private String title;//标题
	private String content;//内容
	private boolean isPublish;//是否发布
	
	@ManyToOne(cascade = {CascadeType.REFRESH},fetch = FetchType.EAGER)
	@JoinColumn(name="channelId")
	private Channel channel;//栏目
	
	@Transient
	private String channelName;//栏目名称
	@Transient
	private Long channelId;//栏目ID
	
	
	
	@ManyToMany(fetch = FetchType.EAGER)
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
