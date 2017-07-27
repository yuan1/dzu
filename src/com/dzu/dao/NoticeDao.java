package com.dzu.dao;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Notice;

/** 
 * @Title: NoticeDao.java 
 * @Package com.dzu.util 
 * @Description: 通知公告数据库操作接口
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:58:39 
 * @version V1.0 
 */
public interface NoticeDao extends BaseDao<Notice>{
	void updateNotice(Notice notice);
}

