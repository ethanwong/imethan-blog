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
import org.springframework.util.StringUtils;
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
import com.the3.utils.DateUtils;

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
	private int size = 20;//默认页大小
	
	@Autowired
	private TodoService todoService;
	
    @RequestMapping("")
    public String todo(Model model) {
    	
        return "front/todo";
    }
    
	@ResponseBody
	@RequestMapping(value = "save" , method = {RequestMethod.POST,RequestMethod.GET})
    public ReturnDto save(@Valid @ModelAttribute("Todo") Todo todo, BindingResult result,ServletRequest request){
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
	public GridPageDto<Todo> json(@PathVariable Integer page,Model model,ServletRequest request){
		PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
		String finish = request.getParameter("finish");
		
		if(!StringUtils.isEmpty(beginTime) && !StringUtils.isEmpty(endTime)){
			SearchFilter beginTimeSearchFilter = new SearchFilter("createTime",SearchFilter.Operator.GTE,DateUtils.StringToDate(beginTime, DateUtils.DATE_PATTERN_09));
			filters.add(beginTimeSearchFilter);
			SearchFilter endTimeSearchFilter = new SearchFilter("createTime",SearchFilter.Operator.LTE,DateUtils.StringToDate(endTime, DateUtils.DATE_PATTERN_09));
			filters.add(endTimeSearchFilter);
		}
		
		if(!StringUtils.isEmpty(finish)){
			if(finish.trim().equals("Finish")){
				SearchFilter searchFilter = new SearchFilter("finish",SearchFilter.Operator.EQ,true);
				filters.add(searchFilter);
			}
			if(finish.trim().equals("Unfinished")){
				SearchFilter searchFilter = new SearchFilter("finish",SearchFilter.Operator.EQ,false);
				filters.add(searchFilter);
			}
		}

		Page<Todo> result = todoService.findPage(filters, pageable);
		
		return new GridPageDto<Todo>(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "finish/{id}/{finish}" , method = {RequestMethod.POST,RequestMethod.GET})
	public ReturnDto finish(@PathVariable long id,@PathVariable boolean finish){
		ReturnDto returnDto = new ReturnDto();
		
		returnDto = todoService.finish(id,finish);
		
		return returnDto;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "delete/{id}" , method = {RequestMethod.POST,RequestMethod.GET})
	public ReturnDto finish(@PathVariable long id){
		ReturnDto returnDto = new ReturnDto();
		
		returnDto = todoService.delete(id);
		
		return returnDto;
		
	}
	
	
    
}


