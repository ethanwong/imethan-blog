package com.the3.web.console.setting;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * SettingController.java
 *
 * @author ETHAN
 * @time 2014年3月8日下午2:42:17
 */
@Controller
@RequestMapping("/console/setting")
public class ConsoleSettingController{
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String setting(Model model) {
		String type = "main";
		model.addAttribute("type", type);
		return "console/setting/setting";
	}
	
	@RequestMapping(value="/{type}", method = RequestMethod.GET)
	public String setting(@PathVariable String type,Model model) {
		model.addAttribute("type", type);
		
		return "console/setting/setting";
	}
	
	
	
}
