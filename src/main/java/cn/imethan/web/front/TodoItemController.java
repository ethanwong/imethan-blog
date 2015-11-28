package cn.imethan.web.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.todo.TodoItem;
import cn.imethan.service.todo.TodoItemService;


@Controller
@RequestMapping("/todoitem")
public class TodoItemController{
	
	private int page = 0;//默认页位置
	private int size = 12;//默认页大小
	
	@Autowired
	private TodoItemService todoItemService;
	
	/**
	 * 进到首页
	 * @param model
	 * @return
	 */
    @RequestMapping("")
	public String todoitem(Model model){
		return "/front/todo/todo-item";
	}
    
    /**
     * 添加
     * @param model
     * @return
     */
    @RequiresUser//当前用户需为已认证用户或已记住用户 
    @RequestMapping("/input")
    public String input(Model model){
    	return "/front/todo/todo-item-input";
    }
    
//    todoitem/publish
    @RequiresUser//当前用户需为已认证用户或已记住用户 
    @ResponseBody
    @RequestMapping(value = "publish/{id}" , method = {RequestMethod.POST})
    public ReturnDto publish(@PathVariable Long id){
    	return todoItemService.updatePublish(id);
    }
	
	/**
	 * 保存
	 * @param todoItem
	 * @param result
	 * @param request
	 * @return
	 */
    @RequiresUser//当前用户需为已认证用户或已记住用户 
	@ResponseBody
	@RequestMapping(value = "save" , method = {RequestMethod.POST})
    public ReturnDto save(@Valid @ModelAttribute("TodoItem") TodoItem todoItem, BindingResult result,ServletRequest request){
		ReturnDto returnDto = new ReturnDto();
		if(result.hasFieldErrors()){
			returnDto.setMessage("参数验证出现异常:"+result.getFieldError().getDefaultMessage());
			returnDto.setSuccess(false);
		}else{
			System.out.println(request.getParameter("publish"));
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
	@RequiresUser//当前用户需为已认证用户或已记住用户 
	@ResponseBody
	@RequestMapping(value = "delete/{id}" , method = {RequestMethod.POST})
	public ReturnDto delete(@PathVariable long id){
		return todoItemService.delete(id);
		
	}
}