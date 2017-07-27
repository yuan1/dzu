package com.dzu.util;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dzu.service.CommonServ;
import com.dzu.service.LoginServ;
import com.dzu.service.NoticeServ;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/** 
 * @Title: SetValue.java 
 * @Package com.dzu.util 
 * @Description: 
 * 	此类已经继承ActionSupport。
 * 	所有的Action层继承此类。
 * 	菜单归属。当前页数已经处理。
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:55:00 
 * @version V1.0 
 */
public class BaseAction  extends ActionSupport{
	
	public static String AddSuccess="添加成功";
	
	public static String AddError="{\"statusCode\":\"300\",\"message\":\"添加失败！\"}";
	
	public static String UpdateSuccess="修改成功";
	
	public static String UpdateError="{\"statusCode\":\"300\",\"message\":\"修改失败！\"}";
	
	public static String DeleteSuccess="{\"statusCode\":\"200\",\"message\":\"删除成功！\"}";
	
	public static String DeleteError="{\"statusCode\":\"300\",\"message\":\"删除失败！\"}";
	
	public static String getMsg(String str,String url){
		return "{\"statusCode\":\"200\",\"message\":\""+str+"\",\"navTabId\":\"1\",\"rel\":\"\",\"callbackType\":\"forward\",\"forwardUrl\":\""+url+"\"}";
	}
	
	public static String getMsgError(String str){
		return "{\"statusCode\":\"300\",\"message\":\""+str+"\"}";
	}
	
	
	
	private static final long serialVersionUID = 7382777855648284237L;
	private static HttpServletRequest request=ServletActionContext.getRequest();
	
	@Resource
	public LoginServ loginServ;
	@Resource
	public CommonServ commonServ;
	@Resource
	public NoticeServ noticeServ;
	
	/**
	 * 跳转url
	 * @param url
	 */
	public static void SetUrl(String url){
		ActionContext.getContext().put("geturl",url);
	}
	
	/**
	 * 赋值
	 * @param name
	 * @param obj
	 */
	public static void setAttr(String name,Object obj){
		ActionContext.getContext().put(name,obj);
	}
	
	/**
	 * 多个赋值
	 * @Title: setAttr 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param name
	 * @param @param obj 参数说明
	 * @return void 返回类型
	 * @throws
	 */
	public static void setAttr(String[] name,Object[] obj){
		for(int i=0;i<name.length;i++){
			ActionContext.getContext().put(name[i],obj[i]);
		}
	}
	
	/**
	 * session赋值
	 * @param name
	 * @param obj
	 */
	public static void setSessionAttr(String name,Object obj){
		ActionContext.getContext().getSession().put(name,obj);
	}
	
	/**
	 * 页面输出文字
	 * @param text
	 */
	public static void setText(ServletResponse response,String text){
		try {
			response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(text);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 分页助手
	 * @Title: pagehelper 
	 * @Description: TODO 分页函数。传入三个值
	 * @param @param num   总数
	 * @param @param name  名字
	 * @param @param Obj List
	 * @return void 返回类型   无
	 * @throws
	 */
	public static void pagehelper(int num,String name,Object Obj){
		setAttr("counts",num);
		setAttr(name,Obj);
	}
	
	public static String getPara(String name){
		return request.getParameter(name);
	}
	
	public int pageNum = 1;// 当前页数
	public int numPerPage=30; //每页条数  默认是30
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
}

