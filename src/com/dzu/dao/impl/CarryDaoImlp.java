/** 
 * @Title: CarryDaoImlp.java 
 * @Package com.dzu.dao.impl 
 * @Description: TODO(用一句话描述该文件做什么)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午9:20:11 
 * @version V1.0 
 */
package com.dzu.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.CarryDao;
import com.dzu.model.Carry;

/**
 * @ClassName: CarryDaoImlp 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午9:20:11
 *
 */
@Repository
public class CarryDaoImlp extends BaseDaoImpl<Carry> implements CarryDao {

	/**
	 * Title: deleteOldMessage
	 * Description:TODO(用一句话描述该文件做什么)
	 * @param pid
	 * @param year
	 * @see com.dzu.dao.CarryDao#deleteOldMessage(int, java.lang.String)
	 */
	@Override
	public void deleteOldMessage(int pid, String year) {
		Session session =getSession();
		Query query = session
				.createQuery("delete from Carry where person_id=? and year=?");
		query.setInteger(0, pid);
		query.setString(1, year);
		query.executeUpdate();
		
	}

}

