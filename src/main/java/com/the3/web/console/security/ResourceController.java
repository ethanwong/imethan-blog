package com.the3.web.console.security;

import java.util.List;

import javax.servlet.ServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.the3.dto.service.ServiceReturnDto;
import com.the3.dto.web.WebReturnDto;
import com.the3.entity.security.Resource;
import com.the3.service.security.ResourceService;
import com.the3.utils.JsonUtils;

/**
 * ResourceController.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午10:12:07
 */
@Controller
@RequestMapping("/console/security/resource")
public class ResourceController{
	
	@Autowired
	private ResourceService resourceService;
	
	@RequestMapping(value="", method = {RequestMethod.GET,RequestMethod.POST})
	public String resource(Model model, ServletRequest request) {
		return "console/security/resource";
	}
	
	@ResponseBody
	@RequestMapping(value="json",method = {RequestMethod.GET,RequestMethod.POST})
	public String json(){
		List<Resource> resource = resourceService.getRootResource();
		return JsonUtils.writeValueAsString(resource);
	}
	
	@ResponseBody
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public WebReturnDto save(@ModelAttribute("resource") Resource resource, BindingResult result,ServletRequest request) {
		
		//设置父级节点
		if(StringUtils.isNotBlank(request.getParameter("parentId"))){
			String parentId = request.getParameter("parentId");
			resource.setParent(new Resource(Long.valueOf(parentId.trim())));
		}
		
		boolean isSuccess = true;
		String message = "添加成功。";
		if(result.hasErrors()){
			isSuccess = false;
			message = "添加失败";
		}else{
			isSuccess = resourceService.saveOrModify(resource).isSuccess();
		}
		
		return new WebReturnDto(isSuccess,message);
	}

	@ResponseBody
	@RequestMapping(value="/delete/{id}", method = {RequestMethod.POST})
	public WebReturnDto delete(Model model,@PathVariable Long id,ServletRequest request) {
		ServiceReturnDto<Resource> result = resourceService.deleteById(id);
		return new WebReturnDto(result.isSuccess(),result.getMessage());
	}
}