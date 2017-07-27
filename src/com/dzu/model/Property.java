package com.dzu.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/** 
 * @Title: Property.java 
 * @Package com.dzu.model 
 * @Description: 属性信息
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:41:17 
 * @version V1.0 
 */
@Entity
public class Property {
	private int id;
	private String p_name;
	private String content;
	private String status;
	private int type;
	

	public Property() {
	}

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}


