package com.the3.web.console.security;

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

import com.the3.base.repository.SearchFilter;
import com.the3.base.web.SuperController;
import com.the3.dto.common.ReturnDto;
import com.the3.dto.page.JqGridPageDto;
import com.the3.entity.security.User;
import com.the3.service.security.UserService;
import com.the3.utils.JsonUtils;

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


