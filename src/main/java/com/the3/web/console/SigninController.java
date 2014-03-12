package com.the3.web.console;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.the3.entity.cms.Channel;
import com.the3.service.ChannelService;

/**
 * LoginController.java
 *
 * @author ETHAN
 * @time 2014年3月2日下午10:32:13
 */
@Controller
@RequestMapping("/console")
public class SigninController {
	
    
    @RequestMapping("/signin")
    public String signin(Model model) {
        
        return "console/signin";
    }
}


