package com.dzu.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 * @ClassName: Person 
 * @Description: 人员信息Model
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午12:15:37
 *
 */
@Entity
public class Person {
	private int id;
	private String xm;	//姓名
	private String xb;	//	性别
	private String csny;	//出生年月
	private String mz;	//民族
	private String jg;	//籍贯
	private String gj;	//国籍
	private String cjgzsj;	//参加工作时间
	private String dydp;	//第一党派
	private String dydpjrsj;	//第一党派加入时间
	private String dedp;	//第二党派
	private String dedpjrsj;	//第二党派加入时间
	private String sczp;	//上传照片
	private String zjlb;	//宗教类别
	private String hwlxjl;	//海外留学经历（是否）
	private String hwlxjlgb;	//海外留学经历国别：
	private String shxjc;	//社会新阶层
	private String rylb;	//人员类别;
	private int lrdw;	//列入队伍(1代表人士。2后备人才)
	private String sfzhm;	//身份证号码
	private String fzdwjzw;	//工作单位及职务
	private String xrjb;	//现任级别
	private String rxzsj;	//任现职时间
	private String rtjsj;	//任同级时间
	private String zyjszc;	//专业技术职称
	private String zcjb;	//职称级别
	private Set<Education> xlxx;	//学历信息
	private Set<Resume> gzjl;	//工作简历
	private Set<Congress> mqzgjrdapqk;//目前在各级人大安排情况
	private Set<Political> mqzgjzxapqk;//目前在各级政协安排情况
	private Set<Situation> xrzwqk; 	//现任民主党派、工商联、爱国宗教团体、知联会、海联会、光彩会等职务情况
	private Set<Relevant> xrygbmqk; 	//现任有关部门、单位特约人员（监督员）情况
	private Set<Social> xrqtshzw; 	//现任其他社会职务(人民团体、社会团体、学术及科研机构等)
	private Set<Training> jwnlcjpxqk; 	//近五年来参加培训情况
	private Set<Carry> hjhsbzqk; 	//获奖或受表彰情况
	
	private String zyzzbx;	//主要政治表现
	private String zycjhshyx;	//主要成就和社会影响

	private Set<Assessment> ndkhqk; 	//年度考核情况(机关、事业单位人员填写)
	private Set<Evaluation> zhpjqk; 	//综合评价情况
	private Set<Family> jtcyjzyshgx; 	//家庭成员及重要社会关系
	private String tbts;//台胞台属（是否）
	private Taiwan tbtsjbxx;	//台胞台属基本信息
	private String txdz;	//通讯地址
	private String yzbm;	//邮政编码
	private String bgdh;	//办公电话
	private String sjhm;	//手机号码
	private String dzxx;	//电子信箱
	private String wxhm;	//微信号码
	private String qqhm;	//qq号码
	private String bz;	//备注
	private Dept dept;
	private int type;	//状态 0是全部。1是未上报。2是已上报。
	private String year;	//年份
	
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
	public String getGj() {
		return gj;
	}
	public void setGj(String gj) {
		this.gj = gj;
	}
	public String getCjgzsj() {
		return cjgzsj;
	}
	public void setCjgzsj(String cjgzsj) {
		this.cjgzsj = cjgzsj;
	}
	public String getDydpjrsj() {
		return dydpjrsj;
	}
	public void setDydpjrsj(String dydpjrsj) {
		this.dydpjrsj = dydpjrsj;
	}
	public String getDedpjrsj() {
		return dedpjrsj;
	}
	public void setDedpjrsj(String dedpjrsj) {
		this.dedpjrsj = dedpjrsj;
	}
	public String getSczp() {
		return sczp;
	}
	public void setSczp(String sczp) {
		this.sczp = sczp;
	}
	public String getZjlb() {
		return zjlb;
	}
	public void setZjlb(String zjlb) {
		this.zjlb = zjlb;
	}
	public String getHwlxjl() {
		return hwlxjl;
	}
	public void setHwlxjl(String hwlxjl) {
		this.hwlxjl = hwlxjl;
	}
	public String getHwlxjlgb() {
		return hwlxjlgb;
	}
	public void setHwlxjlgb(String hwlxjlgb) {
		this.hwlxjlgb = hwlxjlgb;
	}
	public String getShxjc() {
		return shxjc;
	}
	public void setShxjc(String shxjc) {
		this.shxjc = shxjc;
	}
	public String getRylb() {
		return rylb;
	}
	public void setRylb(String rylb) {
		this.rylb = rylb;
	}
	public String getSfzhm() {
		return sfzhm;
	}
	public void setSfzhm(String sfzhm) {
		this.sfzhm = sfzhm;
	}
	public String getFzdwjzw() {
		return fzdwjzw;
	}
	public void setFzdwjzw(String fzdwjzw) {
		this.fzdwjzw = fzdwjzw;
	}
	public String getXrjb() {
		return xrjb;
	}
	public void setXrjb(String xrjb) {
		this.xrjb = xrjb;
	}
	public String getRxzsj() {
		return rxzsj;
	}
	public void setRxzsj(String rxzsj) {
		this.rxzsj = rxzsj;
	}
	public String getRtjsj() {
		return rtjsj;
	}
	public void setRtjsj(String rtjsj) {
		this.rtjsj = rtjsj;
	}
	public String getZyjszc() {
		return zyjszc;
	}
	public void setZyjszc(String zyjszc) {
		this.zyjszc = zyjszc;
	}
	public String getZcjb() {
		return zcjb;
	}
	public void setZcjb(String zcjb) {
		this.zcjb = zcjb;
	}
	
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Education> getXlxx() {
		return xlxx;
	}
	public void setXlxx(Set<Education> xlxx) {
		this.xlxx = xlxx;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Resume> getGzjl() {
		return gzjl;
	}
	public void setGzjl(Set<Resume> gzjl) {
		this.gzjl = gzjl;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Congress> getMqzgjrdapqk() {
		return mqzgjrdapqk;
	}
	public void setMqzgjrdapqk(Set<Congress> mqzgjrdapqk) {
		this.mqzgjrdapqk = mqzgjrdapqk;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Political> getMqzgjzxapqk() {
		return mqzgjzxapqk;
	}
	public void setMqzgjzxapqk(Set<Political> mqzgjzxapqk) {
		this.mqzgjzxapqk = mqzgjzxapqk;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Situation> getXrzwqk() {
		return xrzwqk;
	}
	public void setXrzwqk(Set<Situation> xrzwqk) {
		this.xrzwqk = xrzwqk;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Relevant> getXrygbmqk() {
		return xrygbmqk;
	}
	public void setXrygbmqk(Set<Relevant> xrygbmqk) {
		this.xrygbmqk = xrygbmqk;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Social> getXrqtshzw() {
		return xrqtshzw;
	}
	public void setXrqtshzw(Set<Social> xrqtshzw) {
		this.xrqtshzw = xrqtshzw;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Training> getJwnlcjpxqk() {
		return jwnlcjpxqk;
	}
	public void setJwnlcjpxqk(Set<Training> jwnlcjpxqk) {
		this.jwnlcjpxqk = jwnlcjpxqk;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Carry> getHjhsbzqk() {
		return hjhsbzqk;
	}
	public void setHjhsbzqk(Set<Carry> hjhsbzqk) {
		this.hjhsbzqk = hjhsbzqk;
	}
	
	public String getZyzzbx() {
		return zyzzbx;
	}
	public void setZyzzbx(String zyzzbx) {
		this.zyzzbx = zyzzbx;
	}
	public String getZycjhshyx() {
		return zycjhshyx;
	}
	public void setZycjhshyx(String zycjhshyx) {
		this.zycjhshyx = zycjhshyx;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Assessment> getNdkhqk() {
		return ndkhqk;
	}
	public void setNdkhqk(Set<Assessment> ndkhqk) {
		this.ndkhqk = ndkhqk;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Evaluation> getZhpjqk() {
		return zhpjqk;
	}
	public void setZhpjqk(Set<Evaluation> zhpjqk) {
		this.zhpjqk = zhpjqk;
	}
	@OneToMany(cascade = CascadeType.ALL)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "person_id")
	@OrderBy("id")
	public Set<Family> getJtcyjzyshgx() {
		return jtcyjzyshgx;
	}
	public void setJtcyjzyshgx(Set<Family> jtcyjzyshgx) {
		this.jtcyjzyshgx = jtcyjzyshgx;
	}
	public String getTbts() {
		return tbts;
	}
	public void setTbts(String tbts) {
		this.tbts = tbts;
	}
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "tbtsjbxx_id")
	public Taiwan getTbtsjbxx() {
		return tbtsjbxx;
	}
	public void setTbtsjbxx(Taiwan tbtsjbxx) {
		this.tbtsjbxx = tbtsjbxx;
	}
	
	public String getTxdz() {
		return txdz;
	}
	public void setTxdz(String txdz) {
		this.txdz = txdz;
	}
	public String getYzbm() {
		return yzbm;
	}
	public void setYzbm(String yzbm) {
		this.yzbm = yzbm;
	}
	public String getBgdh() {
		return bgdh;
	}
	public void setBgdh(String bgdh) {
		this.bgdh = bgdh;
	}
	public String getSjhm() {
		return sjhm;
	}
	public void setSjhm(String sjhm) {
		this.sjhm = sjhm;
	}
	public String getDzxx() {
		return dzxx;
	}
	public void setDzxx(String dzxx) {
		this.dzxx = dzxx;
	}
	public String getWxhm() {
		return wxhm;
	}
	public void setWxhm(String wxhm) {
		this.wxhm = wxhm;
	}
	public String getQqhm() {
		return qqhm;
	}
	public void setQqhm(String qqhm) {
		this.qqhm = qqhm;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "dept_id")
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	
	public int getLrdw() {
		return lrdw;
	}
	public void setLrdw(int lrdw) {
		this.lrdw = lrdw;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getDydp() {
		return dydp;
	}
	public void setDydp(String dydp) {
		this.dydp = dydp;
	}
	public String getDedp() {
		return dedp;
	}
	public void setDedp(String dedp) {
		this.dedp = dedp;
	}
	
	public Person() {
		super();
	}
	
}
