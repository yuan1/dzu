package com.dzu.util;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;

/** 
 * @Title: PageHelper.java 
 * @Package com.dzu.util 
 * @Description: 分页插件工具
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:52:35 
 * @version V1.0 
 */
public class PageHelper {
	/**
	 * 分页插件
	 * @param Listname list的名字
	 * @param l    list的值
	 * @param counts   总数目
	 */
	public static void pageHelper(String Listname,List<?> l,int counts){
		ActionContext.getContext().put("counts",counts);
		int x=(int) Math.floor(counts/ 10);
		if(counts%10==0)
			x--;
		ActionContext.getContext().put("allPage",x);
		ActionContext.getContext().put(Listname,l);
	}
}

