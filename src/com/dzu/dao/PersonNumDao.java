package com.dzu.dao;

import java.util.List;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.PersonNum;

/** 
 * @Title: PersonNumDao.java 
 * @Package com.dzu.dao 
 * @Description: 设置上报人数
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:57:10 
 * @version V1.0 
 */
public interface PersonNumDao extends BaseDao<PersonNum> {
	
	List<String> getYears();
	
	void DeletePersonNum(String year);
}


