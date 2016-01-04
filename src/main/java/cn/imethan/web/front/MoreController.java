package cn.imethan.web.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.imethan.common.web.SuperController;

/**
 * MoreController.java
 *
 * @author Ethan Wong
 * @time 2014年12月16日下午10:58:03
 */
@Controller
@RequestMapping("/more")
public class MoreController extends SuperController{
	
    @RequestMapping("")
    public String more(Model model) {

        return "front/more";
    }
    
}


