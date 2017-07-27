package com.dzu.dao;

import java.util.List;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Role;

/** 
 * @Title: RoleDao.java 
 * @Package com.dzu.util 
 * @Description: 角色数据库操作接口
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:59:50 
 * @version V1.0 
 */
public interface RoleDao extends BaseDao<Role>{

	List<Role> getNullRole();

	void insertRoleMenus(int id, Integer integer);

	List<?> getRoleMenus(int id);

	void updateRoleMess(Role role);

	List<Integer> getRoleDeptList(int role_id);

	void deleteRole(int role_id);

	void editRoleMenu(int role_id, int parseInt);

	void deleteRoleDept(int role_id);

	void editRoleDept(int role_id, int parseInt);

}
