package com.the3.web.front;

import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * MobileController.java
 *
 * @author Ethan Wong
 * @time 2015年1月5日下午10:31:35
 */
@Controller
@RequestMapping("/mobile")
public class MobileController {
	
	@RequestMapping("")
    public String mobile(Device device,Model model) {
		String message = "";
        if (device.isMobile()) {
        	System.out.println(message = "Hello mobile user!");
        } else if (device.isTablet()) {
        	System.out.println(message = "Hello tablet user!");
        } else {
        	System.out.println(message = "Hello desktop user!");
        }
        model.addAttribute("message", message);
        return "mobile/mobile";
    }
}
