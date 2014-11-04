package com.the3.web.console.security;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.web.SuperController;
import com.the3.entity.security.Permission;
import com.the3.service.security.PermissionService;
import com.the3.utils.JsonUtils;


/**
 * PermissionController.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午8:50:31
 */
@Controller
@RequestMapping("/console/security/permission")
public class PermissionController extends SuperController {
	
	@Autowired
	private PermissionService permissionService;
	
	@ResponseBody
	@RequestMapping(value = "json" , method = {RequestMethod.GET,RequestMethod.POST})
	public List<Permission> json(ServletRequest rquest,Long resourceId){
//		String  resourceId = rquest.getParameter("resourceId");
//		if(StringUtils.isNotEmpty(resourceId)){
//			System.out.println("resourceId:"+resourceId);
			return permissionService.getByResourceId(resourceId);
//		}
//		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "test/{resourceId}" , method = RequestMethod.GET)
	public List<Permission> test(@PathVariable Long resourceId){
		List<Permission> list = new ArrayList<Permission>();
		try {
			list = permissionService.getByResourceId(resourceId);
			System.out.println("list:"+list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}