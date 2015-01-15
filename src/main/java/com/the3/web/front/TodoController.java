package com.the3.web.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.the3.base.web.SuperController;
import com.the3.entity.cms.Article;
import com.the3.service.cms.ArticleService;
import com.the3.service.todo.TodoService;

/**
 * TodoController.java
 *
 * @author Ethan Wong
 * @time 2014年12月16日下午10:58:03
 */
@Controller
@RequestMapping("/todo")
public class TodoController extends SuperController{
	
	@Autowired
	private TodoService todoService;
	
    @RequestMapping("")
    public String todo(Model model) {
    	
        return "front/todo";
    }
    
}


