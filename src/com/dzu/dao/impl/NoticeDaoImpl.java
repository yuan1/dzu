package com.dzu.dao.impl;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.NoticeDao;
import com.dzu.model.Notice;

/**
 * @ClassName: NoticeDaoImpl 
 * @Description: 通知公告数据库操作实现类
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:05:45
 *
 */
@Repository
public class NoticeDaoImpl extends BaseDaoImpl<Notice> implements NoticeDao {

	@Override
	public void updateNotice(Notice notice) {
		Session session = getSession();
		SQLQuery query = session
				.createSQLQuery("update notice set title=?,content=? where id=?");
		query.setString(0, notice.getTitle());
		query.setString(1, notice.getContent());
		query.setInteger(2, notice.getId());
		query.executeUpdate();
	}

}
