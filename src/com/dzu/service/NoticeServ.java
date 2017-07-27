package com.dzu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dzu.dao.NoticeDao;
import com.dzu.model.Notice;
import com.dzu.util.BasicUtil;

/** 
 * @Title: NoticeServ.java 
 * @Package com.dzu.service 
 * @Description: 公告业务操作
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:11:09 
 * @version V1.0 
 */
@Service
public class NoticeServ {
	@Resource
	private NoticeDao noticeDao;

	/**
	 * 保存公告
	 * 
	 * @param nt
	 * @return
	 */
	public int addNotice(Notice nt) {
		nt.setDate(BasicUtil.getCurrentTime());
		Notice n=noticeDao.save1(nt);
		System.out.println(n.getId());
		return n.getId();
	}
	/**
	 * 获得公告数目
	 * 
	 * @return
	 */
	public long getNoticeCount() {
		return noticeDao.getCount();
	}

	/**
	 * 公告列表
	 * 
	 * @param pageIndex
	 * @param count
	 * @return
	 */
	public List<Notice> getNoticeList(int pageIndex, int count) {
//		return noticeDao.getAllOnPage(pageIndex, count);
		return noticeDao.getByParmeterOnPage(pageIndex, count, new String[]{}," date desc ");
	}

	/**
	 * 查看公告
	 * 
	 * @param nt_id
	 * @return
	 */
	public Notice noticeSee(int nt_id) {
		return noticeDao.getById(nt_id);
	}

	/**
	 * 删除
	 * 
	 * @param nt_id
	 * @return
	 */
	public String deleteNotice(int nt_id) {
		noticeDao.delete(nt_id);
		return "ok";
	}

	/**
	 * 修改
	 * 
	 * @param notice
	 * @return
	 */
	public String updateNotice(Notice nt) {
		noticeDao.updateNotice(nt);
		return "ok";
	}
}


