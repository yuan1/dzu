package com.dzu.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.DeptDao;
import com.dzu.model.Dept;

/**
 * @ClassName: DeptDaoImpl 
 * @Description: 组织结构数据库操作实现类
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午1:04:02
 *
 */
@Repository
public class DeptDaoImpl extends BaseDaoImpl<Dept> implements DeptDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Dept> getNullDepts() {
		Session session = getSession();
		Query query = session
				.createQuery("from Dept as dept where pid is null");
		return query.list();
	}

	@Override
	public void saveRoleDept(int role_id, int dept_id) {
		Session session = getSession();
		SQLQuery query = session
				.createSQLQuery("insert into role_dept (role_id,dept_id) values(?,?)");
		query.setInteger(0, role_id);
		query.setInteger(1, dept_id);
		query.executeUpdate();
	}

	@Override
	public void updateDept(Dept dept) {
		Session session = getSession();
		SQLQuery query = session
				.createSQLQuery("update dept set dept_name=?,sort=?,d_phone=?,duty_person=?,remark=?,d_address=?,isshownum=? where id=?");
		query.setString(0, dept.getDept_name());
		query.setInteger(1, dept.getSort());
		query.setString(2, dept.getD_phone());
		query.setString(3, dept.getDuty_person());
		query.setString(4, dept.getRemark());
		query.setString(5, dept.getD_address());
		query.setLong(6, dept.getIsshownum());
		query.setInteger(7, dept.getId());
		query.executeUpdate();
	}

	@Override
	public void deleteDept(int dept_id) {
		System.out.println(dept_id);
		Session session = getSession();
		Query query = session
				.createQuery("update Dept as dept set status=0 where id=?");
		query.setInteger(0, dept_id);
		query.executeUpdate();
	}

	@Override
	public void moveDept(int d, int pid) {
		Session session = getSession();
		Query query = session
				.createQuery("update Dept as dept set pid=? where id=?");
		query.setInteger(0, pid);
		query.setInteger(1, d);
		query.executeUpdate();		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Dept> getDeptsByIds(Integer[] ids) {
		return getSession().createQuery(//
				"FROM Dept WHERE status=1 and id IN (:ids)")//
				.setParameterList("ids", ids)//
				.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Dept> getNumDepts(Integer[] ids) {
		return getSession().createQuery(//
				"FROM Dept WHERE status=1 and isshownum=1 and id IN (:ids)")//
				.setParameterList("ids", ids)//
				.list();
	}

}
