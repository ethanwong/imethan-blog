package com.the3.web.console.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.entity.security.Role;
import com.the3.service.security.RoleService;
import com.the3.utils.JsonUtils;

/**
 * RoleController.java
 *
 * @author Ethan Wong
 * @time 2014年11月12日下午10:00:54
 */
@Controller
@RequestMapping("/console/security/role")
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value= "" , method = RequestMethod.GET)
	public String role(){
		return "console/security/role";
	}
	
	@ResponseBody
	@RequestMapping(value = "json" , method = {RequestMethod.POST})
	public String json(){
		List<Role> list = roleService.getAllList();
		return JsonUtils.writeValueAsString(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "view/{id}" , method = {RequestMethod.POST,RequestMethod.GET})
	public Role view(@PathVariable Long id){
		return roleService.getById(id);
	}

}


