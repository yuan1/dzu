package com.dzu.action;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dzu.model.Dept;
import com.dzu.model.Menus;
import com.dzu.model.PersonNum;
import com.dzu.model.Property;
import com.dzu.model.Role;
import com.dzu.model.SystemInfo;
import com.dzu.model.Users;
import com.dzu.service.CommonServ;
import com.dzu.service.SymServ;
import com.dzu.tree.DeptTree;
import com.dzu.tree.RoleTree;
import com.dzu.util.BasicUtil;
import com.dzu.util.BaseAction;
import com.opensymphony.xwork2.ActionContext;

/** 
 * @Title: SymAction.java 
 * @Package com.dzu.action 
 * @Description: 系统Action
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:14:52 
 * @version V1.0
 */
@Controller("sym")
@Scope("prototype")
public class SymAction extends BaseAction {
	private static final long serialVersionUID = -7253369870237262519L;
	private ServletResponse response = ServletActionContext.getResponse();
	
	// 系统设置
	private SystemInfo sysinfo;
	public SystemInfo getSysinfo() {
		return sysinfo;
	}
	public void setSysinfo(SystemInfo sysinfo) {
		this.sysinfo = sysinfo;
	}

	@Resource
	private SymServ systemManageSer;
	@Resource
	private SymServ symServ;
	
	private int d=0; // 用户组织唯一ID
	private String o; // 用户操作
	private Dept depts;// 获取组织提交信息
	private int pid; // 要移动的父id
	private int user_id;

	// ========用户管理=============
	private Users users;
	private String username;
	private String id_card;
	private String old_name;
	private String old_idCard;
	private String old_pass;

	// ============角色管理=======================
	private int role_id=1;
	private Role role;
	@Resource
	private CommonServ commonServ;
	private String permission;

	private int pro_id;
	private String proname;
	private Property property;

	private String[] menusid;
	private String deptsids;
	
	//===================上报人数=======================
	private List<PersonNum> personnum;
	private String time;
	
	//===================设置必填项=======================
	private Integer[] rids;
	
	// ================deptManage===========================
	/**
	 * 异步获得组织节点
	 * 
	 * 根据管辖范围(若是没有，则根据下属单位)
	 * 
	 * @throws IOException
	 */
	/*public void findDeptTree() throws IOException {
		response.setContentType("text/json; charset=utf-8");
		List<Integer> deptList = symServ.getAllDept();
		List<Dept> menusL = symServ.getDeptOne();
		Dept m = menusL.get(0);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(0);
		Map<String, Object> map = symServ.convertToMap(m);
		map.put("children", getTreeDeptList(m, deptList));
		list.add(map);
		response.getWriter().println(JSON.toJSONString(list));
	}*/

	/**
	 * 递归添加子节点
	 * @param d
	 * @param deptList
	 * @return
	 */
	/*private List<Map<String, Object>> getTreeDeptList(Dept d,
			List<Integer> deptList) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(0); // 菜单树
		for (Dept item : d.getChildren()) {
			if (symServ.hasIdInRoleDeptList(item, deptList)) {
				Map<String, Object> map = symServ.convertToMap(item);
				map.put("children", getTreeDeptList(item, deptList));
				list.add(map);
			}
		}
		return list;
	}*/

	/**
	 * deptView
	 * 
	 * @return
	 */
	public String dept() {
		try{
		if(d==0)
			d=101;
		setAttr("deptid", d);
		setAttr("deptjson",new DeptTree().getJSON("Sym_seedept?d=",symServ.getAllDept()));
		SetUrl("/WEB-INF/view/system/dept/dept.jsp");
		}catch(Exception e){e.printStackTrace();}
		return SUCCESS;
	}

	/**
	 * 查看部门
	 * @Title: seedept 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String seedept(){
		try{
		setAttr("deptMess", symServ.getDeptMess(d));
		SetUrl("/WEB-INF/view/system/dept/seedept.jsp");
		}catch(Exception e){e.printStackTrace();}
		return SUCCESS;
	}
	
	/**
	 * addDept
	 * 
	 * @throws IOException
	 */
	public void addDeptDo(){
		try{
		int x=symServ.addDept(depts);
		if (x>0) {
			setText(response,getMsg(AddSuccess,"Sym_dept?d="+x));
		}else{
			setText(response, AddError);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * addDept
	 * 
	 * @throws IOException
	 */
	public String addDept(){
		setAttr("parentdept", symServ.getDeptMess(d));
		SetUrl("/WEB-INF/view/system/dept/adddept.jsp");
		return SUCCESS;
	}

	/**
	 * updateDept
	 * 
	 * @throws IOException
	 */
	public void updateDeptDo() throws IOException {
		if (symServ.updateDeptName(depts)) {
			setText(response,getMsg(UpdateSuccess,"Sym_dept?d="+depts.getId()));
		}else{
			setText(response, UpdateError);
		}
	}
	
	public String updateDept(){
		setAttr("aa", symServ.getDeptMess(d));
		SetUrl("/WEB-INF/view/system/dept/updatedept.jsp");
		return SUCCESS;
	}

	/**
	 * delDept
	 * 
	 * @throws IOException
	 */
	public void delDept() throws IOException {
		if (symServ.deleteDept(d)) {
			setText(response,DeleteSuccess);
		}else{
			setText(response,DeleteError);
		}
	}

	/**
	 * moveDept
	 * 
	 * @throws IOException
	 */
	public void moveDept() throws IOException {
		if (symServ.moveDept(d, pid)) {
			setText(response,"1");
		}else{
			setText(response,"0");
		}
	}

	// =======================userManage============================================
	public String user() {
		try{
			if(d==0)
				d=BasicUtil.getDeptId();
			setAttr("deptid1", d);
			setAttr("deptjson1",new DeptTree().getJSON("Sym_userlist?d=",symServ.getAllDept()));
			SetUrl("/WEB-INF/view/system/user/userdept.jsp");
			}catch(Exception e){e.printStackTrace();}
			return SUCCESS;
	}
	
	public String userlist() {
		try{
				if(d==0)
					d=BasicUtil.getDeptId();
				setAttr("deptname",symServ.getDeptMess(d).getDept_name());
				setAttr("deptid1", d);
				pagehelper((int)symServ.getUserNum(d),"userlist",symServ.getUsersByDept(pageNum-1, numPerPage, d));
				SetUrl("/WEB-INF/view/system/user/userlist.jsp");
				}catch(Exception e){e.printStackTrace();}
				return SUCCESS;
		}

	/**
	 * 修改用户
	 * 
	 * @throws IOException
	 */
	public void updateUserDo() throws IOException{
		boolean a=symServ.updateUsers(users, old_pass);
		if (a) {
			setText(response,getMsg(UpdateSuccess,""));
		}else{
			setText(response,UpdateError);
		}
	}
	
	public String updateUser(){
		setAttr("userSee3",symServ.getOneUser(user_id));
		if(o.equals("s"))
			SetUrl("/WEB-INF/view/system/user/seeUser.jsp");
		if(o.equals("u"))
			SetUrl("/WEB-INF/view/system/user/updateUser.jsp");
		return SUCCESS;
	}

	/**
	 * 检验用户名
	 * 
	 * @throws IOException
	 */
	public void checkUserName() throws IOException {
		if ("ok".equals(symServ.checkName(username, old_name))) {
			response.getWriter().print(1);
		}
	}

	/**
	 * 检验身份证号
	 * 
	 * @throws IOException
	 */
	public void checkIdCard() throws IOException {
		if ("ok".equals(symServ.checkIdCard(id_card, old_idCard))) {
			response.getWriter().print(1);
		}
	}

	/**
	 * 删除用户
	 * 
	 * @throws IOException
	 */
	public void delUsers() throws IOException {
		if ("ok".equals(symServ.delUsers(user_id))) {
			setText(response,DeleteSuccess);
		}else{
			setText(response,DeleteError);
		}
	}

	/**
	 * 添加用户
	 * 
	 * @throws IOException
	 */
	public String addUser(){
		setAttr("dept",symServ.getDeptMess(d));
		setAttr("rolejson",new RoleTree().getJSON(symServ.getRoleMessage(1),""));
		SetUrl("/WEB-INF/view/system/user/adduser.jsp");
		return SUCCESS;
	}
	
	public void addUserDo() throws IOException {
		if (symServ.addUsers(users)) {
			response.getWriter().print(1);
		}
	}

	// =====================角色管理==========================

	/**
	 * 用于递归获得子菜单
	 * 
	 * @param r
	 * @param roleList
	 * @return
	 */
	/*private List<Map<String, Object>> getTreeRoleList(Role r,
			List<Integer> roleList) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(0); // 菜单树
		for (Role item : r.getRoles()) {
			if (symServ.hasIdInRoleDeptList(item, roleList)) {
				Map<String, Object> map = symServ.convertToMap(item);
				map.put("children", getTreeRoleList(item, roleList));
				list.add(map);
			}
		}
		return list;
	}*/

	/**
	 * 角色管理
	 * 
	 * @return
	 */
	public String role() {
		try{
		setAttr("roleid",role_id);
		setAttr("deptjson2",new RoleTree().getJSON(symServ.getRoleMessage(1),"Sym_seerole?d="));
		SetUrl("/WEB-INF/view/system/role/role.jsp");
		}catch(Exception e){e.printStackTrace();}
		return SUCCESS;
	}
	
	public String seerole() {
		try{
			try{
			setAttr("roleMess", symServ.getRoleMessage(d));
			SetUrl("/WEB-INF/view/system/role/seerole.jsp");
			}catch(Exception e){e.printStackTrace();}
		}catch(Exception e){e.printStackTrace();}
		return SUCCESS;
	}

	/**
	 * 添加角色
	 * 
	 * @throws IOException
	 */
	public void addRoleDo() throws IOException {
		int x=symServ.addRoleDo(role);
		if (x>0) {
			setText(response,getMsg(AddSuccess,"Sym_role?d="+x));
		}else{
			setText(response,AddError);
		}
	}

	public String addRole(){
		setAttr("roleMess", symServ.getRoleMessage(d));
		SetUrl("/WEB-INF/view/system/role/addrole.jsp");
		return SUCCESS;
	}
	
	/**
	 * 修改角色的基本信息
	 * 
	 * @throws IOException
	 */
	public String updateRole() throws IOException {
		setAttr("roleMess", symServ.getRoleMessage(d));
		SetUrl("/WEB-INF/view/system/role/updaterole.jsp");
		return SUCCESS;
	}
	
	/**
	 * 修改角色的基本信息
	 * @throws IOException
	 */
	public void updateRoleDo() throws IOException {
		if (symServ.updateRole(role)) {
			setText(response,getMsg(UpdateSuccess,"Sym_role?d="+role.getId()));
		}else{
			setText(response,UpdateError);
		}
	}

	/**
	 * 删除
	 * 
	 * @throws IOException
	 */
	public void delRoleDo() throws IOException {
		if (symServ.delRoleDo(role_id)) {
			setText(response,DeleteSuccess);
		}else{
			setText(response,DeleteError);
		}
	}

	/**
	 * 获得角色对应的管理范围
	 * 
	 * @throws IOException
	 */
	/*public void findDeptTreeForScope() throws IOException {
		response.setContentType("text/json; charset=utf-8");
		List<Integer> deptList = symServ.getAllDept();
		List<Dept> menusL = symServ.getDeptOne();
		Dept m = menusL.get(0);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(0);
		Map<String, Object> map = symServ.convertToMapForScope(m, role_id);
		map.put("children", getTreeDeptListForScope(m, deptList));
		list.add(map);
		response.getWriter().println(JSON.toJSONString(list));
	}*/

	/**
	 * 用于管理范围的设置
	 * 
	 * @param d
	 * @param deptList
	 * @return
	 */
	/*private List<Map<String, Object>> getTreeDeptListForScope(Dept d,
			List<Integer> deptList) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(0); // 菜单树
		for (Dept item : d.getChildren()) {
			if (symServ.hasIdInRoleDeptList(item, deptList)) {
				Map<String, Object> map = symServ.convertToMapForScope(item,
						role_id);
				map.put("children", getTreeDeptListForScope(item, deptList));
				list.add(map);
			}
		}
		return list;
	}*/
	
	/**
	 * 跳转权限编辑操作
	 * @Title: roleEdit 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String roleEdit(){
		Role r=symServ.getRoleMessage(d);
		setAttr("roleMess",r);
		Set<Menus> m=r.getMenus();
		String str=",";
		for(Menus m1:m){
			str+=m1.getId()+",";
		}
		setAttr("roleids",str);
		setAttr("menus",symServ.getMenusList());
		setAttr("deptjson3",new DeptTree().getAllJSON(symServ.getAllDept(),r.getDepts()));
		SetUrl("/WEB-INF/view/system/role/quanxian.jsp");
		return SUCCESS;
	}

	/**
	 * 权限编辑
	 * 
	 * @throws IOException
	 */
	public void roleEditDo() throws IOException {
		if ("ok".equals(symServ.editRoleMenu(role_id,menusid,deptsids))) {
			setText(response,getMsg(UpdateSuccess,"Sym_role?role_id="+role_id));
		} else {
			setText(response,UpdateError);
		}
	}

	// =====================属性设置============================================
	public String proList() {
		List<String> l=symServ.getProName();
		setAttr("names",l);
		if(proname==null||proname.length()==0)
			proname=l.get(0);
		pagehelper(symServ.getPro(proname),"prolist",symServ.getPro(pageNum-1, numPerPage,proname));
		SetUrl("/WEB-INF/view/system/property/prolist.jsp");
		return SUCCESS;
	}

	public String uPro() {
		ActionContext.getContext().put("pro", symServ.getPro(pro_id));
		if(o.equals("s"))
			SetUrl("/WEB-INF/view/system/property/seepro.jsp");
		if(o.equals("u"))
			SetUrl("/WEB-INF/view/system/property/uPro.jsp");
		return SUCCESS;
	}

	public String AddPro(){
		setAttr("names",symServ.getProName());
		SetUrl("/WEB-INF/view/system/property/addPro.jsp");
		return SUCCESS;
	}
	
	public void AddProDo(){
		if(symServ.addPro(property)){
			setText(response,getMsg(AddSuccess,""));
		}else{
			setText(response,AddError);
		}
	}
	
	public void DuPro() throws IOException {
		if (symServ.uPro(pro_id,property)) {
			setText(response,getMsg(UpdateSuccess,""));
		}else{
			setText(response,UpdateError);
		}
	}

	public void DeleteProDo(){
		if(symServ.delPro(pro_id)){
			setText(response,DeleteSuccess);
		}else{
			setText(response,DeleteError);
		}
	}


	// =======================个人信息===================
	public String personalMessage() {
		setAttr("userSee3",
				systemManageSer.getOneUser(BasicUtil.getUserId()));
		SetUrl("/WEB-INF/view/personalMessage/personalMessage.jsp");
		return SUCCESS;
	}
	
	/**
	 * 跳转修改信息操作
	 * @Title: UpdatepersonalMessage 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String UpdatepersonalMessage() {
		setAttr("userSee3",
				systemManageSer.getOneUser(BasicUtil.getUserId()));
		SetUrl("/WEB-INF/view/personalMessage/UpdatepersonalMessage.jsp");
		return SUCCESS;
	}

	// =============系统设置========================
	// 环境状态
	public String environmentStatus() {
		sysinfo = systemManageSer.getSysInfo();
		SetUrl("/WEB-INF/view/system/environment/environmentStatus.jsp");
		return SUCCESS;
	}
	
	//======================上报人数设置=============================
	/**
	 * 跳转设置上报人数页
	 * @Title: PersonNum1 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String PersonNum1(){
		setAttr("deptlist",symServ.getNumDepts());
		setAttr("allyear",symServ.getYears());
		int x=0;
		if(time==null||time.length()==0){
			time=BasicUtil.getCurrentYear();
		}if(time.equals(BasicUtil.getCurrentYear())){
			x=1;
		}
		setAttr("input",x);
		SetUrl("/WEB-INF/view/system/deptnum/deptnum.jsp");
		return SUCCESS;
	}
	
	/**
	 * 设置上报人数
	 * @Title: SetPersonNum 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param  参数说明
	 * @return void 返回类型
	 * @throws
	 */
	public void SetPersonNum(){
		if(symServ.SetPersonNum(time, personnum)){
			setText(response,getMsg(UpdateSuccess,""));
		}else{
			setText(response,UpdateError);
		}
	}
	
	
	//==========================必填项设置========================//
	public String RequireList(){
		setAttr("rlist",symServ.getRequired());
		SetUrl("/WEB-INF/view/system/required/required.jsp");
		return SUCCESS;
	}
	
	public void SetRequired(){
		if(symServ.SetRequired(rids)){
			setText(response,getMsg(UpdateSuccess,""));
		}else{
			setText(response,UpdateError);
		}
	}
	
	//====================get and set===========================//
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String[] getMenusid() {
		return menusid;
	}
	public void setMenusid(String[] menusid) {
		this.menusid = menusid;
	}
	public String getDeptsids() {
		return deptsids;
	}
	public void setDeptsids(String deptsids) {
		this.deptsids = deptsids;
	}
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public String getPermission() {
		return permission;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public int getD() {
		return d;
	}

	public void setD(int d) {
		this.d = d;
	}

	public String getOld_pass() {
		return old_pass;
	}

	public void setOld_pass(String old_pass) {
		this.old_pass = old_pass;
	}

	public String getO() {
		return o;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getOld_idCard() {
		return old_idCard;
	}

	public void setOld_idCard(String old_idCard) {
		this.old_idCard = old_idCard;
	}

	public void setO(String o) {
		this.o = o;
	}

	public Dept getDepts() {
		return depts;
	}

	public void setDepts(Dept depts) {
		this.depts = depts;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}

	public String getId_card() {
		return id_card;
	}

	public void setId_card(String id_card) {
		this.id_card = id_card;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getOld_name() {
		return old_name;
	}

	public void setOld_name(String old_name) {
		this.old_name = old_name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public List<PersonNum> getPersonnum() {
		return personnum;
	}
	public void setPersonnum(List<PersonNum> personnum) {
		this.personnum = personnum;
	}
	public Integer[] getRids() {
		return rids;
	}
	public void setRids(Integer[] rids) {
		this.rids = rids;
	}
}

