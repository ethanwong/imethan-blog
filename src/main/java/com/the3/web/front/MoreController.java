package com.the3.web.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.the3.base.web.SuperController;
import com.the3.entity.cms.Article;
import com.the3.service.cms.ArticleService;


@Controller
@RequestMapping("/more")
public class MoreController extends SuperController{
	
	@Autowired
	private ArticleService articleService;
	
    @RequestMapping("")
    public String more(Model model) {
    	Long learnMoreId = 25l;
    	Article article = articleService.getById(learnMoreId);
    	model.addAttribute("article", article);
        return "front/more";
    }
    
}


