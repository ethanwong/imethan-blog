package cn.imethan.dto.page;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

/**
 * GridPageDto.java
 *
 * @author ETHAN
 * @time 2014年3月8日下午2:42:17
 */
public class GridPageDto<T> {
	
	private Integer page;//当前页
	private Integer size;//页记录数
	private Integer total;//总页数
	private Long records;//总记录数
	private boolean previous;//是否有上一页
	private boolean next;//是否有下一页
	private List<T> rows = new ArrayList<T>();//结果集合
	
	public GridPageDto(Page<T> page){
		this.page = page.getNumber()+1;
		this.total = page.getTotalPages();
		this.records = page.getTotalElements();
		this.rows = page.getContent();
		this.previous = page.hasPrevious();
		this.next = page.hasNext();
		this.size = page.getSize();
		
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Long getRecords() {
		return records;
	}

	public void setRecords(Long records) {
		this.records = records;
	}

	public boolean isPrevious() {
		return previous;
	}

	public void setPrevious(boolean previous) {
		this.previous = previous;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}
	
	

}
