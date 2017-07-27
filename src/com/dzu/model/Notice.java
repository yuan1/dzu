package com.dzu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/** 
 * @Title: Notice.java 
 * @Package com.dzu.model 
 * @Description: 通知公告信息
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:40:45 
 * @version V1.0 
 */
@Entity
public class Notice {
	private int id;
	private String title;
	private String content;
	private String date;

	public Notice() {
	}

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(length = 9000)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}


