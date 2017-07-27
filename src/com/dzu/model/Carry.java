package com.dzu.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @ClassName: Carry 
 * @Description: 获奖或受表彰情况
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午1:33:16
 *
 */
@Entity
public class Carry {
	private int id;
	private String xydw;	//授予单位 
	private String hjhsbzmc;//获奖或受表彰名称
	private String sjsj;	//获奖时间
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
	public String getXydw() {
		return xydw;
	}
	public void setXydw(String xydw) {
		this.xydw = xydw;
	}
	public String getHjhsbzmc() {
		return hjhsbzmc;
	}
	public void setHjhsbzmc(String hjhsbzmc) {
		this.hjhsbzmc = hjhsbzmc;
	}
	public String getSjsj() {
		return sjsj;
	}
	public void setSjsj(String sjsj) {
		this.sjsj = sjsj;
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
