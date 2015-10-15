package com.the3.web.mobile;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.site.SitePreference;
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
    public String mobile(SitePreference sitePreference,Device device,Model model,HttpServletRequest request) {
		
		if (sitePreference == SitePreference.NORMAL) {
			System.out.println("Site preference is normal");
//            return "home";
        } else if (sitePreference == SitePreference.MOBILE) {
        	System.out.println("Site preference is mobile");
//            return "home-mobile";
        } else if (sitePreference == SitePreference.TABLET) {
        	System.out.println("Site preference is tablet");
//            return "home-tablet";
        } else {
        	System.out.println("no site preference");
//            return "home";
        }
		
		
		String message = "";
        if (device.isMobile()) {
        	System.out.println(message = "Hello mobile user!");
        } else if (device.isTablet()) {
        	System.out.println(message = "Hello tablet user!");
        } else {
        	System.out.println(message = "Hello desktop user!");
        }
        model.addAttribute("message", message);
        return "mobile/index";
    }
}
