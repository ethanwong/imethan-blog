package com.the3.web.console.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.repository.SearchFilter;
import com.the3.base.web.SuperController;
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
	
	@RequestMapping(value= "" , method = RequestMethod.GET)
	public String user(){
		return "console/security/user";
	}
	
	@ResponseBody
	@RequestMapping(value = "json" , method = {RequestMethod.POST , RequestMethod.GET })
	public String json(){
		PageRequest pageable = new PageRequest(page, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		Page<User> result = userService.findPage(filters, pageable);
		return  JsonUtils.writeValueAsString(new JqGridPageDto<User>(result));
	}
}


