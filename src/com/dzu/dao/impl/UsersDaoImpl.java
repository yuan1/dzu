package com.dzu.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.UsersDao;
import com.dzu.model.Users;

/**
 * @ClassName: UsersDaoImpl 
 * @Description: 用户数据库操作实现类
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:07:24
 *
 */
@Repository
public class UsersDaoImpl extends BaseDaoImpl<Users> implements UsersDao {

	@Override
	public void delUser(int id) {
		Session session = getSession();
		Query query = session
				.createQuery("update Users as users set del=0 where id=?");
		query.setInteger(0, id);
		query.executeUpdate();
	}
}
