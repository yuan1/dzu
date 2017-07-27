package com.dzu.dao.impl;

import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.RequiredDao;
import com.dzu.model.Required;

@Repository
public class RequiredDaoImpl extends BaseDaoImpl<Required> implements RequiredDao{

	@Override
	public void ClearReauire() {
		getSession().createQuery("update Required set r=0").executeUpdate();
	}

	@Override
	public void SetRequired(Integer[] rids) {
		try{
		getSession().createQuery("update Required set r=1 where id in (:ids)").setParameterList("ids",rids).executeUpdate();
		}catch(Exception e){e.printStackTrace();}
	}
}
