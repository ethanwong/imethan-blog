package cn.imethan.web.front;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.imethan.common.repository.SearchFilter;
import cn.imethan.common.web.SuperController;
import cn.imethan.entity.cms.Label;
import cn.imethan.service.cms.ArticleService;
import cn.imethan.service.cms.ChannelService;
import cn.imethan.service.cms.LabelService;

/**
 * IndexController.java
 *
 * @author Ethan Wong
 * @time 2014年12月24日下午8:19:36
 */
@Controller
@RequestMapping("/index")
public class IndexController extends SuperController{
	
	@Autowired
	private LabelService labelService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ChannelService channelService;
	
    @RequestMapping("")
    public String indexOne(Model model,SitePreference sitePreference,Device device) {
    	
    	//获取标签信息
    	List<Label> allLabel = labelService.getList(new ArrayList<SearchFilter>());
    	model.addAttribute("allLabel", allLabel);
    	
    	model.addAttribute("articles", articleService.getIndexArticleCount());
    	model.addAttribute("tags", labelService.getIndexTagCount());
    	model.addAttribute("channels", channelService.getIndexChannelCount());
    	
    	
    	String message = "";
        if (device.isMobile()) {
        	System.out.println(message = "Hello mobile user!");
        	model.addAttribute("message", message);
        	return "mobile/index";
        } else if (device.isTablet()) {
        	System.out.println("Hello tablet user!");
        	return "front/index";
        } else {
        	System.out.println("Hello desktop user!");
        	return "front/index";
        }
    }

}