package com.the3.web.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.the3.base.web.SuperController;



/**
 * ContactController.java
 *
 * @author Ethan Wong
 * @time 2014年12月16日下午10:57:57
 */
@Controller
@RequestMapping("/contact")
public class ContactController extends SuperController{
	
	
    @RequestMapping("")
    public String contact(Model model) {
        return "front/contact";
    }
    

}


