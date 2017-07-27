/** 
 * @Title: FamilyDaoImpl.java 
 * @Package com.dzu.dao.impl 
 * @Description: TODO(用一句话描述该文件做什么)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午9:28:56 
 * @version V1.0 
 */
package com.dzu.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.FamilyDao;
import com.dzu.model.Family;

/**
 * @ClassName: FamilyDaoImpl 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午9:28:56
 *
 */
@Repository
public class FamilyDaoImpl  extends BaseDaoImpl<Family> implements FamilyDao{

	/**
	 * Title: deleteOldMessage
	 * Description:TODO(用一句话描述该文件做什么)
	 * @param pid
	 * @param year
	 * @see com.dzu.dao.FamilyDao#deleteOldMessage(int, java.lang.String)
	 */
	@Override
	public void deleteOldMessage(int pid, String year) {
		Session session =getSession();
		Query query = session
				.createQuery("delete from Family where person_id=? and year=?");
		query.setInteger(0, pid);
		query.setString(1, year);
		query.executeUpdate();
		
	}

}

