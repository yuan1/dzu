/** 
 * @Title: CongressDao.java 
 * @Package com.dzu.dao 
 * @Description: TODO(用一句话描述该文件做什么)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午12:22:59 
 * @version V1.0 
 */
package com.dzu.dao;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Congress;

/**
 * @ClassName: CongressDao 
 * @Description: 目前在各级人大安排情况数据库操作接口
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午12:22:59
 *
 */
public interface CongressDao extends BaseDao<Congress> {

	/**
	 * @Title: deleteOldMessage 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param pid
	 * @param @param year 参数说明
	 * @return void 返回类型
	 * @throws 
	 */
	void deleteOldMessage(int pid, String year);
	
	Integer[] getCongressIds(String year,int zzjb,int apzw);

}

