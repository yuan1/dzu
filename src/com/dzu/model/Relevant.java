package com.dzu.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @ClassName: Relevant 
 * @Description: 现任有关部门、单位特约人员（监督员）情况
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午1:17:08
 *
 */
@Entity
public class Relevant {
	private int id;
	private String pqbm;	//聘请部门、单位名称
	private String tyrymc;	//特约人员名称
	private String kssj;	//	开始时间
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
	public String getPqbm() {
		return pqbm;
	}
	public void setPqbm(String pqbm) {
		this.pqbm = pqbm;
	}
	public String getTyrymc() {
		return tyrymc;
	}
	public void setTyrymc(String tyrymc) {
		this.tyrymc = tyrymc;
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
