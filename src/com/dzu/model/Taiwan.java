package com.dzu.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 * @ClassName: Taiwan 
 * @Description: 台胞台属基本信息
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午2:16:38
 *
 */
@Entity
public class Taiwan {
	private int id;
	private String xm;	//姓名
	private String ym;	//原名
	private String xb;	//性别
	private String csny;	//出生年月
	private String mz;	//民族
	private String jg;	//籍贯
	private String xl;	//学历
	private String dp;//党派
	private String zjxy;//宗教信仰
	private String yb;	//邮编
	private String twzj;	//台湾住址
	private String gzdwjzw;	//工作单位及职务
	private String shzw;	//社会职务
	private String lxdh;	//联系电话
	private String jtrk;	//家庭人口
	private String jtjjqk;	//家庭经济情况
	private String cw;	//称谓
	private String rcllqk;	//日常联络情况
	private Set<Taiwanfamily> qtryjtqk;	//去台人员家庭情况
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getYm() {
		return ym;
	}
	public void setYm(String ym) {
		this.ym = ym;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getCsny() {
		return csny;
	}
	public void setCsny(String csny) {
		this.csny = csny;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getJg() {
		return jg;
	}
	public void setJg(String jg) {
		this.jg = jg;
	}
	public String getXl() {
		return xl;
	}
	public void setXl(String xl) {
		this.xl = xl;
	}
	public String getDp() {
		return dp;
	}
	public void setDp(String dp) {
		this.dp = dp;
	}
	public String getZjxy() {
		return zjxy;
	}
	public void setZjxy(String zjxy) {
		this.zjxy = zjxy;
	}
	public String getYb() {
		return yb;
	}
	public void setYb(String yb) {
		this.yb = yb;
	}
	public String getTwzj() {
		return twzj;
	}
	public void setTwzj(String twzj) {
		this.twzj = twzj;
	}
	public String getGzdwjzw() {
		return gzdwjzw;
	}
	public void setGzdwjzw(String gzdwjzw) {
		this.gzdwjzw = gzdwjzw;
	}
	public String getShzw() {
		return shzw;
	}
	public void setShzw(String shzw) {
		this.shzw = shzw;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getJtrk() {
		return jtrk;
	}
	public void setJtrk(String jtrk) {
		this.jtrk = jtrk;
	}
	public String getJtjjqk() {
		return jtjjqk;
	}
	public void setJtjjqk(String jtjjqk) {
		this.jtjjqk = jtjjqk;
	}
	public String getCw() {
		return cw;
	}
	public void setCw(String cw) {
		this.cw = cw;
	}
	public String getRcllqk() {
		return rcllqk;
	}
	public void setRcllqk(String rcllqk) {
		this.rcllqk = rcllqk;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "taiwan_id")
	@OrderBy("id")
	public Set<Taiwanfamily> getQtryjtqk() {
		return qtryjtqk;
	}
	public void setQtryjtqk(Set<Taiwanfamily> qtryjtqk) {
		this.qtryjtqk = qtryjtqk;
	}
	
	
}
