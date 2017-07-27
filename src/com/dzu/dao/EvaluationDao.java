/** 
 * @Title: EvaluationDao.java 
 * @Package com.dzu.dao 
 * @Description: TODO(用一句话描述该文件做什么)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午9:25:19 
 * @version V1.0 
 */
package com.dzu.dao;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Evaluation;

/**
 * @ClassName: EvaluationDao 
 * @Description: T综合评价情况数据库操作
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午9:25:19
 *
 */
public interface EvaluationDao extends BaseDao<Evaluation> {

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

