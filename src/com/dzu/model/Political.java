package com.dzu.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @ClassName: Political 
 * @Description:目前在各级政协安排情况
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午1:06:21
 *
 */
@Entity
public class Political {
	private int id;
	private String gjzxzzmc;//各级政协组织名称
	private String jc;//届次
	private String zzjb;//组织级别
	private String apzw;	//安排职务
	private String apsj;	//	安排时间
	private String apjb;	//安排界别
	private String year;	//年份
	private Person person;	//
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGjzxzzmc() {
		return gjzxzzmc;
	}
	public void setGjzxzzmc(String gjzxzzmc) {
		this.gjzxzzmc = gjzxzzmc;
	}
	public String getJc() {
		return jc;
	}
	public void setJc(String jc) {
		this.jc = jc;
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
	
	public String getZzjb() {
		return zzjb;
	}
	public void setZzjb(String zzjb) {
		this.zzjb = zzjb;
	}
	public String getApzw() {
		return apzw;
	}
	public void setApzw(String apzw) {
		this.apzw = apzw;
	}
	public String getApsj() {
		return apsj;
	}
	public void setApsj(String apsj) {
		this.apsj = apsj;
	}
	public String getApjb() {
		return apjb;
	}
	public void setApjb(String apjb) {
		this.apjb = apjb;
	}
	

}
