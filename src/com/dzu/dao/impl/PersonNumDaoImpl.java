package com.dzu.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.PersonNumDao;
import com.dzu.model.PersonNum;

@Repository
public class PersonNumDaoImpl extends BaseDaoImpl<PersonNum> implements PersonNumDao{

	@Override
	public List<String> getYears() {
		Session session = getSession();
		Query query = session
				.createQuery("select DISTINCT(year) from PersonNum");
		return query.list();
	}

	@Override
	public void DeletePersonNum(String year) {
		Session session = getSession();
		Query query = session
				.createQuery("delete from PersonNum where year=?");
		query.setString(0,year);
		query.executeUpdate();
	}

}
