package com.dzu.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @ClassName: Family 
 * @Description: 家庭成员及重要社会关系
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午1:48:14
 *
 */
@Entity
public class Family{
	private int id;
	private String cw;//称谓
	private String xm;//姓名
	private String csny;//出生年月
	private String zzmm;//政治面貌
	private String gzdwjzw;	//工作单位及职务
	private String year;	//年份
	private Person person;
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCw() {
		return cw;
	}
	public void setCw(String cw) {
		this.cw = cw;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getCsny() {
		return csny;
	}
	public void setCsny(String csny) {
		this.csny = csny;
	}
	public String getZzmm() {
		return zzmm;
	}
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	public String getGzdwjzw() {
		return gzdwjzw;
	}
	public void setGzdwjzw(String gzdwjzw) {
		this.gzdwjzw = gzdwjzw;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "person_id")
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	

}
