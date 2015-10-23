package cn.imethan.web.front;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.imethan.common.web.SuperController;

/**
 * IndexController.java
 *
 * @author Ethan Wong
 * @time 2014年12月24日下午8:19:36
 */
@Controller
@RequestMapping("/index")
public class IndexController extends SuperController{
	
    @RequestMapping("")
    public String indexOne(Model model,SitePreference sitePreference,Device device) {
    	String message = "";
        if (device.isMobile()) {
        	System.out.println(message = "Hello mobile user!");
        	model.addAttribute("message", message);
        	return "mobile/index";
        } else if (device.isTablet()) {
        	System.out.println("Hello tablet user!");
        	return "front/index";
        } else {
        	System.out.println("Hello desktop user!");
        	return "front/index";
        }
    }

}