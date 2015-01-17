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
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.dto.page.GridPageDto;
import com.the3.entity.todo.Todo;
import com.the3.service.todo.TodoService;

/**
 * TodoController.java
 *
 * @author Ethan Wong
 * @time 2014年12月16日下午10:58:03
 */
@Controller
@RequestMapping("/todo")
public class TodoController{
	
	private int page = 0;//默认页位置
	private int size = 10;//默认页大小
	
	@Autowired
	private TodoService todoService;
	
    @RequestMapping("")
    public String todo(Model model) {
    	
        return "front/todo";
    }
    
	@ResponseBody
	@RequestMapping(value = "save" , method = {RequestMethod.POST,RequestMethod.GET})
    public ReturnDto saveCmsComment(@Valid @ModelAttribute("Todo") Todo todo, BindingResult result,ServletRequest request){
		ReturnDto returnDto = new ReturnDto();
		if(result.hasFieldErrors()){
			returnDto.setMessage("参数验证出现异常:"+result.getFieldError().getDefaultMessage());
			returnDto.setSuccess(false);
		}else{
			returnDto = todoService.save(todo);
		}
		return returnDto;
	}
	
	@RequestMapping(value = "json/{page}",method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public GridPageDto<Todo> cmsJson(@PathVariable Integer page,Model model){
		PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
//		SearchFilter typeSearchFilter = new SearchFilter("type",SearchFilter.Operator.EQ,CommentType.CMS);
//		filters.add(typeSearchFilter);
		Page<Todo> result = todoService.findPage(filters, pageable);
		
		return new GridPageDto<Todo>(result);
	}
	
	
    
}


