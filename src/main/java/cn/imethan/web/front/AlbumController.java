package cn.imethan.web.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.imethan.common.web.SuperController;


/**
 * AlbumController.java
 *
 * @author Ethan Wong
 * @time 2014年12月24日下午9:40:22
 */
@Controller
@RequestMapping("/album")
public class AlbumController extends SuperController{
	
    @RequestMapping("")
    public String indexOne(Model model) {
    	return "front/album";
    }

}


