package com.dzu.dao;

import java.util.List;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Dept;

/** 
 * @Title: DeptDao.java 
 * @Package com.dzu.dao 
 * @Description: 组织机构数据库操作接口
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:57:10 
 * @version V1.0 
 */
public interface DeptDao extends BaseDao<Dept> {
	public List<Dept> getNullDepts();

	/**
	 * 添加组织时 若是当前角色具有管理范围需要在
	 * 
	 * role_dept表中添加新添的单位的管理权限
	 * 
	 * 
	 * @param role_id
	 * @param dept_id
	 * 
	 */
	public void saveRoleDept(int role_id, int dept_id);

	public void updateDept(Dept depts);

	public void deleteDept(int dept_id);

	public void moveDept(int d, int pid);
	
	public List<Dept> getDeptsByIds(Integer[] ids);
	
	public List<Dept> getNumDepts(Integer[] ids);
}


