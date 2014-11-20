package com.the3.web.console.security;

import java.util.List;
import java.util.Set;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.dto.service.ServiceReturnDto;
import com.the3.dto.web.WebReturnDto;
import com.the3.entity.security.Resource;
import com.the3.entity.security.Role;
import com.the3.service.security.ResourceService;
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
	@Autowired
	private ResourceService resourceService;
	
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
	
	@ResponseBody
	@RequestMapping(value = "save" , method = {RequestMethod.POST})
	public WebReturnDto save(@ModelAttribute("role") Role role,@RequestParam String resourcePermission){
		System.out.println("------------role:"+role);
		System.out.println("------------resourcePermission:"+resourcePermission);
		ServiceReturnDto result = roleService.saveOrModify(role,resourcePermission);
		return new WebReturnDto(result.isSuccess(),result.getMessage());
	} 
	
	@ResponseBody
	@RequestMapping(value = "resourcepermission/{roleId}" , method = {RequestMethod.POST})
	public Set<Resource> resourcePermissionForRoleInput(@PathVariable Long roleId){
		return resourceService.getResourcePermissionForRoleInput(roleId);
	}
	
	@ResponseBody
	@RequestMapping(value="/delete/{id}", method = {RequestMethod.POST})
	public WebReturnDto delete(Model model,@PathVariable Long id,ServletRequest request) {
		ServiceReturnDto result = roleService.deleteById(id);
		return new WebReturnDto(result.isSuccess(),result.getMessage());
	}

}


