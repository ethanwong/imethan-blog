package cn.imethan.web.front;

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

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.common.web.SuperController;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.dto.page.GridPageDto;
import cn.imethan.entity.comment.Comment;
import cn.imethan.entity.comment.CommentType;
import cn.imethan.service.comment.CommentService;




/**
 * CommentController.java
 *
 * @author Ethan Wong
 * @time 2015年1月14日下午9:05:55
 */
@Controller
@RequestMapping("/comment")
public class CommentController extends SuperController{
	
	@Autowired
	private CommentService commentService;
    
	@ResponseBody
	@RequestMapping(value = "cms/save" , method = {RequestMethod.POST,RequestMethod.GET})
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


