package cn.imethan.web.console.home;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.imethan.service.cms.ChannelService;
import cn.imethan.utils.Debug;


/**
 * MainController.java
 *
 * @author ETHAN
 * @time 2014年3月8日下午2:42:17
 */
@Controller
@RequestMapping("/console/home")
public class HomeController{
	
	@Autowired
	private ChannelService channelService;
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String home(Model model) {
		Debug.println("HomeController list");
		
		 Map<String, Object> channelArticleChartInfo = channelService.getChannelArticleChartInfo();
		 
		 System.out.println("--------channelName:"+channelArticleChartInfo.get("channelName"));
		 System.out.println("--------articleAmount:"+channelArticleChartInfo.get("articleAmount"));
		 model.addAttribute("channelName", channelArticleChartInfo.get("channelName"));
		 model.addAttribute("articleAmount", channelArticleChartInfo.get("articleAmount"));
		
		return "console/home/home";
	}
	
	
	
}
