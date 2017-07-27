package com.dzu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dzu.dao.PropertyDao;
import com.dzu.dao.UsersDao;
import com.dzu.model.Users;
import com.dzu.util.BasicUtil;

/** 
 * @Title: LoginServ.java 
 * @Package com.dzu.service 
 * @Description: 登录业务操作
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:09:47 
 * @version V1.0 
 */
@Service
public class LoginServ {
	@Resource
	private UsersDao usersDao;
	@Resource
	private PropertyDao propertyDao;

	/**
	 * 登录验证
	 * 
	 * @param users
	 * @return
	 */
	public Users findUserLoginMess(Users users) {
		List<Users> list = usersDao.getByParmeter(new String[] { "username",
				"password", "del" }, " id asc", users.getUsername().trim(),
				BasicUtil.md5(users.getPassword().trim()), "1");
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	/**
	 * 获得手续费
	 * 
	 * @return
	 */
	public String getCharge() {
		return propertyDao.findAll(new String[] { "type" }, "id", "charge")
				.get(0).getP_name();
	}
}


