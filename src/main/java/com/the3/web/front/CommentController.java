package com.the3.web.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.repository.SearchFilter;
import com.the3.base.web.SuperController;
import com.the3.dto.common.ReturnDto;
import com.the3.dto.page.GridPageDto;
import com.the3.entity.comment.Comment;
import com.the3.entity.comment.CommentType;
import com.the3.service.comment.CommentService;




@Controller
@RequestMapping("/comment")
public class CommentController extends SuperController{
	
	@Autowired
	private CommentService commentService;
    
	@ResponseBody
	@RequestMapping(value = "cms/save" , method = RequestMethod.POST)
    public ReturnDto saveCmsComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result,ServletRequest request){
		ReturnDto returnDto = new ReturnDto();
		if(result.hasFieldErrors()){
			returnDto.setMessage("参数验证出现异常:"+result.getFieldError().getDefaultMessage());
			returnDto.setSuccess(false);
		}else{
			comment.setType(CommentType.CMS);
			returnDto = commentService.save(comment);
		}
		return returnDto;
	}
	
	
	@RequestMapping(value = "cms/{page}",method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public GridPageDto<Comment> cmsJson(@PathVariable Integer page,Model model,@RequestParam Long extendId){
		PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		SearchFilter extendIdSearchFilter = new SearchFilter("extendId",SearchFilter.Operator.EQ,extendId);
		SearchFilter typeSearchFilter = new SearchFilter("type",SearchFilter.Operator.EQ,CommentType.CMS);
		filters.add(extendIdSearchFilter);
		filters.add(typeSearchFilter);
		Page<Comment> result = commentService.findPage(filters, pageable);
		
		return new GridPageDto<Comment>(result);
	}
	
	

}


