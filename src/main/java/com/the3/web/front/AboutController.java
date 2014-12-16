package com.the3.web.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.the3.base.web.SuperController;

/**
 * AboutController.java
 *
 * @author Ethan Wong
 * @time 2014年12月16日下午10:58:03
 */
@Controller
@RequestMapping("/about")
public class AboutController extends SuperController{
	
	
    @RequestMapping("")
    public String about(Model model) {
        return "front/about";
    }
    
}


