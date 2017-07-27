package com.dzu.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dzu.model.Notice;
import com.dzu.service.NoticeServ;
import com.dzu.util.BaseAction;

/** 
 * @Title: NoticeAction.java 
 * @Package com.dzu.action 
 * @Description: 通知公告Action
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:14:14 
 * @version V1.0 
 */
@Controller("notice")
@Scope("prototype")
public class NoticeAction extends BaseAction {
	private static final long serialVersionUID = -362537665759184202L;
	private ServletResponse response = ServletActionContext.getResponse();
	@Resource
	private NoticeServ noticeServ;
	
	private Notice nt;	
	
	private int nt_id;

	/**
	 * addNoticeView
	 * 
	 * @return
	 */
	public String addNotice() {
		SetUrl("/WEB-INF/view/notice/addnotice.jsp");
		return SUCCESS;
	}

	/**
	 * addNoticeDo
	 * 
	 * @throws IOException
	 */
	public void addNoticeDo() throws IOException {
		int x=noticeServ.addNotice(nt);
		if (x>0) {
			setText(response,getMsg(AddSuccess,"Notice_showNotice?nt_id="+x));
		}else{
			setText(response,AddError);
		}
	}

	/**
	 * noticeList
	 * 公告列表
	 * @return
	 */
	public String noticeList() {
		pagehelper((int)noticeServ.getNoticeCount(),"noticeList",noticeServ.getNoticeList(pageNum-1,numPerPage));
		SetUrl("/WEB-INF/view/notice/noticeList.jsp");
		return SUCCESS;
	}

	/**
	 * watchNotice
	 * 
	 * 查看公告
	 * 
	 * @return
	 */
	public String showNotice() {
		setAttr("noticeMessage",noticeServ.noticeSee(nt_id));
		SetUrl("/WEB-INF/view/notice/showNotice.jsp");
		return SUCCESS;
	}

	/**
	 * deleteNotice
	 * 
	 * 删除公告操作
	 * 
	 * @throws IOException
	 */
	public void deleteNotice() throws IOException {
		if ("ok".equals(noticeServ.deleteNotice(nt_id))) {
			setText(response,DeleteSuccess);
		}else{
			setText(response,DeleteError);
		}
	}

	/**
	 * updateNoticeShow
	 * 
	 * 修改公告页面
	 * 
	 * @return
	 */
	public String updateNoticeShow() {
		setAttr("updateNoticeMessage",noticeServ.noticeSee(nt_id));
		SetUrl("/WEB-INF/view/notice/updateNoticeShow.jsp");
		return SUCCESS;
	}

	/**
	 * updateNoticeDo
	 * 
	 * 
	 * 修改公告操作
	 * 
	 * @throws IOException
	 */
	public void updateNoticeDo() throws IOException {
		if ("ok".equals(noticeServ.updateNotice(nt))) {
			setText(response,getMsg(UpdateSuccess,"Notice_showNotice?nt_id="+nt.getId()));
		}else{
			setText(response,UpdateError);
		}
	}

	public Notice getNt() {
		return nt;
	}

	public void setNt(Notice nt) {
		this.nt = nt;
	}

	public int getNt_id() {
		return nt_id;
	}

	public void setNt_id(int nt_id) {
		this.nt_id = nt_id;
	}
}

