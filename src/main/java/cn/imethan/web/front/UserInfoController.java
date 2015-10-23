package cn.imethan.web.front;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.imethan.dto.userinfo.UserInfo;
import cn.imethan.entity.security.User;
import cn.imethan.service.security.UserService;

/**
 * UserInfoController.java
 *
 * @author Ethan Wong
 * @time 2014年12月18日下午10:31:35
 */
@Controller
@RequestMapping("/userinfo")
public class UserInfoController {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping(value="/getUserInfoByUsername/{username}",method = RequestMethod.POST)
	public UserInfo getUserInfoByUsername(@PathVariable String username){
		UserInfo userInfo = new UserInfo();
    	//获取用户信息
		if(!StringUtils.isEmpty(username)){
			User curUser = userService.getByUsername(username);
			userInfo = new UserInfo(curUser.getUsername(),curUser.getNickname(),curUser.getEmail(),curUser.getPhone(),curUser.getLocate(),curUser.getAvatar(),curUser.getQq());
		}
		return userInfo;
	}
}
