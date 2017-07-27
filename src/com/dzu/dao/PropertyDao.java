package com.dzu.dao;

import java.util.List;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Property;

/** 
 * @Title: PropertyDao.java 
 * @Package com.dzu.util 
 * @Description: 属性数据库操作接口
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:59:16 
 * @version V1.0 
 */
public interface PropertyDao extends BaseDao<Property>{

	
	public List<String> getPname();
}

