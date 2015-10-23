package cn.imethan.web.console;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.imethan.common.encode.EncryptUtils;
import cn.imethan.entity.security.User;
import cn.imethan.utils.ValidateCode;

/**
 * LoginController.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午10:32:13
 */
@Controller
@RequestMapping("/console")
public class SigninController {
	
	@RequestMapping(value = {"","/toSignin"})
	public String toSignin(Model model){
		Subject user = SecurityUtils.getSubject();
		 if(user.isAuthenticated()){
			 return "redirect:console/home";
		 }else{
			 return "console/signin";
		 }
	}
    
    @RequestMapping(value="/signin",method = {RequestMethod.POST,RequestMethod.GET},produces={"application/json;charset=UTF-8"})
    public String signin(Model model,@ModelAttribute("currUser")User currUser,HttpSession session, HttpServletRequest request,RedirectAttributes redirectAttributes) {
		String code = (String) session.getAttribute("validateCode");
		String submitCode = WebUtils.getCleanParam(request, "validateCode");
		if (StringUtils.isEmpty(submitCode)	|| !StringUtils.equals(code, submitCode.toLowerCase())) {
			redirectAttributes.addFlashAttribute("error", "validateCode error");
			return "redirect:toSignin";
		}
    	
    	System.out.println("-------currUser-------currUser:"+currUser);
    	Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(currUser.getUsername(),EncryptUtils.Encrypt(currUser.getPassword(), "SHA-1"));

        if(!StringUtils.isEmpty(request.getParameter("remember"))&&request.getParameter("remember").equals("1")){
        	System.out.println("-------currUser-------setRememberMe:"+request.getParameter("remember"));
        	token.setRememberMe(true);
        }
        
        try {
            user.login(token);
            return "redirect:home";
        }catch (Exception e) {
        	e.printStackTrace();
            token.clear();
            redirectAttributes.addFlashAttribute("error", "username or password error");
            return "redirect:toSignin";
        }
    }
    
    /**
     * 生成验证码
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "/validateCode")
    public void validateCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setHeader("Cache-Control", "no-cache");
        String verifyCode = ValidateCode.generateTextCode(ValidateCode.TYPE_NUM_ONLY, 4, null);
        request.getSession().setAttribute("validateCode", verifyCode);
        response.setContentType("image/jpeg");
        BufferedImage bim = ValidateCode.generateImageCode(verifyCode, 80, 30, 3, true, Color.WHITE, Color.BLACK, null);
        ImageIO.write(bim, "JPEG", response.getOutputStream());
    }
    
    
    @RequestMapping(value = "/signout",method=RequestMethod.GET)
    public String signout(){
    	Subject user = SecurityUtils.getSubject();
    	user.logout();
    	return "redirect:toSignin";
    }
    
}


