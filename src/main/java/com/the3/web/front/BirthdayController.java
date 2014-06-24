package com.the3.web.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * BirthdayController.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日上午12:16:49
 */
@Controller
@RequestMapping("/birthday")
public class BirthdayController {
	
    @RequestMapping("")
    public String birthday(Model model) {
        
        return "front/birthday";
    }
}


