package cn.imethan.web.front;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.system.Menu;
import cn.imethan.service.system.MenuService;

/**
 * MenuController.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年11月28日上午10:13:32
 */
@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	@ResponseBody
	@RequestMapping(value = "json" , method = {RequestMethod.POST})
	public List<Menu> json(){
		return menuService.getAll();
	}
	
	@RequestMapping(value = "input" , method = RequestMethod.GET)
	public String input(){
		return "front/setting/setting-menu-input";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "save" , method = RequestMethod.POST)
    public ReturnDto save(@Valid @ModelAttribute("menu") Menu menu, BindingResult result,ServletRequest request){
		ReturnDto returnDto = new ReturnDto();
		if(result.hasFieldErrors()){
			returnDto.setMessage("参数验证出现异常:"+result.getFieldError().getDefaultMessage());
			returnDto.setSuccess(false);
		}else{
			returnDto = menuService.save(menu);
		}
		return returnDto;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "delete/{id}" , method = RequestMethod.POST)
	public ReturnDto delete(@PathVariable("id") Long id){
		return menuService.deleteById(id);
	}

}
