package cn.imethan.entity.todo;

import javax.persistence.Entity;
import javax.persistence.Table;

import cn.imethan.common.entity.BaseEntity;

@Entity
@Table(name="imethan_sys_todo_item")
public class TodoItem extends BaseEntity {
	
	private static final long serialVersionUID = -8151503793982333196L;
	private String name;//名称
	private boolean publish = false;//是否发布

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isPublish() {
		return publish;
	}

	public void setPublish(boolean publish) {
		this.publish = publish;
	}
}