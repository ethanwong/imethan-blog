package cn.imethan.web.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.common.repository.SearchFilter.Operator;
import cn.imethan.common.web.SuperController;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.dto.page.GridPageDto;
import cn.imethan.entity.message.Message;
import cn.imethan.service.message.MessageService;

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
			returnDto.setMessage("谢谢您的留言，稍后联系您。");
		}
		return returnDto;
	}
	
	
	@RequestMapping(value = "json/{page}",method = {RequestMethod.POST})
	@ResponseBody
	public GridPageDto<Message> json(@PathVariable Integer page,Model model){
		PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		SearchFilter searchFilter = new SearchFilter("isShow",Operator.EQ,"1");
		filters.add(searchFilter);
		Page<Message> result = messageService.findPage(filters, pageable);
		
		return new GridPageDto<Message>(result);
	}
	
	@RequestMapping(value = "hidden/{id}",method = {RequestMethod.POST})
	@ResponseBody
	public ReturnDto hidden(@PathVariable Long id,Model model){
		return messageService.hidden(id);
	}
	
	@RequestMapping(value = "delete/{id}",method = {RequestMethod.POST})
	@ResponseBody
	public ReturnDto delete(@PathVariable Long id,Model model){
		return messageService.deleteById(id);
	}

}


