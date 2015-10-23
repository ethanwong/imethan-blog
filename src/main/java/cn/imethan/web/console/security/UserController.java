package cn.imethan.web.console.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.common.web.SuperController;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.dto.page.JqGridPageDto;
import cn.imethan.entity.security.User;
import cn.imethan.service.security.UserService;
import cn.imethan.utils.JsonUtils;

/**
 * UserController.java
 *
 * @author Ethan Wong
 * @time 2014年11月12日下午10:19:42
 */
@Controller
@RequestMapping("/console/security/user")
public class UserController extends SuperController {
	
	@Autowired
	private UserService userService;
	
//	@RequiresPermissions //要求subject中必须同时含有file:read和write:aFile.txt的权限才能执行方法someMethod()。否则抛出异常AuthorizationException。
//	@RequiresRoles //如果subject中有aRoleName角色才可以访问方法someMethod。如果没有这个权限则会抛出异常AuthorizationException。
//	@RequiresUser
//	验证用户是否被记忆，user有两种含义：
//	一种是成功登录的（subject.isAuthenticated() 结果为true）；
//	另外一种是被记忆的（subject.isRemembered()结果为true）。
	@RequiresAuthentication//可以用户类/属性/方法，用于表明当前用户需是经过认证的用户。 
	//@RequiresGuest //表明该用户需为”guest”用户 
	@RequiresPermissions("user:list") //当前用户需拥有指定权限 
	@RequestMapping(value= "" , method = RequestMethod.GET)
	public String user(){
		return "console/security/user";
	}
	
	@ResponseBody
	@RequestMapping(value = "json" , method = {RequestMethod.POST , RequestMethod.GET })
	public String json(@RequestParam("page") Integer page,@RequestParam("rows") Integer size){
		PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		Page<User> result = userService.findPage(filters, pageable);
		return  JsonUtils.writeValueAsString(new JqGridPageDto<User>(result));
	}
	
	@ResponseBody
	@RequestMapping(value = "detail/{id}" , method = {RequestMethod.POST})
	public User detail(@PathVariable Long id){
		return userService.getById(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public ReturnDto save(@ModelAttribute("user") User user){
		return userService.save(user);
	} 
	
	@ResponseBody
	@RequestMapping(value="/delete/{id}",method = RequestMethod.POST)
	public ReturnDto delete(@PathVariable Long id){
		return userService.deleteById(id);
	}
	
}


