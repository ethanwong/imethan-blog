package cn.imethan.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.imethan.entity.system.Setting;
import cn.imethan.entity.system.SettingCode;
import cn.imethan.service.system.SettingService;


/**
 * WebInitServlet.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2016年1月8日下午2:21:41
 */
public class WebInitServlet extends HttpServlet {
	
	private static final long serialVersionUID = 3235817996326379218L;

	public WebInitServlet() {
		super();
	}
	
	/**
	 * 系统设置数据初始化
	 */
	public void init() throws ServletException {
	    ServletContext sc = getServletContext();
        WebApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
        SettingService settingService = (SettingService) ac.getBean("settingServiceImpl");
        
        Setting sitename = settingService.getByCode(SettingCode.SITENAME.name());
        Setting copyright = settingService.getByCode(SettingCode.COPYRIGHT.name());
        if(sitename != null){
        	ac.getServletContext().setAttribute("SITENAME", sitename.getContent());
        }
        if(copyright != null){
        	ac.getServletContext().setAttribute("COPYRIGHT", copyright.getContent());
        }
        
	}
	
	
	
}