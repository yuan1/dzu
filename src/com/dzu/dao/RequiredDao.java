package com.dzu.dao;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Required;

public interface RequiredDao extends BaseDao<Required>{

	void ClearReauire();
	
	void SetRequired(Integer[] rids);
}
