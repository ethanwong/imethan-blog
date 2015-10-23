package cn.imethan.web.common;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * UploadController.java
 *
 * @author Ethan Wong
 * @time 2014年12月22日下午10:16:38
 */
@Controller
@RequestMapping("/upload")
public class UploadController {
	
	@ResponseBody
	@RequestMapping("/img")
	public String img(@RequestParam MultipartFile file, Model model,HttpServletRequest request) throws IOException{
		System.out.println("--------UploadController----------:"+file.getOriginalFilename());
		
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
        }  
		
		return "success";
	}
}


