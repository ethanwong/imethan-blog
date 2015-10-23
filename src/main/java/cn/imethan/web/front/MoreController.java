package cn.imethan.web.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.imethan.common.web.SuperController;
import cn.imethan.entity.cms.Article;
import cn.imethan.service.cms.ArticleService;

/**
 * MoreController.java
 *
 * @author Ethan Wong
 * @time 2014年12月16日下午10:58:03
 */
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


