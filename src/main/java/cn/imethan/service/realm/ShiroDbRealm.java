package cn.imethan.service.realm;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import cn.imethan.entity.security.Permission;
import cn.imethan.entity.security.Role;
import cn.imethan.entity.security.User;
import cn.imethan.service.security.UserService;

/**
 * ShiroDbRealm.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:06:13
 */
public class ShiroDbRealm extends AuthorizingRealm{

    private UserService userService;

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
    	SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //获取当前登录的用户名
        String username = (String) super.getAvailablePrincipal(principals);
        
        List<String> roles = new ArrayList<String>();  
        List<String> permissions = new ArrayList<String>();
        User user = userService.getByUsername(username);
        if(user != null){
            if (user.getRoles() != null && user.getRoles().size() > 0) {
                for (Role role : user.getRoles()) {
                    roles.add(role.getName());
                    if(role.getPermissions() != null && !role.getPermissions().isEmpty()){
                    	for(Permission permission : role.getPermissions()){
                              if(!StringUtils.isEmpty(permission.getPermission())){
                                  permissions.add(permission.getPermission());
                              }
                    	}
                    }
                }
            }
        }else{
            throw new AuthorizationException();
        }
        System.out.println("roles:"+roles);
        //给当前用户设置角色
        info.addRoles(roles);
        System.out.println("permissions:"+permissions);
        //给当前用户设置权限
        info.addStringPermissions(permissions); 
        return info;
        
    }

    /**
     *  认证回调函数,登录时调用.
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        System.out.println("-----ShiroDbRealm----:token:"+token.getUsername());
        
        User user = userService.getByUsername(token.getUsername());
        if (user != null) {
        	System.out.println("-----ShiroDbRealm----:user:"+user);
            return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), user.getNickname());
        } else {
            return null;
        }
    }

	public void setService(UserService userService) {
		this.userService = userService;
	}
}


