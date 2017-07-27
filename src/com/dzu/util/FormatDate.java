package com.dzu.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/** 
 * @Title: FormatDate.java 
 * @Package com.dzu.util 
 * @Description: 日期格式化工具
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:52:00 
 * @version V1.0 
 */
public class FormatDate {
	public static String myformatDate(Date date,int ymd,String mid){
		SimpleDateFormat sdf;
		switch (ymd) {
		case 1:
			sdf = new SimpleDateFormat("yyyy");
			break;
		case 2:
			sdf = new SimpleDateFormat("yyyy"+mid+"MM");
			break;
		case 3:
			sdf = new SimpleDateFormat("yyyy"+mid+"MM"+mid+"dd");
			break;
		default:
			sdf = new SimpleDateFormat("yyyy"+mid+"MM"+mid+"dd");
			break;
		}
		if(date!=null){
			return sdf.format(date);
		}else{
			return "";
		}
	}
	public static String myformatDate(Date date,int ymd){
		SimpleDateFormat sdf;
		switch (ymd) {
		case 1:
			sdf = new SimpleDateFormat("yyyy");
			break;
		case 2:
			sdf = new SimpleDateFormat("yyyy.MM");
			break;
		case 3:
			sdf = new SimpleDateFormat("yyyy.MM.dd");
			break;
		default:
			sdf = new SimpleDateFormat("yyyy.MM.dd");
			break;
		}
		if(date!=null){
			return sdf.format(date);
		}else{
			return "";
		}
	}
	public static String myformatDate(Date date){
		if(date!=null){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM");
			return sdf.format(date);
		}else{
			return "";
		}
	}

	public static Date myStringToDate(String sdate,int ymd){
		SimpleDateFormat sdf;
		Date date;
		switch (ymd) {
		case 1:
			sdf = new SimpleDateFormat("yyyy");
			break;
		case 2:
			sdf = new SimpleDateFormat("yyyy.MM");
			break;
		case 3:
			sdf = new SimpleDateFormat("yyyy.MM.dd");
			break;
		default:
			sdf = new SimpleDateFormat("yyyy.MM.dd");
			break;
		}
		if(sdate!=null&&!(sdate.equals(""))){
				try {
						date = sdf.parse(sdate);
						return date;
				} catch (ParseException e) {
					e.printStackTrace();
					return null;
				}
		}else{
			return null;
		}
	}
	public static Date myStringToDate(String sdate,String split){
		
		SimpleDateFormat sdf;
		int length= sdate.split(split).length;
		Date date;
		switch (length) {
		case 1:
			sdf = new SimpleDateFormat("yyyy");
			break;
		case 2:
			sdf = new SimpleDateFormat("yyyy"+split+"MM");
			break;
		case 3:
			sdf = new SimpleDateFormat("yyyy"+split+"MM"+split+"dd");
			break;
		default:
			sdf = new SimpleDateFormat("yyyy"+split+"MM"+split+"dd");
			break;
		}
		if(sdate!=null&&!(sdate.equals(""))){
			try {
				date = sdf.parse(sdate);
				return date;
			} catch (ParseException e) {
				e.printStackTrace();
				return null;
			}
		}else{
			return null;
		}
	}
	public static Date myStringToDate(String sdate,int ymd,String mid){
		SimpleDateFormat sdf;
		Date date;
		switch (ymd) {
		case 1:
			sdf = new SimpleDateFormat("yyyy");
			break;
		case 2:
			sdf = new SimpleDateFormat("yyyy"+mid+"MM");
			break;
		case 3:
			sdf = new SimpleDateFormat("yyyy"+mid+"MM"+mid+"dd");
			break;
		default:
			sdf = new SimpleDateFormat("yyyy"+mid+"MM"+mid+"dd");
			break;
		}
		if(sdate!=null&&!(sdate.equals(""))){
			try {
				date = sdf.parse(sdate);
				return date;
			} catch (ParseException e) {
				e.printStackTrace();
				return null;
			}
		}else{
			return null;
		}
	}

}

