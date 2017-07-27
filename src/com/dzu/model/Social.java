package com.dzu.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @ClassName: Social 
 * @Description: 现任其他社会职务(人民团体、社会团体、学术及科研机构等)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午1:26:14
 *
 */
@Entity
public class Social {
	private int id;
	private String zzmc;	//组织名称
	private String rzkssj;	//任职开始时间
	private String rzjssj;	//	任职结束时间
	private String apzw;	//安排职务
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
	public String getZzmc() {
		return zzmc;
	}
	public void setZzmc(String zzmc) {
		this.zzmc = zzmc;
	}
	public String getRzkssj() {
		return rzkssj;
	}
	public void setRzkssj(String rzkssj) {
		this.rzkssj = rzkssj;
	}
	public String getRzjssj() {
		return rzjssj;
	}
	public void setRzjssj(String rzjssj) {
		this.rzjssj = rzjssj;
	}
	public String getApzw() {
		return apzw;
	}
	public void setApzw(String apzw) {
		this.apzw = apzw;
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
