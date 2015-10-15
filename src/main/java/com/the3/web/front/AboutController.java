package com.the3.web.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.the3.base.web.SuperController;
import com.the3.entity.cms.Article;
import com.the3.service.cms.ArticleService;

/**
 * AboutController.java
 *
 * @author Ethan Wong
 * @time 2014年12月16日下午10:58:03
 */
@Controller
@RequestMapping("/about")
public class AboutController extends SuperController{
	
	@Autowired
	private ArticleService articleService;
	
    @RequestMapping("")
    public String about(Model model) {
    	Long aboutMeId = 24l;
    	Article aboutMe = articleService.getById(aboutMeId);
    	model.addAttribute("aboutMe", aboutMe);
        return "front/about";
    }
    
    
    
}


