package com.the3.web.console.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.utils.Debug;


/**
 * MainController.java
 *
 * @author suncco
 * @time 2014年3月8日下午2:42:17
 */
@Controller
@RequestMapping("/console/home")
public class HomeController{
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String home(Model model) {
		Debug.println("HomeController list");
		return "console/home/home";
	}
}
