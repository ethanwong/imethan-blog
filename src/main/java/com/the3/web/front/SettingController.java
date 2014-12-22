package com.the3.web.front;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.the3.dto.common.ReturnDto;
import com.the3.entity.security.User;
import com.the3.service.security.UserService;

/**
 * SettingController.java
 *
 * @author Ethan Wong
 * @time 2014年12月20日下午5:50:25
 */
@Controller
@RequestMapping("/setting")
public class SettingController {
	
	@Autowired
	private UserService userService;
	
	@RequiresUser
	@RequestMapping("/{type}")
	public String setting(Model model,@PathVariable String type){
		
		model.addAttribute("type", type);
		
		if(!StringUtils.isEmpty(type)){
			Subject subject =SecurityUtils.getSubject();
			if(subject.getPrincipal() != null){
				String username = subject.getPrincipal().toString();
				User user = userService.getByUsername(username);
				model.addAttribute("user", user);
			}
		}
		
		return "front/setting";
	}
	
	
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "updateProfile" , method = {RequestMethod.POST})
	public ReturnDto updateProfile(@Valid @ModelAttribute("user") User user, BindingResult result,ServletRequest request){
		ReturnDto returnDto = new ReturnDto();
		if(result.hasFieldErrors()){
			returnDto.setMessage("参数验证出现异常:"+result.getFieldError().getDefaultMessage());
			returnDto.setSuccess(false);
		}else{
			returnDto = userService.updateProfile(user);
			
		}
		return returnDto;
	}
	
	@ResponseBody
	@RequestMapping("/updateAvatar")
	public String updateAvatar(@RequestParam MultipartFile file, Model model,HttpServletRequest request,@RequestParam Long userId) throws IOException{
		System.out.println("--------UploadController----------:"+file.getOriginalFilename());
		
		System.out.println("--------request.getParameter.userId-----:"+userId);
		
        if(file.isEmpty()){  
            System.out.println("文件未上传");  
        }else{  
            System.out.println("文件长度: " + file.getSize());  
            System.out.println("文件类型: " + file.getContentType());  
            System.out.println("文件名称: " + file.getName());  
            System.out.println("文件原名: " + file.getOriginalFilename());  
            String realPath = request.getSession().getServletContext().getRealPath("/upload/avatar"); 
            String currentTimeMillis = String.valueOf(System.currentTimeMillis());
            String saveFileName = currentTimeMillis+"_"+file.getOriginalFilename();
            System.out.println("------------realPath:"+realPath);
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath,saveFileName));
            
            userService.updateAvatar(userId,saveFileName);
        }  
       
		
		return "success";
	}
	
	

}


