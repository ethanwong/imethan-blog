package cn.imethan.web.front.blog;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.common.web.SuperController;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.dto.page.JqGridPageDto;
import cn.imethan.entity.cms.Label;
import cn.imethan.service.cms.LabelService;
import cn.imethan.utils.JsonUtils;

/**
 * LabelController.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年12月16日下午2:39:17
 */
@Controller
@RequestMapping("/blog/label")
public class LabelController extends SuperController{
	
	@Autowired
	private LabelService labelService;
	
	@RequiresAuthentication
	@RequestMapping(value = "" , method = RequestMethod.GET)
	public String label(){
		
		return "/front/blog/label";
	}
	
    @RequiresAuthentication
    @ResponseBody
	@RequestMapping("/json")
    public String json(@RequestParam("page") Integer page,@RequestParam("rows") Integer size){
		PageRequest pageable = new PageRequest(page-1, size, Direction.DESC, "orderNo","id");
		List<SearchFilter> filters = new ArrayList<SearchFilter>();
		Page<Label> result = labelService.findPage(filters, pageable);
		return  JsonUtils.writeValueAsString(new JqGridPageDto<Label>(result));
    }
    
    @RequiresAuthentication//当前用户需为已认证用户或已记住用户 
    @RequestMapping("/input")
    public String input(@RequestParam(required = false,value="id") Long id,Model model){
    	
    	if(id != null && id !=0l){
    		Label entity = labelService.getById(id);
    		model.addAttribute("entity", entity);
    	}
    	
    	return "front/blog/label-input";
    }
	
    @RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "save" , method = RequestMethod.POST)
	public ReturnDto save(@Valid @ModelAttribute("label") Label label, BindingResult result,ServletRequest request){
		ReturnDto returnDto = new ReturnDto();
		if(result.hasFieldErrors()){
			
			returnDto.setMessage("参数验证出现异常:"+result.getFieldError().getDefaultMessage());
			returnDto.setSuccess(false);
		}else{
			returnDto = labelService.saveOrModify(label);
		}
		return returnDto;
	}
	
    @RequiresAuthentication
	@ResponseBody
	@RequestMapping(value = "delete/{id}" , method = RequestMethod.POST)
	public ReturnDto delete(@PathVariable Long id){
		return labelService.deleteById(id);
	}

}