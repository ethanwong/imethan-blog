package com.the3.web.console.security;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * UserController.java
 *
 * @author Ethan Wong
 * @time 2014年11月12日下午10:19:42
 */
@Controller
@RequestMapping("/console/security/user")
public class UserController {
	
	
	@RequestMapping(value= "" , method = RequestMethod.GET)
	public String user(){
		return "console/security/user";
	}
}


