package com.dzu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.dzu.model.Assessment;
import com.dzu.model.Carry;
import com.dzu.model.Congress;
import com.dzu.model.Dept;
import com.dzu.model.Education;
import com.dzu.model.Evaluation;
import com.dzu.model.Family;
import com.dzu.model.Person;
import com.dzu.model.PersonNum;
import com.dzu.model.Political;
import com.dzu.model.Relevant;
import com.dzu.model.Resume;
import com.dzu.model.Situation;
import com.dzu.model.Social;
import com.dzu.model.Training;
import com.dzu.service.InfoService;
import com.dzu.service.PersonServ;
import com.dzu.service.SymServ;
import com.dzu.tree.DeptTree;
import com.dzu.util.ArrayUtil;
import com.dzu.util.BaseAction;
import com.dzu.util.BasicUtil;
import com.dzu.util.FileUtil;

/**
 * 人员上报Action
 * @ClassName: PersonSBAction 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年7月23日 下午3:23:37
 */
@Controller("personsbinfo")
@Scope("prototype")
public class PersonSBAction extends BaseAction{

	HttpServletResponse response = ServletActionContext.getResponse();
	
	private static final long serialVersionUID = -1037343064334851847L;

	private int type=1;//1是未上报。2是已上报。默认未上报
	private String year="";
	private int dw=1;
	private String deptids="";
	
	private Integer[] pids;
	
	private String filename;
	private String file_name;
	private File uploadify;
	private String uploadifyFileName;
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	@Resource
	private SymServ symServ;
	
	@Resource
	private InfoService infoService;
	
	@Resource
	private PersonServ personService;
	
	/**
	 * 人员列表
	 * @Title: personlist 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String personlist(){
		init();
		//获取所管辖节点
		Integer[] depts=ArrayUtil.getInteger(deptids.split(","));
		
		//获取人员列表
		List<Person> lp=infoService.getPersonOnpage(pageNum-1,numPerPage,depts, year, dw, type, new Integer[]{});
		pagehelper(infoService.getCountPerson(depts, year, dw, type,new Integer[]{}),"personlist",lp);
		
		setAttr("rurl","list"+type);
		SetUrl("WEB-INF/view/personsb/personsblist.jsp");
		return SUCCESS;
	}
	
	/**
	 * 人员导出列表
	 * @Title: personlist1 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String personlist1(){
		init();
		//获取所管辖节点
		Integer[] depts=ArrayUtil.getInteger(deptids.split(","));
		//获取人员列表
		List<Person> lp=infoService.getPersonOnpage(pageNum-1,numPerPage,depts, year, dw, 2, new Integer[]{});
		pagehelper(infoService.getCountPerson(depts, year, dw, type,new Integer[]{}),"personlist",lp);
		
		setAttr("rurl","list11"+type);
		SetUrl("WEB-INF/view/personsb/personsblist1.jsp");
		return SUCCESS;
	}

	public void personSBDo(){
		try{
			if(pids!=null&&pids.length>0){
				//获取已上报人数
				if(type==1){
					//人员上报
					Integer[] depts=ArrayUtil.getIngeter(symServ.getAllDeptid());
					int count=infoService.getCountPerson(depts, year, dw, 2,new Integer[]{});
					PersonNum pn=symServ.getPersonNum(BasicUtil.getDeptId(), year);
					int sum=pn.getNum();
					if(dw==2)
						sum=pn.getNum2();
					if(sum>0&&count+pids.length<=sum){
						if(personService.personSB(pids,2))
							setText(response,getMsg("上报成功","PersonSB_personlist?type=1"));
						else
							setText(response, getMsgError("上报失败"));
					}else{
						setText(response,getMsgError("报送名额不足"));
					}
				}else{
					if(personService.personSB(pids,1))
						setText(response,getMsg("取消上报成功","PersonSB_personlist?type=2"));
					else
						setText(response, getMsgError("取消上报失败"));
				}
			}else{
				setText(response,getMsgError("没有选择上报人员"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public String export(){
		try{
			init();
			//获取所管辖节点
			Integer[] depts=ArrayUtil.getInteger(deptids.split(","));
			//获取人员列表
			List<Person> lp=infoService.getPersonOnpage(0,10000,depts, year, dw, 2,pids);
			
			List<Person> lp1=new ArrayList<Person>();
			for(Person p:lp){
				p.setId(0);
				Dept d=new Dept();
				d.setId(p.getDept().getId());
				p.setDept(d);
				
				Set<Education> se=p.getXlxx();
				for(Education e:se){
					e.setId(0);
				}
				
				Set<Political> sp=p.getMqzgjzxapqk();
				for(Political pp:sp){
					pp.setId(0);
				}
				Set<Resume> gzjl =p.getGzjl();
				for (Resume resu : gzjl) {
					resu.setId(0);
				}
				Set<Congress> mqzgjrdapqk=p.getMqzgjrdapqk();
				for (Congress congr : mqzgjrdapqk) {
					congr.setId(0);
				}
				Set<Situation> xrzwqk=p.getXrzwqk();
				for (Situation sit : xrzwqk) {
					sit.setId(0);
				}
				Set<Relevant> xrygbmqk=p.getXrygbmqk();
				for (Relevant rele : xrygbmqk) {
					rele.setId(0);
				}
				Set<Social> xrqtshzw=p.getXrqtshzw();
				for (Social soc : xrqtshzw) {
					soc.setId(0);
				}
				Set<Training> jwnlcjpxqk=p.getJwnlcjpxqk();
				for (Training tra : jwnlcjpxqk) {
					tra.setId(0);
				}
				Set<Carry> hjhsbzqk=p.getHjhsbzqk();
				for (Carry carr : hjhsbzqk) {
					carr.setId(0);
				}
				Set<Assessment> ndkhqk=p.getNdkhqk();
				for (Assessment assess : ndkhqk) {
					assess.setId(0);
				}
				Set<Evaluation> zhpjqk=p.getZhpjqk();
				for (Evaluation eval : zhpjqk) {
					eval.setId(0);
				}
				Set<Family> jtcyjzyshgx=p.getJtcyjzyshgx();
				for (Family fam : jtcyjzyshgx) {
					fam.setId(0);
				}
				lp1.add(p);
			}
			
			String url=symServ.getSysInfo().getAppDir();
			String fn=symServ.getDeptMess(BasicUtil.getDeptId()).getDept_name()+"-"+lp.size()+"人.dwrs";
			this.setFile_name(fn);
			this.setFilename(this.getClass().getResource("/").getPath() + "/../../export/" + this.file_name);
			FileUtil.zip(url,fn,lp1);
			setAttr("file_name",BasicUtil.parseGBK(url+"export/"+fn));
		}catch(Exception e){
			e.printStackTrace();
		}
		return "downloadexport";
	}
	
	/**
	 * 上报人员统计
	 * @Title: TJ 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String TJ(){
		List<Dept> ld=symServ.getNumDepts();
		setAttr("deptlist",ld);
		setAttr("allyear",symServ.getYears());
		if(year==null||year.length()==0){
			year=BasicUtil.getCurrentYear();
		}
		
		List<Integer[]> li=new ArrayList<>();
		for(Dept d:ld){
			int count=infoService.getCountPerson(new Integer[]{d.getId()}, year, 1, 2,new Integer[]{});
			Integer[] i=new Integer[]{d.getId(),count,1};
			li.add(i);
			int count2=infoService.getCountPerson(new Integer[]{d.getId()}, year, 2, 2,new Integer[]{});
			Integer[] i2=new Integer[]{d.getId(),count2,2};
			li.add(i2);
		}
		setAttr("da", li);
		
		SetUrl("WEB-INF/view/personsb/tj.jsp");
		return SUCCESS;
	}
	
	public String comeinPerson(){
		SetUrl("WEB-INF/view/personsb/dr.jsp");
		return SUCCESS;
	}
	
	public void comeinPersonDo() throws IOException {
		String extName = "";// 扩展名
		String newFileName = "";// 新文件名
		String nowTime = new SimpleDateFormat("yyyymmddHHmmss").format(new Date());// 当前时间
		@SuppressWarnings("deprecation")
		String savePath = ServletActionContext.getRequest().getRealPath("");
		savePath = savePath + "/uploads/";
		response.setCharacterEncoding("utf-8");
		// 获取扩展名
		if (uploadifyFileName.lastIndexOf(".") >= 0) {
			extName = uploadifyFileName.substring(uploadifyFileName.lastIndexOf("."));
		}
		newFileName = nowTime + extName;
		uploadify.renameTo(new File(savePath + newFileName));
		String str="";
		try{
			str=personService.sbSavePerson(FileUtil.importinfo(savePath+newFileName));	
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(str);
		// 向前台返回文件名
		setText(response, str);
	}
	
	//============================私有方法=============================//
	/**
	 * 参数初始化
	 * @Title: init 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param  参数说明
	 * @return void 返回类型
	 * @throws
	 */
	private void init(){
		if (year == null || year.length() != 4) {
			year = BasicUtil.getCurrentYear();
		}
		if(deptids.length()==0){
			List<Integer> l=symServ.getAllDeptid();
			for(Integer i:l){
				deptids+=String.valueOf(i)+",";
			}
			deptids=deptids.substring(0, deptids.length()-1);
		}
		setAttr("property",symServ.getPro());
		setAttr("allyear", infoService.getAllYears());
		String[] ids=deptids.split(",");
		List<Dept> ldept=symServ.getDeptsByIds(ids);
		setAttr("deptjson3",new DeptTree().getJSON1(symServ.getAllDept(),ldept));
	}
	
	public InputStream getInputStreams() {
		FileInputStream fil = null;
		try {
			fil = new FileInputStream(filename);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return fil;
	}
	
	//=============================GET and SET=========================//
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

	public int getDw() {
		return dw;
	}

	public void setDw(int dw) {
		this.dw = dw;
	}

	public String getDeptids() {
		return deptids;
	}

	public void setDeptids(String deptids) {
		this.deptids = deptids;
	}

	public Integer[] getPids() {
		return pids;
	}

	public void setPids(Integer[] pids) {
		this.pids = pids;
	}

	public File getUploadify() {
		return uploadify;
	}

	public void setUploadify(File uploadify) {
		this.uploadify = uploadify;
	}

	public String getUploadifyFileName() {
		return uploadifyFileName;
	}

	public void setUploadifyFileName(String uploadifyFileName) {
		this.uploadifyFileName = uploadifyFileName;
	}
}
