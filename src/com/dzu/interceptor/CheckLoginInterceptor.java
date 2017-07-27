package com.dzu.interceptor;

import java.util.Map;

import javax.annotation.Resource;

import com.dzu.dao.UsersDao;
import com.dzu.model.Menus;
import com.dzu.util.BasicUtil;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/** 
 * @Title: CheckLoginInterceptor.java 
 * @Package com.dzu.interceptor 
 * @Description: 系统拦截器
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:44:08 
 * @version V1.0 
 */
public class CheckLoginInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 3366375191291074925L;
	public static final String LOGIN_KEY = "LOGIN";
	public static final String LOGIN_PAGE = "global.quit";
	@Resource
	private UsersDao usersDao;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		String url = actionInvocation.getInvocationContext().getName();
		Map<?, ?> session = actionInvocation.getInvocationContext().getSession();
		String allow = "Login_submit,error,Notice_noticeList,Sym_checkIdCard,Sym_checkUserName,Login_quit,Person_searchList,Person_uploadImage";
		if (allow.contains(url)) {
			if (url.equals("Notice_noticeList")) {
				if (session.isEmpty()) {
					return "quit";
				}
			}
			return actionInvocation.invoke();
		} else {
			if (session.isEmpty()) {
				return "quit";
			} else {
				int user_id = BasicUtil.getUsers().getId();
				boolean flag = false;
				for (Menus menus : usersDao.getById(user_id).getRole().getMenus()) {
					if (menus.getUrl() != null) {
						if (menus.getUrl().contains(url)) {
							flag = true;
							break;
						}
					}
				}
				if (flag) {
					return actionInvocation.invoke();
				} else {
					return "error";
				}
			}
		}

	}

}

