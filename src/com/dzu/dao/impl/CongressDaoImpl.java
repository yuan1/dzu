/** 
 * @Title: CongressDaoImpl.java 
 * @Package com.dzu.dao.impl 
 * @Description: TODO(用一句话描述该文件做什么)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午12:23:49 
 * @version V1.0 
 */
package com.dzu.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.CongressDao;
import com.dzu.model.Congress;

/**
 * @ClassName: CongressDaoImpl 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午12:23:49
 *
 */
@Repository
public class CongressDaoImpl extends BaseDaoImpl<Congress> implements CongressDao {

	/**
	 * Title: deleteOldMessage
	 * Description:TODO(用一句话描述该文件做什么)
	 * @param pid
	 * @param year
	 * @see com.dzu.dao.CongressDao#deleteOldMessage(int, java.lang.String)
	 */
	@Override
	public void deleteOldMessage(int pid, String year) {
		Session session =getSession();
		Query query = session
				.createQuery("delete from Congress where person_id=? and year=?");
		query.setInteger(0, pid);
		query.setString(1, year);
		query.executeUpdate();
		
	}

	@Override
	public Integer[] getCongressIds(String year, int zzjb, int apzw) {
		String hql="SELECT DISTINCT(person.id) FROM Congress where year=? ";
		if(zzjb!=0){
			hql+=" and zzjb="+zzjb;
		}
		if(apzw!=0){
			hql+=" and apjb="+apzw;
		}
		Session session =getSession();
		Query query = session
				.createQuery(hql);
		query.setString(0, year);
		List<Integer> l= query.list();
		Integer[] i=new Integer[l.size()];
		for(int x=0;x<i.length;x++){
			i[x]=l.get(x);
		}
		return i;
	}

}

