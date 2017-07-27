/** 
 * @Title: SituationDao.java 
 * @Package com.dzu.dao 
 * @Description: TODO(用一句话描述该文件做什么)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午12:30:36 
 * @version V1.0 
 */
package com.dzu.dao;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Situation;

/**
 * @ClassName: SituationDao 
 * @Description: 现任民主党派、工商联、爱国宗教团体、知联会、海联会、光彩会等职务情况数据库操作
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午12:30:36
 *
 */
public interface SituationDao extends BaseDao<Situation> {

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

