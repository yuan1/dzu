package com.dzu.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.dzu.model.Dept;
import com.dzu.model.Users;
import com.opensymphony.xwork2.ActionContext;

/** 
 * @Title: BasicUtil.java 
 * @Package com.dzu.util 
 * @Description: 基础工具
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:47:26 
 * @version V1.0 
 */
public class BasicUtil {

	/**
	 * 获得经过MD5加密的密码
	 * 
	 * @param str
	 * @return
	 */
	public static String md5(String str) {
		StringBuffer sb = new StringBuffer(32);
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] array = md.digest(str.getBytes("UTF-8"));
			for (int i = 0; i < array.length; i++) {
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100)
						.toUpperCase().substring(1, 3));
			}
		} catch (Exception e) {
			return null;
		}
		return sb.toString();
	}

	/**
	 * 获得格式化的时间
	 * 
	 * @return
	 */
	public static String getCurrentTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(new Date());
	}

	/**
	 * 获得格式化的日期
	 * 
	 * @return
	 */
	public static String getCurrentTimeOfDay() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(new Date());
	}
	
	/**
	 * 根据时间判断季度
	 * @param str
	 * @return
	 */
	public static String getQuarery(String str){
		String[] str1=str.split("-");
		String mon=str1[1];
		String x="";
		if(mon.equals("01")||mon.equals("02")||mon.equals("03"))
			x= "1";
		if(mon.equals("04")||mon.equals("05")||mon.equals("06"))
			x= "2";
		if(mon.equals("07")||mon.equals("08")||mon.equals("09"))
			x= "3";
		if(mon.equals("10")||mon.equals("11")||mon.equals("12"))
			x= "4";
		return x;
	}
	
	/**
	 * 获得格式化的月份
	 * 
	 * @return
	 */
	public static String getCurrentTimeOfMonth() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
		return df.format(new Date());
	}

	/**
	 * 获得年份
	 * 
	 * @return
	 */
	public static String getCurrentYear() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		return df.format(new Date());
	}

	/**
	 * 获得session中user
	 * 
	 * @return
	 */
	public static Users getUsers() {
		return (Users) ActionContext.getContext().getSession().get("users");
	}

	/**
	 * 获得session中dept
	 * 
	 * @return
	 */
	public static Dept getdept() {
		return (Dept) ActionContext.getContext().getSession().get("dept");
	}

	/**
	 * 创建新名字
	 * 
	 * @param oldFileName
	 * @return
	 */
	public static String createNewName(String oldFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		return sdf.format(Calendar.getInstance().getTime())
				+ (int) (Math.random() * 10000) + "."
				+ getExtensionName(oldFileName);
	}

	public static String getExtensionName(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length() - 1))) {
				return filename.substring(dot + 1);
			}
		}
		return filename;
	}

	/***
	 * 获得两个日期相差的天数
	 * 
	 * @param smdate
	 * @param bdate
	 * @return
	 * @throws ParseException
	 */
	public static int daysBetween(String smdate, String bdate)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(sdf.parse(smdate));
		long time1 = cal.getTimeInMillis();
		cal.setTime(sdf.parse(bdate));
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / (1000 * 3600 * 24);
		return Integer.parseInt(String.valueOf(between_days));
	}

	/**
	 * 将字符串按照格式转化为date类型
	 * 
	 * @param dateStr
	 * @param formaterString
	 * @return
	 */
	public static Date toDate(String dateStr, String formaterString) {
		Date date = null;
		SimpleDateFormat formater = new SimpleDateFormat();
		formater.applyPattern(formaterString);
		try {
			date = formater.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	

	// 获得Session中的userId
	public static int getUserId() {
		return (Integer) ActionContext.getContext().getSession().get("usersid");
	}
	// 获得Session中的dept_id
	public static int getDeptId() {
		return (Integer) ActionContext.getContext().getSession().get("dept1");
	}

	/**
	 * 计算百分比
	 * @param x
	 * @param total
	 * @return
	 */
	public static String getPercent(Double x,Double total){  
		   String result="";//接受百分比的值  
		   double tempresult=x/total;  
		   //NumberFormat nf   =   NumberFormat.getPercentInstance();     注释掉的也是一种方法  
		   //nf.setMinimumFractionDigits( 2 );        保留到小数点后几位  
		   DecimalFormat df1 = new DecimalFormat("0.00%");    //##.00%   百分比格式，后面不足2位的用0补齐  
		   //result=nf.format(tempresult);     
		   result= df1.format(tempresult);
		   return result;  
		} 
	
	// 将GBK字符转化为ISO码
	public static String parseGBK(String sIn) {
		if (sIn == null || sIn.equals(""))
			return sIn;
		try {
			return new String(sIn.getBytes("GBK"), "ISO-8859-1");
		} catch (UnsupportedEncodingException usex) {
			return sIn;
		}
	}
	public static int getAge(String birth) {
		  int age = 0;
		  Date now = new Date();
		  Date birthDate=toDate(birth,"yyyy-MM");
		  SimpleDateFormat format_y = new SimpleDateFormat("yyyy");
		  SimpleDateFormat format_M = new SimpleDateFormat("MM");
		  String birth_year = format_y.format(birthDate);
		  String this_year = format_y.format(now);
		  String birth_month = format_M.format(birthDate);
		  String this_month = format_M.format(now);
		  // 初步，估算
		  age = Integer.parseInt(this_year) - Integer.parseInt(birth_year);
		  // 如果未到出生月份，则age - 1
		  if (this_month.compareTo(birth_month) < 0)
		   age -= 1;
		  if (age < 0)
		   age = 0;
		  return age;
		 }
}


