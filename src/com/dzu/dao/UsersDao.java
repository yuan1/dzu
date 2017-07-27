package com.dzu.dao;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Users;

/** 
 * @Title: UsersDao.java 
 * @Package com.dzu.dao 
 * @Description: 用户数据库操作接口
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:00:58 
 * @version V1.0 
 */
public interface UsersDao extends BaseDao<Users>{

	void delUser(int id);
}

