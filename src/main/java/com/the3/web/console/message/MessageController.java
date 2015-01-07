package com.the3.web.console.message;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.repository.SearchFilter;
import com.the3.base.web.SuperController;
import com.the3.dto.page.GridPageDto;
import com.the3.entity.message.Message;
import com.the3.service.message.MessageService;


/**
 * MessageController.java
 *
 * @author ETHAN
 * @time 2014年3月8日下午2:42:17
 */
@Controller
@RequestMapping("/console/message")
public class MessageController extends SuperController{
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String message(Model model) {
		
//		messageService.
		return "console/message/message";
	}
	
	@RequestMapping(value = "/{page}",method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public GridPageDto<Message> json(@PathVariable Integer page,Model model){
		PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		
		Page<Message> result = messageService.findPage(filters, pageable);
		
		return new GridPageDto<Message>(result);
	}
	
	
	
}
