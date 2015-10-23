package cn.imethan.web.portal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



/**
 * PortalController.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日上午12:16:49
 */

@Controller
@RequestMapping("/portal")
public class PortalController {
	
    @RequestMapping("")
    public String portal(Model model) {
        return "portal/portal";
    }

}


