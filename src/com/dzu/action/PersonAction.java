package com.dzu.action;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dzu.model.Assessment;
import com.dzu.model.Carry;
import com.dzu.model.Congress;
import com.dzu.model.Education;
import com.dzu.model.Evaluation;
import com.dzu.model.Family;
import com.dzu.model.Person;
import com.dzu.model.Political;
import com.dzu.model.Relevant;
import com.dzu.model.Resume;
import com.dzu.model.Situation;
import com.dzu.model.Social;
import com.dzu.model.Taiwan;
import com.dzu.model.Taiwanfamily;
import com.dzu.model.Training;
import com.dzu.service.InfoService;
import com.dzu.service.PersonServ;
import com.dzu.service.SymServ;
import com.dzu.util.ArrayUtil;
import com.dzu.util.BaseAction;
import com.dzu.util.BasicUtil;
import com.dzu.util.Listip;

/**
 * @ClassName: PersonAction
 * @Description: 人员信息Action
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月22日 下午5:20:58
 *
 */
@Controller("personinfo")
@Scope("prototype")
public class PersonAction extends BaseAction {

	// 查询条件 hxd
	private String year;
	private int dw = 0;
	private int type = 0;

	// 用户操作
	private String o;

	// 照片上传
	private File uploadify;
	private String uploadifyFileName;

	private String htmltext;
	/**
	 * <p>
	 * Title:
	 * </p>
	 * <p>
	 * Description:
	 * </p>
	 */
	private static final long serialVersionUID = -5491208312687914133L;
	private ServletResponse response = ServletActionContext.getResponse();
	private ServletRequest request = ServletActionContext.getRequest();
	private Person personMessage;
	private List<Education> xlxx; // 学历信息
	private List<Resume> gzjl; // 工作简历
	private List<Congress> mqzgjrdapqk;// 目前在各级人大安排情况
	private List<Political> mqzgjzxapqk;// 目前在各级政协安排情况
	private List<Situation> xrzwqk; // 现任民主党派、工商联、爱国宗教团体、知联会、海联会、光彩会等职务情况
	private List<Relevant> xrygbmqk; // 现任有关部门、单位特约人员（监督员）情况
	private List<Social> xrqtshzw; // 现任其他社会职务(人民团体、社会团体、学术及科研机构等)
	private List<Training> jwnlcjpxqk; // 近五年来参加培训情况
	private List<Carry> hjhsbzqk; // 获奖或受表彰情况
	private List<Assessment> ndkhqk; // 年度考核情况(机关、事业单位人员填写)
	private List<Evaluation> zhpjqk; // 综合评价情况
	private List<Family> jtcyjzyshgx; // 家庭成员及重要社会关系
	private List<String> search;
	private List<Taiwanfamily> qtryjtqk;	//去台人员家庭情况
	@Resource
	private SymServ symServ;
	@Resource
	private PersonServ personServ;
	@Resource
	private InfoService infoServ;

	private int pid;

	public List<Resume> getGzjl() {
		return gzjl;
	}

	public void setGzjl(List<Resume> gzjl) {
		this.gzjl = gzjl;
	}

	public List<Congress> getMqzgjrdapqk() {
		return mqzgjrdapqk;
	}

	public void setMqzgjrdapqk(List<Congress> mqzgjrdapqk) {
		this.mqzgjrdapqk = mqzgjrdapqk;
	}

	public List<Political> getMqzgjzxapqk() {
		return mqzgjzxapqk;
	}

	public void setMqzgjzxapqk(List<Political> mqzgjzxapqk) {
		this.mqzgjzxapqk = mqzgjzxapqk;
	}

	public List<Situation> getXrzwqk() {
		return xrzwqk;
	}

	public void setXrzwqk(List<Situation> xrzwqk) {
		this.xrzwqk = xrzwqk;
	}

	public List<Relevant> getXrygbmqk() {
		return xrygbmqk;
	}

	public void setXrygbmqk(List<Relevant> xrygbmqk) {
		this.xrygbmqk = xrygbmqk;
	}

	public List<Social> getXrqtshzw() {
		return xrqtshzw;
	}

	public void setXrqtshzw(List<Social> xrqtshzw) {
		this.xrqtshzw = xrqtshzw;
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

	public List<Training> getJwnlcjpxqk() {
		return jwnlcjpxqk;
	}

	public void setJwnlcjpxqk(List<Training> jwnlcjpxqk) {
		this.jwnlcjpxqk = jwnlcjpxqk;
	}

	public List<Carry> getHjhsbzqk() {
		return hjhsbzqk;
	}

	public void setHjhsbzqk(List<Carry> hjhsbzqk) {
		this.hjhsbzqk = hjhsbzqk;
	}

	public List<Assessment> getNdkhqk() {
		return ndkhqk;
	}

	public void setNdkhqk(List<Assessment> ndkhqk) {
		this.ndkhqk = ndkhqk;
	}

	public List<Evaluation> getZhpjqk() {
		return zhpjqk;
	}

	public void setZhpjqk(List<Evaluation> zhpjqk) {
		this.zhpjqk = zhpjqk;
	}

	public List<Family> getJtcyjzyshgx() {
		return jtcyjzyshgx;
	}

	public void setJtcyjzyshgx(List<Family> jtcyjzyshgx) {
		this.jtcyjzyshgx = jtcyjzyshgx;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getO() {
		return o;
	}

	public void setO(String o) {
		this.o = o;
	}

	public Person getPersonMessage() {
		return personMessage;
	}

	public void setPersonMessage(Person personMessage) {
		this.personMessage = personMessage;
	}

	public String getHtmltext() {
		return htmltext;
	}

	public void setHtmltext(String htmltext) {
		this.htmltext = htmltext;
	}

	public List<Education> getXlxx() {
		return xlxx;
	}

	public void setXlxx(List<Education> xlxx) {
		this.xlxx = xlxx;
	}

	public List<String> getSearch() {
		return search;
	}

	public void setSearch(List<String> search) {
		this.search = search;
	}

	public String getUploadifyFileName() {
		return uploadifyFileName;
	}

	public void setUploadifyFileName(String uploadifyFileName) {
		this.uploadifyFileName = uploadifyFileName;
	}

	public File getUploadify() {
		return uploadify;
	}

	public void setUploadify(File uploadify) {
		this.uploadify = uploadify;
	}

	/**
	 * @return the qtryjtqk
	 */
	public List<Taiwanfamily> getQtryjtqk() {
		return qtryjtqk;
	}

	/**
	 * @param qtryjtqk the qtryjtqk to set
	 */
	public void setQtryjtqk(List<Taiwanfamily> qtryjtqk) {
		this.qtryjtqk = qtryjtqk;
	}

	/**
	 * @Title: addPerson @Description: 跳转信息采集 @param @return 参数说明 @return String
	 *         返回类型 @throws
	 */
	public String addPerson() {
		setAttr("requiredstr", symServ.getRequiredStr());
		setAttr("prolist", symServ.getPro());
		SetUrl("/WEB-INF/view/person/addperson.jsp");
		return SUCCESS;
	}

	public String searchList() {
		setAttr("prolist", symServ.getPro());
		SetUrl("/WEB-INF/view/person/searchList.jsp");
		return SUCCESS;
	}

	/**
	 * @Title: addPersonDo @Description: 信息采集操作 @param 参数说明 @return void
	 *         返回类型 @throws
	 */
	public void addPersonDo() {
		if(personMessage.getSczp()==null||personMessage.getSczp().length()==0)
			personMessage.setSczp("nophoto.png");
		if (personServ.addPerson(personMessage, xlxx, gzjl, mqzgjrdapqk, mqzgjzxapqk, xrzwqk, xrygbmqk, xrqtshzw,
				jwnlcjpxqk, hjhsbzqk, ndkhqk, zhpjqk, jtcyjzyshgx,qtryjtqk)) {
			setText(response, getMsg(AddSuccess, "Person_personList"));
		} else {
			setText(response, AddError);
		}
		// if(upload!=null){
		// String newfilename = FileUtil.createNewName(uploadFileName);
		// File myFile = new
		// File(ServletActionContext.getServletContext().getRealPath("/") +
		// "resources//images//upload//" + newfilename);
		// FileUtil.copy(upload, myFile);
		// }

	}

	/**
	 * @Title: personList @Description: 人员信息修改列表 @param @return 参数说明 @return
	 *         String 返回类型 @throws
	 */
	public String personList() {
		setAttr("prolist", symServ.getPro());
		init();
		Integer[] pids3 = null;
		if (search != null) {
			pids3 = personServ.getPersonBySearch(search);
		}

		Integer[] depts = ArrayUtil.getIngeter(symServ.getAllDeptid());
		pagehelper(infoServ.getCountPerson(depts, year, dw, type, pids3), "personList",
				infoServ.getPersonOnpage(pageNum - 1, numPerPage, depts, year, dw, type, pids3));
		SetUrl("/WEB-INF/view/person/personlist.jsp");
		return SUCCESS;
	}

	/**
	 * @Title: 查看人员信息 @Description: 查看人员信息 @param @return 参数说明 @return String
	 *         返回类型 @throws
	 */
	public String showPerson() {
		setAttr("personMessage", personServ.getPersonById(getPid()));
		setAttr("prolist", symServ.getPro());
		SetUrl("/WEB-INF/view/person/showPerson.jsp");
		return SUCCESS;
	}

	/**
	 * @Title: 修改人员信息 @Description: 修改人员信息 @param @return 参数说明 @return String
	 *         返回类型 @throws
	 */
	public String updatePerson() {
		Person p = personServ.getPersonById(getPid());
		setAttr("requiredstr", symServ.getRequiredStr());
		setAttr("personMessage", p);
		setAttr("prolist", symServ.getPro());
		if (p.getType() == 1)
			SetUrl("/WEB-INF/view/person/updatePerson.jsp");
		else {
			SetUrl("/WEB-INF/view/person/noupdate.jsp");
		}
		return SUCCESS;
	}

	/**
	 * @Title: updatePersonDo @Description: 修改人员信息 @param 参数说明 @return void
	 *         返回类型 @throws
	 */
	public void updatePersonDo() {
		if(personMessage.getSczp()==null||personMessage.getSczp().length()==0)
			personMessage.setSczp("nophoto.png");
		if (personServ.updatPersonDo(personMessage, xlxx, gzjl, mqzgjrdapqk, mqzgjzxapqk, xrzwqk, xrygbmqk, xrqtshzw,
				jwnlcjpxqk, hjhsbzqk, ndkhqk, zhpjqk, jtcyjzyshgx,qtryjtqk)) {
			setText(response, getMsg(UpdateSuccess, "Person_personList?o=e"));
		} else {
			setText(response, UpdateError);
		}
	}

	/**
	 * @Title: delPerson @Description: 删除人员信息 @param 参数说明 @return void
	 *         返回类型 @throws
	 */
	public void delPerson() {
		if (personServ.delPerson(pid)) {
			setText(response, DeleteSuccess);
		} else {
			setText(response, DeleteError);

		}
	}

	public void uploadImage() throws IOException {
		String extName = "";// 扩展名
		String newFileName = "";// 新文件名
		String nowTime = new SimpleDateFormat("yyyymmddHHmmss").format(new Date());// 当前时间
		@SuppressWarnings("deprecation")
		String savePath = ServletActionContext.getRequest().getRealPath("");
		String proName=ServletActionContext.getRequest().getContextPath();
		savePath = savePath.substring(0, savePath.length()-proName.length());
		savePath = savePath + "/uploads/";
		response.setCharacterEncoding("utf-8");
		// 获取扩展名
		if (uploadifyFileName.lastIndexOf(".") >= 0) {
			extName = uploadifyFileName.substring(uploadifyFileName.lastIndexOf("."));
		}
		newFileName = nowTime + extName;
		uploadify.renameTo(new File(savePath + newFileName));
		// 向前台返回文件名
		setText(response, newFileName);
	}

	// 导出页面
	public String Exporthtml() {
		try {
			response.setContentType("octets/stream; charset=utf-8");
			((HttpServletResponse) response).addHeader("Content-Disposition", "attachment;filename=export.hta");
			OutputStream out = response.getOutputStream();
			String outIp = Listip.getWebIp();
			String ipPort = String.valueOf(request.getServerPort());
			String proName = ((HttpServletRequest) request).getContextPath();
			String realIp = "http://" + outIp + ":" + ipPort + proName + "/";
			String htmltext11 = getHtmltext().replace("onclick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\"",
					"onBlur=\"textChange(this)\"");
			String htmltext111 = htmltext11.replace("onclick=\"WdatePicker({dateFmt:'yyyy-MM'})\"",
					"onBlur=\"textChangee(this)\"");
			String htmltext1111 = htmltext111.replace("onclick=\"WdatePicker({dateFmt:'yyyy'})\"",
					"onBlur=\"textChange2(this)\"");
			String htmltext1 = htmltext1111.replace("readonly=\"readonly\"",
					"");
			String templateContent = "<!DOCTYPE html><html><head>"
					+ "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"
					+ "<HTA:ApplicationID=\"oHTA\"" + "Applicationname=\"myApp\"" + "border=\"thin\""
					+ " borderstyle=\"normal\"" + " caption=\"yes\"" + " icon=\"filename.ico\""
					+ " maximizebutton=\"yes\"" + " minimizebutton=\"yes\"" + " showintaskbar=\"no\""
					+ " singleinstance=\"no\"" + " sysmenu=\"yes\"" + " version=\"1.0\"" + " windowstate=\"normal\""
					+ " scroll=\"yes\">" + "<script type=\"text/javascript\">" + " 		function save_htm() {"
					+ "		if(!validate_form(false)){" + "			return false;" + "		}"
					+ " 		var a=document.getElementById('idCard').value;"
					+ " 		var b=document.documentElement.outerHTML;" + " 		var url=location.href;"
					+ " 		url=url.replace(\".hta\",\".html\");" + " 		url=url.replace(\"file:///\",\"\");"
					+ " 		var fso, tf;" + " 		fso = new ActiveXObject(\"Scripting.FileSystemObject\");"
					+ " 		tf = fso.CreateTextFile(url, true, -1);" + " 		tf.WriteLine(b) ;" + " 	tf.Close();"
					+ " 	alert(\"导出成功！请查看同级目录的生成文件是否正常保存。\");" + " }" + " </script>" + "<style type=\"text/css\">"
					+ "#main{width:95%;margin-left:auto;margin-right:auto;text-align:center;}table{BEHAVIOR:url(#default#savesnapshot)}.stable th{background-color:#f5fafe;text-align:center;font-weight:500;}.stable{width:100%;text-align:center;background-color:#cad9ea;font-size:13px;}.stable tr{height:30px;line-height:30px;vertical-align:middle;}.stable td{background-color:#FFFFFF;padding:2px 2px 2px 2px;text-align:left;}.mybutton{width:80px;margin-top:5px;height:25px;}.mybutton:hover{cursor:pointer;}*{padding:0px;margin:0px;}html,body,form,div,ul,fieldset,li,table,tr,td,span,em,lable,span,input{margin:0px;padding:0px;}body{font-family:Arial,Helvetica,sans-serif;background:#FFFFFF;font-size:13px;letter-spacing:1px;}a{text-decoration:none;color:#006699;}a:hover{text-decoration:underline;}.input_text{border:#AECAF0 solid 1px;height:20px;line-height:20px;vertical-align:middle;font-size:13px;}.input_textarea{border:#AECAF0 solid 1px;vertical-align:middle;padding:0px;margin:0px;font-size:13px;}.input_select{border:#AECAF0 solid 1px;height:20px;line-height:20px;vertical-align:middle;padding-left:5px;padding-right:5px;font-size:13px;}#bodycontent{margin-left:auto;margin-right:auto;text-align:center;}#rylbtable{font-size:12px;margin:0px;padding:0px;}"
					+ "#myTable td{text-align:left;min-width:80px}#myTable th{width:150px;min-width:100px;line-height:20px}input[type=\"text\"]{width:150px}select{width:150px}"
					+".required{padding:2px;margin:0;line-height:15px;font-size:12px;border-style:solid;border-width:1px;border-color:red;}.required{background-position:100% 0;}"
					+ "</style>"
					+ "<script type=\"text/javascript\" src=\"http://apps.bdimg.com/libs/jquery/1.8.0/jquery.min.js\" charset=\"UTF-8\"></script>"
					+ "<script type=\"text/javascript\">"
					+ "String.prototype.replaceAll=function(s1,s2){return this.replace(new RegExp(s1,'gm'),s2)}"
					+ "</script>"
					+ "<script type=\"text/javascript\">function validate_form(test){if($('#idCard').val()==''){alert('身份证号不可为空');return false} return true}"
					+ "function textChange(obj){var datestr=obj.value;var reg=new RegExp(\"^[0-9]{4}-[0-9]{2}-[0-9]{2}$\");if(!reg.test(obj.value)){alert(\"[\"+datestr+\"]格式不对! 日期格式必须:yyyy-mm-dd,如 2000-10-01\")}if(datestr.split(\"-\")[1]>12){alert(\"输入时间超过限制!\");obj.value=''}}"
					+ "function textChangee(obj){var datestr=obj.value;var reg=new RegExp(\"^[0-9]{4}-[0-9]{2}$\");if(!reg.test(obj.value)){alert(\"[\"+datestr+\"]格式不对! 日期格式必须:yyyy-mm,如 2000-10\")}}function textChange2(obj){var datestr=obj.value;var reg=new RegExp(\"^[0-9]{4}$\");if(!reg.test(obj.value)){alert(\"[\"+datestr+\"]格式不对! 日期格式必须:yyyy\")}}"
					+ "</script>"
					+ "</head>"
					+ "<body>"
					+ "<div id=\"main\">"
					+ "<form id=\"addPerson\" action=\"" + realIp
					+ "/Person_addPersonDo\" enctype=\"multipart/form-data\" method=\"post\" onSubmit=\"return validate_form(false)\">"
					+ htmltext1
					+ "<table class=\"stable\" style=\"text-align: left;\" cellpadding=\"0\" cellspacing=\"1\">"
					+ "	<tr>" + "		<td  colspan=\"2\" style=\"text-align: center;\">"
					+ "			<input style=\"width: 50px\" type=\"submit\" value=\"提交\">"
					+ "			<input style=\"width: 50px\" type=\"button\" onclick=\"save_htm();\" value=\"保存\">"
					+ "		</td>" + "	</tr>" + "<TR>" + "	<TD colspan=\"2\"  style=\"text-align: left;\">"
					+ "		说明：</br>" + "		1．红框项为必填项；</br>"
					+ "		2．时间格式为yyyy-mm-dd,如2000-10-01，时间格式为yyyy-mm,如2000-10，时间格式为yyyy,如2000。</br>" + "		3．填写完此表后，如检测无误，点击“保存”按钮，在任意路径下保存；</br>"
					+ "		4．将保存后生成的HTML页面，打包后发给管理员；</br>" + "		5．管理员需要先登录系统然后，点击“提交”按钮，提交到数据库，页面显示为“添加成功”，表示提交成功。"
					+ "		<hr>" + "	</TD>" + "</TR>" + "</table>" + "</form></div></body></html>";
			// 建立文件输出流
			byte tag_bytes[] = templateContent.getBytes("UTF-8");
			out.write(tag_bytes);
			out.close();// 关闭输出流
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// ====================================私有方法================================//
	// 查询初始化
	private void init() {
		if (year == null || year.length() != 4) {
			year = BasicUtil.getCurrentYear();
		}
	}
}
