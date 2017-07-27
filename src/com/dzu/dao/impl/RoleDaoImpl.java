package com.dzu.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.RoleDao;
import com.dzu.model.Role;


/**
 * @ClassName: RoleDaoImpl 
 * @Description: 角色数据库操作实现类
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:07:10
 *
 */
@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> getNullRole() {
		Session session = getSession();
		Query query = session
				.createQuery("from Role as role where rid is null");
		return query.list();
	}

	@Override
	public void insertRoleMenus(int id, Integer integer) {
		Session session = getSession();
		SQLQuery query = session
				.createSQLQuery("insert into role_menu(role_id,menu_id) values(?,?)");
		query.setInteger(0, id);
		query.setInteger(1, integer);
		query.executeUpdate();
	}

	@Override
	public List<?> getRoleMenus(int id) {
		Session session = getSession();
		SQLQuery query = session
				.createSQLQuery("select menu_id from role_menu where role_id=?");
		query.setInteger(0, id);
		return query.list();
	}

	@Override
	public void updateRoleMess(Role role) {
		Session session = getSession();
		SQLQuery query = session
				.createSQLQuery("update role set name=?,sort=?,remark=? where id=?");
		query.setString(0, role.getName());
		query.setInteger(1, role.getSort());
		query.setString(2, role.getRemark());
		query.setInteger(3, role.getId());
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getRoleDeptList(int role_id) {
		Session session = getSession();
		SQLQuery query = session
				.createSQLQuery("select dept_id from role_dept where role_id=?");
		query.setInteger(0, role_id);
		return query.list();
	}

	@Override
	public void deleteRole(int role_id) {
		Session session = getSession();
		SQLQuery sqlQuery = session
				.createSQLQuery("delete from role_menu where role_id=?");
		sqlQuery.setInteger(0, role_id);
		sqlQuery.executeUpdate();
	}

	@Override
	public void editRoleMenu(int role_id, int parseInt) {
		Session session = getSession();
		SQLQuery sqlQuery = session
				.createSQLQuery("insert into role_menu(role_id,menu_id) values(?,?)");
		sqlQuery.setInteger(0, role_id);
		sqlQuery.setInteger(1, parseInt);
		sqlQuery.executeUpdate();

	}

	@Override
	public void deleteRoleDept(int role_id) {
		Session session = getSession();
		SQLQuery sqlQuery = session
				.createSQLQuery("delete from role_dept where role_id=?");
		sqlQuery.setInteger(0, role_id);
		sqlQuery.executeUpdate();
	}

	@Override
	public void editRoleDept(int role_id, int parseInt) {
		Session session = getSession();
		SQLQuery sqlQuery = session
				.createSQLQuery("insert into role_dept(role_id,dept_id) values(?,?)");
		sqlQuery.setInteger(0, role_id);
		sqlQuery.setInteger(1, parseInt);
		sqlQuery.executeUpdate();
	}

}
