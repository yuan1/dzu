package com.dzu.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.PropertyDao;
import com.dzu.model.Property;


/**
 * @ClassName: PropertyDaoImpl 
 * @Description: 属性数据库操作实现类
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:06:42
 *
 */
@Repository
public class PropertyDaoImpl extends BaseDaoImpl<Property> implements
		PropertyDao {

	@Override
	public List<String> getPname() {
		Session session = getSession();
		Query query = session
				.createQuery("select DISTINCT(p_name) from Property where type=0");
		return query.list();
	}

}
