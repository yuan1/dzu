/** 
 * @Title: FamilyDao.java 
 * @Package com.dzu.dao 
 * @Description: TODO(用一句话描述该文件做什么)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午9:28:17 
 * @version V1.0 
 */
package com.dzu.dao;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Family;

/**
 * @ClassName: FamilyDao 
 * @Description: 家庭成员及重要社会关系数据库操作
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午9:28:17
 *
 */
public interface FamilyDao extends BaseDao<Family> {

	/**
	 * @Title: deleteOldMessage 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param pid
	 * @param @param year 参数说明
	 * @return void 返回类型
	 * @throws 
	 */
	void deleteOldMessage(int pid, String year);

}

