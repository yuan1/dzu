package com.dzu.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @ClassName: Training 
 * @Description: 近五年来参加培训情况
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午1:29:00
 *
 */
@Entity
public class Training {
	private int id;
	private String zbdw;	//主办单位
	private String bcmc;	//班次名称
	private String pxyx;	//培训院校
	private String kssj;	//开始时间
	private String jssj;	//结束时间
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
	public String getZbdw() {
		return zbdw;
	}
	public void setZbdw(String zbdw) {
		this.zbdw = zbdw;
	}
	public String getBcmc() {
		return bcmc;
	}
	public void setBcmc(String bcmc) {
		this.bcmc = bcmc;
	}
	public String getPxyx() {
		return pxyx;
	}
	public void setPxyx(String pxyx) {
		this.pxyx = pxyx;
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
