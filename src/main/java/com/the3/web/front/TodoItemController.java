package com.the3.web.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.the3.entity.todo.TodoItem;
import com.the3.service.todo.TodoItemService;


@Controller
@RequestMapping("/todoitem")
public class TodoItemController{
	
	private int page = 0;//默认页位置
	private int size = 12;//默认页大小
	
	@Autowired
	private TodoItemService todoItemService;
	
	/**
	 * 保存
	 * @param todoItem
	 * @param result
	 * @param request
	 * @return
	 */
    @RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "save" , method = {RequestMethod.POST})
    public ReturnDto save(@Valid @ModelAttribute("Todo") TodoItem todoItem, BindingResult result,ServletRequest request){
		ReturnDto returnDto = new ReturnDto();
		if(result.hasFieldErrors()){
			returnDto.setMessage("参数验证出现异常:"+result.getFieldError().getDefaultMessage());
			returnDto.setSuccess(false);
		}else{
			returnDto = todoItemService.save(todoItem);
		}
		return returnDto;
	}
    
    
    /**
     * 获取列表
     * @param page
     * @param model
     * @param request
     * @return
     */
	@RequestMapping(value = "json",method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public List<TodoItem> json(Model model,ServletRequest request){
		List<SearchFilter> filters = new ArrayList<SearchFilter>();//检索条件列表
		
		return todoItemService.getAll(filters);
	} 
	
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "delete/{id}" , method = {RequestMethod.POST})
	public ReturnDto delete(@PathVariable long id){
		return todoItemService.delete(id);
		
	}
	
	
}