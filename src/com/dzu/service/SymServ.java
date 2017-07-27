package com.dzu.service;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;

import com.dzu.dao.DeptDao;
import com.dzu.dao.MenusDao;
import com.dzu.dao.PersonNumDao;
import com.dzu.dao.PropertyDao;
import com.dzu.dao.RequiredDao;
import com.dzu.dao.RoleDao;
import com.dzu.dao.UsersDao;
import com.dzu.model.Dept;
import com.dzu.model.Menus;
import com.dzu.model.PersonNum;
import com.dzu.model.Property;
import com.dzu.model.Required;
import com.dzu.model.Role;
import com.dzu.model.SystemInfo;
import com.dzu.model.Users;
import com.dzu.util.ArrayUtil;
import com.dzu.util.BasicUtil;

/**
 * @Title: SymServ.java
 * @Package com.dzu.service
 * @Description: 系统业务操作
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:11:38
 * @version V1.0
 */
@Service
public class SymServ {
	@Resource
	private CommonServ commonServ;
	@Resource
	private DeptDao deptDao;
	@Resource
	private UsersDao usersDao;
	@Resource
	private RoleDao roleDao;
	@Resource
	private MenusDao menusDao;
	@Resource
	private PropertyDao propertyDao;
	@Resource
	private PersonNumDao personnumDao;
	@Resource
	private RequiredDao requiredDao;

	/**
	 * 获得当前角色管辖范围的组织中所有节点
	 * 
	 * @return
	 */
	public List<Integer> getAllDeptid() {
		List<Integer> list = new ArrayList<Integer>();
		if (commonServ.getRoleDeptList().size() > 0) {
			list = commonServ.getRoleDeptList();
		} else {
			list = commonServ.getAllChildren(BasicUtil.getdept().getId());
		}
		return list;
	}

	public List<Dept> getDeptsByIds(String[] ids) {
		Integer[] i = new Integer[ids.length];
		for (int x = 0; x < ids.length; x++) {
			i[x] = Integer.valueOf(ids[x]);
		}
		return deptDao.getByIds(i);
	}

	/**
	 * 获得当前角色管辖范围的组织中所有节点
	 * 
	 * @return
	 */
	public List<Dept> getAllDept() {
		List<Integer> l = getAllDeptid();
		Integer[] ids = new Integer[l.size()];
		for (int i = 0; i < ids.length; i++) {
			ids[i] = l.get(i);
		}
		return deptDao.getByIds(ids);
	}

	public List<Dept> getAllDepts() {
		return deptDao.findAll(new String[] { "status" }, " sort ", "1");
	}

	// 获得菜单中第一个节点
	public List<Dept> getDeptOne() {
		List<Dept> list = deptDao.getNullDepts();
		return list;
	}

	// 为map设置
	public Map<String, Object> convertToMap(Dept dept) {
		Map<String, Object> map = new HashMap<String, Object>(0);
		map.put("id", dept.getId());
		map.put("text", dept.getDept_name());
		return map;
	}

	// 判断
	public boolean hasIdInRoleDeptList(Dept dept, List<Integer> roleDeptList) {
		if (-1 != roleDeptList.indexOf(dept.getId()))
			return true;
		for (Dept item : dept.getChildren()) {
			if (hasIdInRoleDeptList(item, roleDeptList))
				return true;
		}
		return false;
	}

	/**
	 * 获得机构信息
	 * 
	 * @param dept_id
	 * @return
	 */
	public Dept getDeptMess(int dept_id) {
		Dept dept = deptDao.getById(dept_id);
		return dept;
	}

	/**
	 * addDept
	 * 
	 * @param depts
	 * @return
	 */
	public int addDept(Dept depts) {
		try {
			if (this.getAllDeptid().contains(depts.getDept().getId())) {
				deptDao.save1(depts);
				if (commonServ.getRoleDeptList().size() > 0) {
					deptDao.saveRoleDept(BasicUtil.getUsers().getRole().getId(), depts.getId());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return depts.getId();
	}

	/**
	 * updateDept
	 * 
	 * @param depts
	 * @return
	 */
	public boolean updateDeptName(Dept depts) {
		boolean flag = false;
		try {
			if (this.getAllDeptid().contains(depts.getId())) {
				depts.setStatus(1);
				deptDao.updateDept(depts);
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * delDept
	 * 
	 * @param d
	 * @return
	 */
	public boolean deleteDept(int dept_id) {
		boolean flag = false;
		try {
			if (this.getAllDeptid().contains(dept_id)) {
				deptDao.deleteDept(dept_id);
				Dept dept = deptDao.getById(dept_id);
				if (dept.getChildren().size() > 0) {
					for (Dept dept2 : dept.getChildren()) {
						deptDao.deleteDept(dept2.getId());
						deleteDept(dept2.getId());// 循环撤销子节点
					}
				}
				if (dept.getUsers().size() > 0) {
					for (Users users : dept.getUsers()) {
						usersDao.delUser(users.getId());
					}
				}
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * moveDept
	 * 
	 * @param d
	 * @param pid
	 * @return
	 */
	public boolean moveDept(int d, int pid) {
		deptDao.moveDept(d, pid);
		return true;
	}

	/**
	 * 获得当前用户管理范围的用户数
	 * 
	 * @param dept_id
	 * @return
	 */
	public float getUserNum(int dept_id) {
		float num = 0;
		List<Integer> l = this.getAllDeptid();
		if (l.contains(dept_id)) {
			num = usersDao.getCount(new String[] { "dept_id" }, String.valueOf(dept_id));
		}
		return num;
	}

	/**
	 * 获得所有的用户
	 * 
	 * @param pageIndex
	 * @param count
	 * @return
	 */
	public List<Users> getAllUsers(int pageIndex, int count) {
		return usersDao.getByParmeterOnPage(pageIndex, count, new String[] { "dept.id" }, "id asc",
				String.valueOf(BasicUtil.getdept().getId()));
	}

	/**
	 * 根据dept_id获得用户
	 * 
	 * @param pageIndex
	 * @param count
	 * @param dept_id
	 * @return
	 */
	public List<Users> getUsersByDept(int pageIndex, int count, int dept_id) {
		List<Integer> l = this.getAllDeptid();
		List<Users> list = null;
		if (l.contains(dept_id)) {
			list = usersDao.getByParmeterOnPage(pageIndex, count, new String[] { "dept.id" }, "username asc",
					String.valueOf(dept_id));
		}
		return list;
	}

	/**
	 * 查看用户
	 * 
	 * @param user_id
	 * @return
	 */
	public Users getOneUser(int user_id) {
		Users users = usersDao.getById(user_id);
		return users;
	}

	/**
	 * 获得角色列表ID
	 * 
	 * @return
	 */
	public List<Integer> getAllRoleList() {
		List<Integer> list = new ArrayList<Integer>();
		for (Role role : roleDao.findAll()) {
			list.add(role.getId());
		}
		return list;
	}

	/**
	 * 获得父id为空的角色
	 * 
	 * @return
	 */
	public List<Role> getRoleRidNull() {
		List<Role> list = roleDao.getNullRole();
		return list;
	}

	// 为map设置
	public Map<String, Object> convertToMap(Role r) {
		Map<String, Object> map = new HashMap<String, Object>(0);
		map.put("id", r.getId());
		map.put("text", r.getName());
		return map;
	}

	@SuppressWarnings("unused")
	public boolean hasIdInRoleDeptList(Role item, List<Integer> roleList) {
		if (-1 != roleList.indexOf(item.getId()))
			return true;
		for (Role r : item.getRoles()) {
			if (hasIdInRoleDeptList(item, roleList))
				return true;
		}
		return false;
	}

	/**
	 * 修改用户
	 * 
	 * @param users
	 * @return
	 */
	public boolean updateUsers(Users users, String old_pass) {
		if ("".equals(users.getPassword())) {
			users.setPassword(old_pass);
		} else {
			users.setPassword(BasicUtil.md5(users.getPassword()));
		}
		usersDao.update1(users);
		return true;
	}

	/**
	 * 检验用户名
	 * 
	 * @param username
	 * @return
	 */
	public String checkName(String username, String oldName) {
		String s = "";
		if (username.equals(oldName)) {
			s = "ok";
		} else {
			List<Users> list = usersDao.getByParmeter(new String[] { "username" }, "id", username);
			if (list.size() < 1) {
				s = "ok";
			}
		}
		return s;
	}

	/**
	 * 检验身份证号
	 * 
	 * @param id_card
	 * @return
	 */
	public String checkIdCard(String id_card, String oidIDCard) {
		String s = "";
		if (id_card.equals(oidIDCard)) {
			s = "ok";
		} else {
			List<Users> list = usersDao.getByParmeter(new String[] { "id_card" }, "id", id_card);
			if (list.size() < 1) {
				s = "ok";
			}
		}
		return s;
	}

	/**
	 * 删除用户
	 * 
	 * @param user_id
	 * @return
	 */
	public String delUsers(int user_id) {
		usersDao.delete(user_id);
		return "ok";
	}

	/**
	 * 添加用户
	 * 
	 * @param users
	 * @return
	 */
	public boolean addUsers(Users users) {
		users.setCreat_time(BasicUtil.getCurrentTime());
		users.setPassword(BasicUtil.md5(users.getPassword()));
		usersDao.save(users);
		return true;
	}

	// =================角色管理==================================
	/**
	 * 根据role_id获得角色的基本信息
	 * 
	 * @param role_id
	 * @return
	 */
	public Role getRoleMessage(int role_id) {
		return roleDao.getById(role_id);
	}

	/**
	 * 添加角色
	 * 
	 * @param role
	 * @return
	 */
	public int addRoleDo(Role role) {
		role.setCreate_time(BasicUtil.getCurrentTime());
		role.setStatus(1);
		int x = roleDao.save1(role).getId();
		return x;
	}

	/**
	 * 获得父角色的权限（菜单id）
	 * 
	 * @param role
	 * @return
	 */
	private List<Integer> getRoleMenus(Role role) {
		List<?> list = roleDao.getRoleMenus(role.getRole().getId());
		List<Integer> integers = new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			integers.add((Integer) list.get(i));
		}
		return integers;
	}

	/**
	 * updateRole
	 * 
	 * @param role
	 * @return
	 */
	public boolean updateRole(Role role) {
		roleDao.updateRoleMess(role);
		return true;
	}

	/**
	 * 删除
	 * 
	 * @param role_id
	 * @return
	 */
	public boolean delRoleDo(int role_id) {
		Role r = roleDao.getById(role_id);
		r.setStatus(0);
		return true;
	}

	// 获得当前角色所拥有权限
	public String getRoleMenus(int role_id) {
		String roleMenus = "";
		Role role = getRoleMessage(role_id);
		if (role != null) {
			if (role.getMenus().size() > 0) {
				for (Menus menus : role.getMenus()) {
					roleMenus += menus.getId() + ",";
				}
			}
		}
		if (!roleMenus.equals("")) {
			roleMenus = roleMenus.substring(0, roleMenus.length() - 1);
		}
		// System.out.println(roleMenus);
		return roleMenus;
	}

	// 获得所有菜单
	public List<Menus> getMenusList() {
		return menusDao.findAll(new String[] { " parentId asc ", " sort ASC " });
	}

	/**
	 * 用于管理范围的设置
	 * 
	 * @param dept
	 * @return
	 */
	public Map<String, Object> convertToMapForScope(Dept dept, int role_id) {
		Map<String, Object> map = new HashMap<String, Object>(0);
		map.put("id", dept.getId());
		map.put("text", dept.getDept_name());
		if (roleDao.getRoleDeptList(role_id).contains(dept.getId())) {
			map.put("checked", true);
		}
		return map;
	}

	// 权限编辑do
	public String editRoleMenu(int role_id, String[] permission, String manageScope) {
		roleDao.deleteRole(role_id);
		for (String string : permission) {
			roleDao.editRoleMenu(role_id, Integer.parseInt(string));
		}
		roleDao.deleteRoleDept(role_id);
		if (manageScope.length() > 0) {
			String[] deptsMess = manageScope.split(",");
			for (String string : deptsMess) {
				roleDao.editRoleDept(role_id, Integer.parseInt(string));
			}
		}
		return "ok";
	}

	// =====================属性管理=======================
	public int getPro(String p_name) {
		return propertyDao.findAll(new String[] { "p_name", "type", "status" }, "p_name asc", p_name, "1", "1").size();
	}

	public List<Property> getPro1(String p_name) {
		return propertyDao.findAll(new String[] { "p_name", "type", "status" }, "p_name asc", p_name, "1", "1");
	}

	/**
	 * 获取所有有用的属性 @Title: getPro @Description:
	 * TODO(这里用一句话描述这个方法的作用) @param @return 参数说明 @return List<Property>
	 * 返回类型 @throws
	 */
	public List<Property> getPro() {
		return propertyDao.findAll(new String[] { "type", "status" }, "p_name asc", "1", "1");
	}

	public List<Property> getAllPro() {
		return propertyDao.findAll();
	}

	public List<Property> getPro(int pageindex, int num, String p_name) {
		return propertyDao.getByParmeterOnPage(pageindex, num, new String[] { "p_name", "type", "status" },
				"p_name asc", p_name, "1", "1");
	}

	public Property getPro(int pro_id) {
		return propertyDao.getById(pro_id);
	}

	public List<String> getProName() {
		return propertyDao.getPname();
	}

	public boolean uPro(int id, Property property) {
		Property p = propertyDao.getById(id);
		p.setContent(property.getContent());
		return true;
	}

	public boolean delPro(int pro_id) {
		propertyDao.delete(pro_id);
		return true;
	}

	public boolean addPro(Property property) {
		property.setStatus("1");
		property.setType(1);
		propertyDao.save(property);
		return true;
	}

	// =================系统设置================================
	public SystemInfo getSysInfo() {
		SystemInfo si = new SystemInfo();
		Properties properties = System.getProperties();
		si.setOsname(properties.getProperty("os.name") + "  版本" + properties.getProperty("os.version"));
		si.setHostIP(ServletActionContext.getRequest().getRemoteAddr());
		si.setAppDir(ServletActionContext.getServletContext().getRealPath("/"));
		try {
			si.setSerIP(InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return si;
	}

	// ========================设置上报人数========================
	// 获取历年数据
	public List<Dept> getNumDepts() {
		return deptDao.getNumDepts(ArrayUtil.getIngeter(this.getAllDeptid()));
	}

	// 获取所有年份
	public List<String> getYears() {
		return personnumDao.getYears();
	}

	// 设置人员
	public boolean SetPersonNum(String time, List<PersonNum> personnums) {
		personnumDao.DeletePersonNum(time);
		for (PersonNum pn : personnums) {
			pn.setYear(time);
			personnumDao.save(pn);
		}
		return true;
	}

	public PersonNum getPersonNum(int deptid, String year) {
		List<PersonNum> pn = personnumDao.getByParmeter(new String[] { "year", "dept.id" }, " id asc ", year,
				String.valueOf(deptid));
		if (pn.isEmpty()) {
			PersonNum p = new PersonNum();
			p.setNum(0);
			p.setNum2(0);
			return p;
		} else {
			return pn.get(0);
		}
	}

	// -====================================必填项设置===========================
	// 获取必填项数据
	public List<Required> getRequired() {
		return requiredDao.findAll(new String[] { "sort asc" });
	}

	// 获取一对一的字段数据
	public List<Required> getOneRequired() {
		return requiredDao.findAll(new String[] { "oneormany" }, " sort asc ", "1");
	}

	// 根据id获取list
	public List<Required> getRequiredList(Integer[] ids) {
		return requiredDao.getByIds(ids);
	}

	// 修改必填项
	public boolean SetRequired(Integer[] ids) {
		requiredDao.ClearReauire();
		requiredDao.SetRequired(ids);
		return true;
	}

	/**
	 * 获取必填项id字符串 @Title: getRequiredStr @Description:
	 * TODO(这里用一句话描述这个方法的作用) @param @return 参数说明 @return String
	 * 
	 * 返回值：,1,2,3…… 前台判断如判断id为1则判断包含“,1,”的字符串。 目的是为了避免里面有12，而1和2都成了必填项。
	 * 
	 * @throws
	 */
	public String getRequiredStr() {
		String str = ",";
		List<Required> l = requiredDao.findAll(new String[] { "r" }, " id asc ", "1");
		for (Required r : l) {
			str += r.getId() + ",";
		}
		return str;
	}
}
