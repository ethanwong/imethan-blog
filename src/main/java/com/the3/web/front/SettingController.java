package com.the3.web.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * SettingController.java
 *
 * @author Ethan Wong
 * @time 2014年12月20日下午5:50:25
 */
@Controller
@RequestMapping("/setting")
public class SettingController {
	
	@RequestMapping("")
	public String setting(Model model){
		 return "front/setting";
	}

}


