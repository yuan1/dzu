/** 
 * @Title: EducationDao.java 
 * @Package com.dzu.dao 
 * @Description: TODO(用一句话描述该文件做什么)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月23日 下午11:48:24 
 * @version V1.0 
 */
package com.dzu.dao;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Education;

/**
 * @ClassName: EducationDao 
 * @Description: 学历信息数据库操作接口
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月23日 下午11:48:24
 *
 */
public interface EducationDao extends BaseDao<Education> {

	/**
	 * @Title: deleteOldMessage 
	 * @Description: 删除原先信息
	 * @param @param pid
	 * @param @param year 参数说明
	 * @return void 返回类型
	 * @throws 
	 */
	void deleteOldMessage(int pid, String year);

}

