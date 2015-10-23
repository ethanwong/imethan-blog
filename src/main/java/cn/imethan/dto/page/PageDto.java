package cn.imethan.dto.page;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

/**
 * PageDto.java
 *
 * @author ETHAN
 * @time 2014年3月8日下午2:42:17
 */
public class PageDto<T> extends PageImpl<T> implements Page<T> {

	private static final long serialVersionUID = -2049979799924981352L;
	
	public PageDto(List<T> content) {
		super(content);
	}

}
