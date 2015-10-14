package com.the3.web.front;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.base.web.SuperController;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.message.Message;
import com.the3.service.message.MessageService;

/**
 * ContactController.java
 *
 * @author Ethan Wong
 * @time 2014年12月16日下午10:57:57
 */
@Controller
@RequestMapping("/contact")
public class ContactController extends SuperController{
	
	@Autowired
	private MessageService messageService;
	
    @RequestMapping("")
    public String contact(Model model) {
        return "front/contact";
    }
    
	@ResponseBody
	@RequestMapping(value = "save" , method = RequestMethod.POST)
    public ReturnDto save(@Valid @ModelAttribute("message") Message message, BindingResult result,ServletRequest request){
		ReturnDto returnDto = new ReturnDto();
		if(result.hasFieldErrors()){
			returnDto.setMessage("参数验证出现异常:"+result.getFieldError().getDefaultMessage());
			returnDto.setSuccess(false);
		}else{
			returnDto = messageService.save(message);
		}
		return returnDto;
	}

}


