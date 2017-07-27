package com.dzu.action;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dzu.model.Dept;
import com.dzu.model.Person;
import com.dzu.service.InfoService;
import com.dzu.service.SymServ;
import com.dzu.tree.DeptTree;
import com.dzu.util.BasicUtil;
import com.dzu.util.ExportPerson;
import com.dzu.util.ArrayUtil;
import com.dzu.util.BaseAction;

/**
 * 信息总览
 * @ClassName: ExportAction 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月25日 下午12:13:15
 */

@Controller("info")
@Scope("prototype")
public class InfoAction extends BaseAction{
	
	private static final long serialVersionUID = -6882296719447605165L;
	
	HttpServletResponse response = ServletActionContext.getResponse();

	//---------------代表人士和后备人才参数----------------------
	private String year;
	private int dw=0;
	private int type=0;
	private String deptids="";
	private Integer[] fieldids; 
	
	private String exporttype;
	
	//政协参数
	private int zzjb=0;
	private int apzw=0;
	private int apjb=0;
	
	private String pid;
	
	@Resource
	private SymServ symService;
	@Resource
	private InfoService infoService;
	
	/**
	 * 代表人士
	 * @Title: dbrs 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String dbrs(){
		dw=1;
		getPerson(dw);
		setAttr("menusss","exportdbrs");
		setAttr("rurl","dbrs");
		setAttr("exporttype","dbrs");
		SetUrl("WEB-INF/view/export/export_dbrs.jsp");
		return SUCCESS;
	}

	/**
	 * 后备人才
	 * @Title: hbrc 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String hbrc(){
		dw=2;
		getPerson(dw);
		setAttr("menusss","exportdbrs");
		setAttr("rurl","hbrc");
		setAttr("exporttype","dbrs");
		//借用代表人士的页面
		SetUrl("WEB-INF/view/export/export_dbrs.jsp");
		return SUCCESS;
	}
	
	/**
	 * 跳转政协委员页面
	 * @Title: zxwy 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String zxwy(){
		try{
		Init();
		String[] ids=deptids.split(",");
		Integer[] pids=infoService.getPersonsIdOfZXWY(year, zzjb, apzw, apjb);
		pagehelper(
				infoService.getCountPerson(ArrayUtil.getInteger(ids), year,dw, type,pids),
				"personlist",
				infoService.getPersonOnpage(pageNum-1, numPerPage,ArrayUtil.getInteger(ids), year,dw, type,pids));
		setAttr("menusss","exportdbrs");
		setAttr("rurl","zxwy");
		setAttr("exporttype","zxwy");
		}catch(Exception e){e.printStackTrace();}
		//借用代表人士的页面
		SetUrl("WEB-INF/view/export/export_dbrs.jsp");
		return SUCCESS;
	}
	
	public String rddb(){
		try{
		Init();
		String[] ids=deptids.split(",");
		Integer[] pids=infoService.getPersonIdsOfRDDB(year, zzjb, apzw);
		pagehelper(
				infoService.getCountPerson(ArrayUtil.getInteger(ids), year,dw, type,pids),
				"personlist",
				infoService.getPersonOnpage(pageNum-1, numPerPage,ArrayUtil.getInteger(ids), year,dw, type,pids));
		setAttr("menusss","exportrddb");
		setAttr("rurl","rddb");
		setAttr("exporttype","rddb");
		}catch(Exception e){e.printStackTrace();}
		//借用代表人士的页面
		SetUrl("WEB-INF/view/export/export_dbrs.jsp");
		return SUCCESS;
	}
	
	/**
	 * 党外干部
	 * @Title: dwgb 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String dwgb(){
		Init();
		String[] ids=deptids.split(",");
		Integer[] pids=infoService.getPersonIdOfDWGB(year);
		pagehelper(
				infoService.getCountPerson(ArrayUtil.getInteger(ids), year,dw, type,pids),
				"personlist",
				infoService.getPersonOnpage(pageNum-1, numPerPage,ArrayUtil.getInteger(ids), year,dw, type,pids));
		setAttr("menusss","exportdbrs");
		setAttr("rurl","dwgb");
		setAttr("exporttype","dwgb");
		//借用代表人士的页面
		SetUrl("WEB-INF/view/export/export_dbrs.jsp");
		return SUCCESS;
	}
	
	/**
	 * 弹出选择框，选择导出哪些列
	 * @Title: ExportExcel 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String ExportExcel(){
		setAttr("field",symService.getOneRequired());
		SetUrl("WEB-INF/view/export/export.jsp");
		return SUCCESS;
	}
	
	/**
	 * 导出excel操作
	 * @Title: ExportExcelDo 
	 * @Description: (这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String ExportExcelDo(){
		String[] ids=deptids.split(",");
		Integer[] pids = null;
		if(exporttype.equals("zxwy")){
			pids=infoService.getPersonsIdOfZXWY(year, zzjb, apzw, apjb);
		}else if(exporttype.equals("dwgb")){
			pids=infoService.getPersonIdOfDWGB(year);
		}else if(exporttype.equals("rddb")){
			pids=infoService.getPersonIdsOfRDDB(year, zzjb, apzw);
		}
		List<Person> l=infoService.getPerson(ArrayUtil.getInteger(ids), year,dw, type,pids);
		return ExportPerson.ExportExcel(l,symService.getRequiredList(fieldids),symService.getAllPro(),response);
	}
	
	public String ExportPDF(){
		Person p=infoService.getPerson(Integer.valueOf(pid));
		SetUrl(ExportPerson.ExportPDF(symService.getSysInfo().getAppDir(),p,symService.getAllPro()));
		return SUCCESS;
	}
	
	/**
	 * 
	 * @Title: getPerson 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param dw
	 * @param @return 参数说明
	 * @return List<Person> 返回类型
	 * @throws
	 */
	private void getPerson(int dw){
		try{
		Init();
		String[] ids=deptids.split(",");
		List<Dept> ldept=symService.getDeptsByIds(ids);
		setAttr("allyear", infoService.getAllYears());
		setAttr("deptjson3",new DeptTree().getJSON1(symService.getAllDept(),ldept));
		int alllist=infoService.getCountPerson(ArrayUtil.getInteger(ids), year, dw, type,null);
		List<Person> list=infoService.getPersonOnpage(pageNum-1, numPerPage, ArrayUtil.getInteger(ids), year, dw,type,null);
		pagehelper(alllist,"personlist",list);
		}catch(Exception e){e.printStackTrace();}
	}

	/**private List<Person> getPersonList(){
		Init();
		String[] ids=deptids.split(",");
		List<Person> personlist=infoService.getPerson(BasicUtil.getInteger(ids), year, dw, type,null);
		return personlist;
	}**/
	
	//初始化参数year和deptids
	private void Init(){
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
		setAttr("property",symService.getPro());
		setAttr("allyear", infoService.getAllYears());
		String[] ids=deptids.split(",");
		List<Dept> ldept=symService.getDeptsByIds(ids);
		setAttr("deptjson3",new DeptTree().getJSON1(symService.getAllDept(),ldept));
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getDeptids() {
		return deptids;
	}

	public void setDeptids(String deptids) {
		this.deptids = deptids;
	}

	public Integer[] getFieldids() {
		return fieldids;
	}

	public void setFieldids(Integer[] fieldids) {
		this.fieldids = fieldids;
	}

	public int getZzjb() {
		return zzjb;
	}

	public void setZzjb(int zzjb) {
		this.zzjb = zzjb;
	}

	public int getApzw() {
		return apzw;
	}

	public void setApzw(int apzw) {
		this.apzw = apzw;
	}

	public int getApjb() {
		return apjb;
	}

	public void setApjb(int apjb) {
		this.apjb = apjb;
	}

	public String getExporttype() {
		return exporttype;
	}

	public void setExporttype(String exporttype) {
		this.exporttype = exporttype;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

}
