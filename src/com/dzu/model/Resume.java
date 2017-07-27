package com.dzu.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @ClassName: JobResume 
 * @Description: 工作简历
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午12:55:03
 *
 */
@Entity
public class Resume {
	private int id;
	private String kssj;//开始时间
	private String jssj;	//结束时间
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
	public String getKssj() {
		return kssj;
	}
	public void setKssj(String kssj) {
		this.kssj = kssj;
	}
	public String getJssj() {
		return jssj;
	}
	public void setJssj(String jssj) {
		this.jssj = jssj;
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
