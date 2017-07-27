package com.dzu.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.dzu.model.Dept;
import com.dzu.model.Education;
import com.dzu.model.Person;
import com.dzu.model.Property;
import com.dzu.service.InfoService;
import com.dzu.service.SymServ;
import com.dzu.tree.DeptTree;
import com.dzu.util.BasicUtil;
import com.dzu.util.ArrayUtil;
import com.dzu.util.BaseAction;

/**
 * 统计分析
 * 
 * @ClassName: StatisticesAction
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月24日 上午10:48:12
 *
 */
@Controller("statistices")
@Scope("prototype")
public class StatisticesAction extends BaseAction {

	private static final long serialVersionUID = 7689138700910120649L;

	@Resource
	private InfoService infoService;
	@Resource
	private SymServ symService;

	private String year;
	private int dw=0;
	private int type=0;
	private String deptids="";

	/**
	 * 根据性别统计分析 @Title: BySex @Description: TODO(这里用一句话描述这个方法的作用) @param @return
	 * 参数说明 @return String 返回类型 @throws
	 */
	public String BySex() {
		int m = 0, w = 0, count = 0;
		for (Person p : getPerson()) {
			if (p.getXb().trim().equals("男")) {
				m++;
			}
			if (p.getXb().trim().equals("女")) {
				w++;
			}
			count++;
		}
		setAttr("mancount", m);
		setAttr("womencount", w);
		setAttr("count", count);
		setAttr("menusss","sex");
		SetUrl("/WEB-INF/view/statistics/bysex.jsp");
		return SUCCESS;
	}

	/**
	 * 根据民族统计
	 * 
	 * @return
	 */
	public String ByNational() {
		int m = 0, w = 0, count = 0;
		for (Person p : getPerson()) {
			if (p.getMz().trim().equals("汉族")) {
				m++;
			}else {
				w++;
			}
			count++;
		}
		setAttr("hz", m);
		setAttr("ssmz", w);
		setAttr("count", count);
		setAttr("menusss","national");
		SetUrl("/WEB-INF/view/statistics/bynation.jsp");
		return SUCCESS;
	}

	/**
	 * 类别统计
	 * @Title: ByType 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String ByType() {
		try{
		int mzdp = 0, wdp = 0, ssmz = 0, zjj = 0, fgyzjj = 0;
		int gatb = 0, xshjc = 0, dwzsfz = 0, cghgglx = 0;
		int tbts = 0, hq = 0, qt = 0;
		int mzdp1 = 0, wdp1 = 0, ssmz1 = 0, zjj1 = 0, fgyzjj1 = 0;
		int gatb1 = 0, xshjc1 = 0, dwzsfz1 = 0, cghgglx1 = 0;
		int tbts1 = 0, hq1 = 0, qt1 = 0;
		int count=0,count1=0;
		for (Person p : getPerson()) {
			count++;
			if(p.getRylb()!=null&&p.getRylb().trim().length()>0){
			String lb = p.getRylb().trim();
			String[] str = p.getRylb().trim().split(",");
			if (str[0].equals("民主党派")) {
				mzdp++;
			}
			if (str[0].equals("无党派")) {
				wdp++;
			}
			if (str[0].equals("少数民族")) {
				ssmz++;
			}
			if (str[0].equals("宗教界")) {
				zjj++;
			}
			if (str[0].equals("非公有制经济")) {
				fgyzjj++;
			}
			if (str[0].equals("港澳同胞")) {
				gatb++;
			}
			if (str[0].equals("新的社会阶层")) {
				xshjc++;
			}
			if (str[0].equals("党外知识分子")) {
				dwzsfz++;
			}
			if (str[0].equals("出国和归国留学")) {
				cghgglx++;
			}
			if (str[0].equals("台湾同胞及其在大陆的亲属")) {
				tbts++;
			}
			if (str[0].equals("华侨、归侨及侨眷")) {
				hq++;
			}
			if (str[0].equals("其他需要联系和团结的人员")) {
				qt++;
			}
			if (lb.contains("民主党派")) {
				mzdp1++;
			}
			if (lb.contains("无党派")) {
				wdp1++;
			}
			if (lb.contains("少数民族")) {
				ssmz1++;
			}
			if (lb.contains("宗教界")) {
				zjj1++;
			}
			if (lb.contains("非公有制经济")) {
				fgyzjj1++;
			}
			if (lb.contains("港澳同胞")) {
				gatb1++;
			}
			if (lb.contains("新的社会阶层")) {
				xshjc1++;
			}
			if (lb.contains("党外知识分子")) {
				dwzsfz1++;
			}
			if (lb.contains("出国和归国留学")) {
				cghgglx1++;
			}
			if (lb.contains("台湾同胞及其在大陆的亲属")) {
				tbts1++;
			}
			if (lb.contains("华侨、归侨及侨眷")) {
				hq1++;
			}
			if (lb.contains("其他需要联系和团结的人员")) {
				qt1++;
			}
			}else{
				count1++;
			}
		}
		String[] strCount = { String.valueOf(mzdp), String.valueOf(wdp), String.valueOf(ssmz), String.valueOf(zjj),
				String.valueOf(fgyzjj), String.valueOf(gatb), String.valueOf(xshjc), String.valueOf(dwzsfz),
				String.valueOf(cghgglx), String.valueOf(tbts), String.valueOf(hq), String.valueOf(qt) };
		String[] strName = { "mzdp", "wdp", "ssmz", "zjj", "fgyzjj", "gatb", "xshjc", "dwzsfz", "cghgglx", "tbts", "hq",
				"qt" };
		setAttr(strName, strCount);

		String[] strCount1 = { String.valueOf(mzdp1), String.valueOf(wdp1), String.valueOf(ssmz1), String.valueOf(zjj1),
				String.valueOf(fgyzjj1), String.valueOf(gatb1), String.valueOf(xshjc1), String.valueOf(dwzsfz1),
				String.valueOf(cghgglx1), String.valueOf(tbts1), String.valueOf(hq1), String.valueOf(qt1) };
		String[] strName1 = { "mzdp1", "wdp1", "ssmz1", "zjj1", "fgyzjj1", "gatb1", "xshjc1", "dwzsfz1", "cghgglx1",
				"tbts1", "hq1", "qt1" };
		setAttr(strName1, strCount1);
		setAttr("count",count);
		setAttr("count1",count1);
		setAttr("menusss","rylb");
		}catch(Exception e){e.printStackTrace();}
		SetUrl("/WEB-INF/view/statistics/bytype.jsp");
		return SUCCESS;
	}

	/**
	 * 职称统计分析
	 * @Title: ByZC 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String ByZC(){
		//获取职称级别字符串
		List<Property> zclist=symService.getPro1("职称级别");
		Integer[] nums=new Integer[zclist.size()];
		String zcstr="[";
		for(Property p:zclist){
			zcstr+="'"+p.getContent()+"',";
		}
		zcstr=zcstr.substring(0,zcstr.length()-1)+"]";
		
		//值的遍历分析
		List<Person> l=getPerson();
		int a=0;
		for(Property zc:zclist){
			int i=0;
			for(Person p:l){
				if(p.getZcjb().equals(String.valueOf(zc.getId()))){
					i++;
				}
			}
			nums[a]=i;
			a++;
		}
		
		//构建所需json
		List<Map<String,Object>> ll=new ArrayList<Map<String,Object>>();
		for(int i=0;i<zclist.size();i++){
			Map<String,Object> m=new HashMap<String,Object>();
			m.put("name",zclist.get(i).getContent());
			m.put("value",nums[i]);
			ll.add(m);
		}
		setAttr("json",JSON.toJSONString(ll));
		setAttr("zcstr",zcstr);
		setAttr("zclist",zclist);
		setAttr("nums",nums);
		setAttr("count",l.size());
		setAttr("menusss","zhiwu");
		SetUrl("/WEB-INF/view/statistics/byZC.jsp");
		return SUCCESS;
	}
	
	/**
	 * 学位信息统计分析
	 * @Title: ByXL 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String ByXL(){
		//获取学历字符串
				List<Property> zclist=symService.getPro1("学历");
				Integer[] nums=new Integer[zclist.size()];
				String zcstr="[";
				for(Property p:zclist){
					zcstr+="'"+p.getContent()+"',";
				}
				zcstr=zcstr.substring(0,zcstr.length()-1)+"]";
				
				//值的遍历分析
				List<Person> l=getPerson();
				int a=0;
				for(Property zc:zclist){
					int i=0;
					for(Person p:l){
						Set<Education> xl=p.getXlxx();
						for(Education e:xl){
							if(e.getHight()==1){
								if(e.getQdxl().equals(String.valueOf(zc.getId()))){
									i++;
								}
							}
						}
					}
					nums[a]=i;
					a++;
				}
				
				//构建所需json
				List<Map<String,Object>> ll=new ArrayList<Map<String,Object>>();
				for(int i=0;i<zclist.size();i++){
					Map<String,Object> m=new HashMap<String,Object>();
					m.put("name",zclist.get(i).getContent());
					m.put("value",nums[i]);
					ll.add(m);
				}
				setAttr("json",JSON.toJSONString(ll));
				setAttr("zcstr",zcstr);
				setAttr("zclist",zclist);
				setAttr("nums",nums);
				setAttr("count",l.size());
				setAttr("menusss","xlxx");
				SetUrl("/WEB-INF/view/statistics/byXL.jsp");
				return SUCCESS;
	}
	
	public String ByXW(){
		List<Property> zclist=symService.getPro1("学位");
		Integer[] nums=new Integer[zclist.size()];
		String zcstr="[";
		for(Property p:zclist){
			zcstr+="'"+p.getContent()+"',";
		}
		zcstr=zcstr.substring(0,zcstr.length()-1)+"]";
		
		//值的遍历分析
		List<Person> l=getPerson();
		int a=0;
		for(Property zc:zclist){
			int i=0;
			for(Person p:l){
				Set<Education> xl=p.getXlxx();
				for(Education e:xl){
					if(e.getHight()==1){
						if(e.getShxw().equals(String.valueOf(zc.getId()))){
							i++;
						}
					}
				}
			}
			nums[a]=i;
			a++;
		}
		
		//构建所需json
		List<Map<String,Object>> ll=new ArrayList<Map<String,Object>>();
		for(int i=0;i<zclist.size();i++){
			Map<String,Object> m=new HashMap<String,Object>();
			m.put("name",zclist.get(i).getContent());
			m.put("value",nums[i]);
			ll.add(m);
		}
		setAttr("json",JSON.toJSONString(ll));
		setAttr("zcstr",zcstr);
		setAttr("zclist",zclist);
		setAttr("nums",nums);
		setAttr("count",l.size());
		setAttr("menusss","xwxx");
		SetUrl("/WEB-INF/view/statistics/byXW.jsp");
		return SUCCESS;
	}
	
	/**
	 * 年龄结构
	 * @Title: ByAge 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String ByAge(){
		List<Property> zclist=symService.getPro1("年龄结构间隔");
		Integer[] nums=new Integer[zclist.size()+1];
		String[] str=new String[zclist.size()+1];
		str[0]="0~"+zclist.get(0).getContent();
		for(int i=0;i<zclist.size()-1;i++){
			str[i+1]=Integer.valueOf(zclist.get(i).getContent())+1+"~"+zclist.get(i+1).getContent();
		}
		str[str.length-1]=Integer.valueOf(zclist.get(zclist.size()-1).getContent())+1+"岁以上";
		String zcstr="[";
		for(String p:str){
			zcstr+="'"+p+"',";
		}
		zcstr=zcstr.substring(0,zcstr.length()-1)+"]";
		//值的遍历分析
		List<Person> l=getPerson();
		int a=0;
		for(int x=0;x<str.length;x++){
			String s=str[x];
			String[] age=s.split("~");
			int age1=0,age2=0;
			if(x==str.length-1){
				age1=Integer.valueOf(s.substring(0,s.length()-3));
				age2=9999;
			}else{
				age1=Integer.valueOf(age[0]);
				age2=Integer.valueOf(age[1])+1;
			}
			int i=0;
			for(Person p:l){
				if(p.getCsny().length()>0){
					int p_age=BasicUtil.getAge(p.getCsny());
					if(p_age<=age2&&p_age>=age1){
						i++;
					}
				}
			}
			nums[a]=i;
			a++;
		}
		
		//构建所需json
		List<Map<String,Object>> ll=new ArrayList<Map<String,Object>>();
		for(int i=0;i<str.length;i++){
			Map<String,Object> m=new HashMap<String,Object>();
			m.put("name",str[i]);
			m.put("value",nums[i]);
			ll.add(m);
		}
		setAttr("json",JSON.toJSONString(ll));
		setAttr("agestr",zcstr);
		setAttr("agelist",str);
		setAttr("nums",nums);
		setAttr("count",l.size());
		setAttr("menusss","age");
		SetUrl("/WEB-INF/view/statistics/byAge.jsp");
		return SUCCESS;
	}
	
	/**
	 * 私有方法。获取自己管辖的所有人员
	 * 
	 * @return
	 */
	private List<Person> getPerson() {
		if (year == null || year.length() != 4) {
			year = BasicUtil.getCurrentYear();
		}
		if(deptids.length()==0){
			List<Integer> l=symService.getAllDeptid();
			for(Integer i:l){
				deptids+=String.valueOf(i)+",";
			}
			deptids=deptids.substring(0, deptids.length()-1);
		}
		String[] ids=deptids.split(",");
		List<Dept> ldept=symService.getDeptsByIds(ids);
		setAttr("allyear", infoService.getAllYears());
		setAttr("deptjson3",new DeptTree().getJSON1(symService.getAllDept(),ldept));
		List<Person> l = infoService.getPerson(ArrayUtil.getInteger(ids),year,dw,type,null);
		return l;
	}

	// +++++++++++++++++++++++Set and Get++++++++++++++++++++++++++++++
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public int getDw() {
		return dw;
	}

	public void setDw(int dw) {
		this.dw = dw;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getType() {
		return type;
	}

	public String getDeptids() {
		return deptids;
	}

	public void setDeptids(String deptids) {
		this.deptids = deptids;
	}
}
