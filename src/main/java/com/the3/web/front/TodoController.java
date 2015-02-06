package com.the3.web.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.dto.page.GridPageDto;
import com.the3.entity.todo.Todo;
import com.the3.service.todo.TodoItemService;
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
	private int size = 12;//默认页大小
	
	@Autowired
	private TodoService todoService;
	@Autowired
	private TodoItemService todoItemService;
	
	
	/**
	 * 进到首页
	 * @param model
	 * @return
	 */
    @RequestMapping("")
    public String todo(Model model) {
		List<SearchFilter> filters = new ArrayList<SearchFilter>();//检索条件列表
		
    	model.addAttribute("todoItems", todoItemService.getAll(filters));
        return "front/todo";
    }
    
    /**
     * 保存
     * @param todo
     * @param result
     * @param request
     * @return
     */
    @RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "save" , method = {RequestMethod.POST})
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
	
    /**
     * 获取列表
     * @param page
     * @param model
     * @param request
     * @return
     */
	@RequestMapping(value = "json/{page}",method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public GridPageDto<Todo> json(@PathVariable Integer page,Model model,ServletRequest request){
		
		//设置排序信息
		List<Order> orders=new ArrayList<Order>();
		orders.add(new Order(Direction.ASC, "finish"));
		orders.add(new Order(Direction.DESC, "orderNo"));
		orders.add(new Order(Direction.DESC, "id"));
		PageRequest pageable = new PageRequest(page-1, size, new Sort(orders));
		
		List<SearchFilter> filters = new ArrayList<SearchFilter>();//检索条件列表
		
		String beginTime = request.getParameter("beginTime");//开始时间
		String endTime = request.getParameter("endTime");//结束时间
		String finish = request.getParameter("finish");//是否完成
		String itemId = request.getParameter("itemId");//todo分类
		
		if(!StringUtils.isEmpty(itemId)){
			SearchFilter itemSearchFilter = new SearchFilter("todoItem.id",SearchFilter.Operator.EQ,itemId);
			filters.add(itemSearchFilter);
		}
		
		//设置开始时间和结束时间参数
		if(!StringUtils.isEmpty(beginTime) && !StringUtils.isEmpty(endTime)){
			SearchFilter beginTimeSearchFilter = new SearchFilter("createTime",SearchFilter.Operator.GTE,DateUtils.StringToDate(beginTime, DateUtils.DATE_PATTERN_09));
			filters.add(beginTimeSearchFilter);
			SearchFilter endTimeSearchFilter = new SearchFilter("createTime",SearchFilter.Operator.LTE,DateUtils.StringToDate(endTime, DateUtils.DATE_PATTERN_09));
			filters.add(endTimeSearchFilter);
		}
		
		//设置是否完成参数
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
		System.out.println("result:"+result);
		return new GridPageDto<Todo>(result);
	}
	
	/**
	 * 更新完成状态
	 * @param id
	 * @param finish
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "finish/{id}/{finish}" , method = {RequestMethod.POST})
	public ReturnDto finish(@PathVariable long id,@PathVariable boolean finish){
		return todoService.finish(id,finish);
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
		return todoService.delete(id);
		
	}
	
	/**
	 * 置顶
	 * @param id
	 * @param nextOrderNo
	 * @param previousOrderNo
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "up" , method = {RequestMethod.POST})
	public ReturnDto up(@RequestParam Long id,@RequestParam int nextOrderNo,@RequestParam int previousOrderNo){
		
		return todoService.upTodo(id,nextOrderNo,previousOrderNo);
		
	}
	
	/**
	 * 置底
	 * @param id
	 * @param nextOrderNo
	 * @param previousOrderNo
	 * @return
	 */
	@RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "down" , method = {RequestMethod.POST})
	public ReturnDto down(@RequestParam Long id,@RequestParam int nextOrderNo,@RequestParam int previousOrderNo){
		
		return todoService.downTodo(id,nextOrderNo,previousOrderNo);
		
	}
	
	
}