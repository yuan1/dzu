/** 
 * @Title: EducationDaoImpl.java 
 * @Package com.dzu.dao.impl 
 * @Description: TODO(用一句话描述该文件做什么)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月23日 下午11:49:36 
 * @version V1.0 
 */
package com.dzu.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.EducationDao;
import com.dzu.model.Education;

/**
 * @ClassName: EducationDaoImpl 
 * @Description: 学历信息数据库操作实现类
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月23日 下午11:49:36
 *
 */
@Repository
public class EducationDaoImpl extends BaseDaoImpl<Education> implements EducationDao {

	/**
	 * Title: deleteOldMessage
	 * Description:删除原先信息
	 * @param pid
	 * @param year
	 * @see com.dzu.dao.EducationDao#deleteOldMessage(int, java.lang.String)
	 */
	@Override
	public void deleteOldMessage(int pid, String year) {
		Session session =getSession();
		Query query = session
				.createQuery("delete from Education where person_id=? and year=?");
		query.setInteger(0, pid);
		query.setString(1, year);
		query.executeUpdate();
	}


}

