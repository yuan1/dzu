package com.dzu.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @ClassName: Evaluation 
 * @Description: 综合评价情况
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午1:43:54
 *
 */
@Entity
public class Evaluation {
	private int id;
	private String zhpjjg;	//综合评价结果
	private String pjdw;	//评价单位
	private String pjsj;	//评价时间
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
	public String getZhpjjg() {
		return zhpjjg;
	}
	public void setZhpjjg(String zhpjjg) {
		this.zhpjjg = zhpjjg;
	}
	public String getPjdw() {
		return pjdw;
	}
	public void setPjdw(String pjdw) {
		this.pjdw = pjdw;
	}
	public String getPjsj() {
		return pjsj;
	}
	public void setPjsj(String pjsj) {
		this.pjsj = pjsj;
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
