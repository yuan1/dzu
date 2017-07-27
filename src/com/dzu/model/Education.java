package com.dzu.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @ClassName: Education 
 * @Description: 学历信息
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午12:48:06
 *
 *
 */
@Entity
public class Education {
	private int id;	
	private String  byyxjzy;	//毕业院校及专业
	private String kssj;	//开始时间
	private String jssj;	//结束时间
	private String qdxl;	//取得学历
	private String shxw;	//所获学位
	private String type;	//分类（全日制、在职）
	private String year;	//年份
	private int hight=0;	//是否最高	1最高0最低
	private Person person;
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getByyxjzy() {
		return byyxjzy;
	}
	public void setByyxjzy(String byyxjzy) {
		this.byyxjzy = byyxjzy;
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
	public String getQdxl() {
		return qdxl;
	}
	public void setQdxl(String qdxl) {
		this.qdxl = qdxl;
	}
	public String getShxw() {
		return shxw;
	}
	public void setShxw(String shxw) {
		this.shxw = shxw;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public int getHight() {
		return hight;
	}
	public void setHight(int hight) {
		this.hight = hight;
	}
	

}
