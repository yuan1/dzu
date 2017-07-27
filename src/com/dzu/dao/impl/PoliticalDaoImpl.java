/** 
 * @Title: PoliticalDaoImpl.java 
 * @Package com.dzu.dao.impl 
 * @Description: TODO(用一句话描述该文件做什么)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午12:27:19 
 * @version V1.0 
 */
package com.dzu.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.PoliticalDao;
import com.dzu.model.Political;

/**
 * @ClassName: PoliticalDaoImpl 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午12:27:19
 *
 */
@Repository
public class PoliticalDaoImpl extends BaseDaoImpl< Political> implements PoliticalDao {

	/**
	 * Title: deleteOldMessage
	 * Description:TODO(用一句话描述该文件做什么)
	 * @param pid
	 * @param year
	 * @see com.dzu.dao.PoliticalDao#deleteOldMessage(int, java.lang.String)
	 */
	@Override
	public void deleteOldMessage(int pid, String year) {
		Session session =getSession();
		Query query = session
				.createQuery("delete from Political where person_id=? and year=?");
		query.setInteger(0, pid);
		query.setString(1, year);
		query.executeUpdate();
	}

	@Override
	public Integer[] getPoliticalIds(String year, int zzjb, int apzw, int apjb) {
		String hql="SELECT DISTINCT(person.id) FROM Political where year=? ";
		if(zzjb!=0){
			hql+=" and zzjb="+zzjb;
		}
		if(apzw!=0){
			hql+=" and apjb="+apzw;
		}
		if(apjb!=0){
			hql+=" and apjb="+apjb;
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

