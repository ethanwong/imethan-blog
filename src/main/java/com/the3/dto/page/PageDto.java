package com.the3.dto.page;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

/**
 * 
 * @author ETHAN
 *
 * @param <T>
 */
public class PageDto<T> extends PageImpl<T> implements Page<T> {

	private static final long serialVersionUID = -2049979799924981352L;
	
	public PageDto(List<T> content) {
		super(content);
	}

}
