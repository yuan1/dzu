package com.dzu.action;

import java.util.Set;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dzu.model.Menus;
import com.dzu.model.Users;
import com.dzu.util.BaseAction;
import com.opensymphony.xwork2.ActionContext;

/** 
 * @Title: LoginAction.java 
 * @Package com.dzu.action 
 * @Description: 登录Action
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:13:05 
 * @version V1.0 
 */
@Controller("login")
@Scope("prototype")
public class LoginAction extends BaseAction{
	private static final long serialVersionUID = -3320297459816934680L;
	private Users users;

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String login() {
		return SUCCESS;
	}

	/**
	 * 登录验证
	 * @return
	 */
	public String submit() {
		Users users2 = loginServ.findUserLoginMess(users);
		if (users2 != null) {
			setSessionAttr("users", users2);
			setSessionAttr("usersid",users2.getId());
			setSessionAttr("topMenusList",commonServ.findTopMenus(users2.getId()));
			Set<Menus> l=users2.getRole().getMenus();
			String str=",";
			for(Menus m:l){
				str+=m.getId()+",";
			}
			setSessionAttr("menusids",str);
			setSessionAttr("dept", users2.getDept());
			setSessionAttr("dept1", users2.getDept().getId());
			setSessionAttr("role", users2.getRole().getId());
			return SUCCESS;
		} else {
			setAttr("info", "用户名或密码错误或账号异常");
			return "quit";
		}
	}

	/**
	 * 退出
	 * 
	 * @return
	 */
	public String quit() {
		ActionContext.getContext().getSession().clear();
		return "quit";
	}
}


