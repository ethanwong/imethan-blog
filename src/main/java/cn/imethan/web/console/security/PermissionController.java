package cn.imethan.web.console.security;


import java.util.List;

import javax.servlet.ServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.security.Permission;
import cn.imethan.entity.security.Resource;
import cn.imethan.service.security.PermissionService;
import cn.imethan.service.security.ResourceService;
import cn.imethan.utils.JsonUtils;


/**
 * PermissionController.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午8:50:31
 */
@Controller
@RequestMapping("/console/security/permission")
public class PermissionController{
	
	@Autowired
	private PermissionService permissionService;
	@Autowired
	private ResourceService resourceService;
	
	@ResponseBody
	@RequestMapping(value = "json/{resourceId}" , method = {RequestMethod.GET,RequestMethod.POST})
	public String json(ServletRequest rquest,@PathVariable Long resourceId){
		List<Permission> list = permissionService.getByResourceId(resourceId);
		return JsonUtils.writeValueAsString(list);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "detail/{id}" , method = {RequestMethod.GET,RequestMethod.POST})
	public Permission detail(@PathVariable Long id){
		
		return permissionService.getById(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public ReturnDto save(@ModelAttribute("permission") Permission permission, BindingResult result,ServletRequest request) {
		
		String resourceId = request.getParameter("resourceId");
		
		if(StringUtils.isNoneBlank(resourceId)){
			Resource resource = resourceService.getById(Long.valueOf(resourceId));
			permission.setResources(resource);
		}
		
		boolean isSuccess = true;
		String message = "添加成功。";
		if(result.hasErrors()){
			isSuccess = false;
			message = "添加失败";
		}else{
			ReturnDto returnDto = permissionService.saveOrModify(permission);
			isSuccess = returnDto.isSuccess();
			message = returnDto.getMessage();
		}
		
		return new ReturnDto(isSuccess,message);
	}
	
	@ResponseBody
	@RequestMapping(value="/delete/{id}", method = {RequestMethod.POST})
	public ReturnDto delete(Model model,@PathVariable Long id,ServletRequest request) {
		return permissionService.deleteById(id);
	}

}