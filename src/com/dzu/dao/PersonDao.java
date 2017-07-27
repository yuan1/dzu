package com.dzu.dao;

import java.util.List;

import com.dzu.commonDao.BaseDao;
import com.dzu.model.Person;

/**
 * person的数据接口
 * @ClassName: PersonDao 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月23日 下午10:44:12
 *
 */
public interface PersonDao extends BaseDao<Person>{

	/**
	 * 人员的综合查询
	 * @Title: getPerson 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param ids   人员id
	 * @param @param year  年份
	 * @param @param dw    列入队伍
	 * @param @param type  类型
	 * @param @param pids  部门id
	 * @param @return 参数说明
	 * @return List<Person> 返回类型
	 * @throws
	 */
	public List<Person> getPerson(Integer[] ids,String year,int dw,int type,Integer[] pids);
	
	public int getConuntsOfPerson(Integer[] ids,String year,int dw,int type,Integer[] pids);
	
	public List<Person> getPersonOnpage(int pageindex,int count,Integer[] ids,String year,int dw,int type,Integer[] pids);
	
//	/**
//	 * 按条件查找政协委员情况
//	 * @Title: getPersonOfZXWY 
//	 * @Description: TODO(这里用一句话描述这个方法的作用)
//	 * @param @param ids
//	 * @param @param year
//	 * @param @param zzjb
//	 * @param @param apzw
//	 * @param @param apjb
//	 * @param @return 参数说明
//	 * @return List<Person> 返回类型
//	 * @throws
//	 */
//	public List<Person> getPersonOfZXWY(Integer[] ids,String year,int zzjb,int apzw,int apjb,int type);
//	
//	public int getCountOfPersonOfZXWY(Integer[] ids,String year,int zzjb,int apzw,int apjb,int type);
//	
//	public List<Person> getPersonOfZXWYOnpage(int pageindex,int count,Integer[] ids,String year,int zzjb,int apzw,int apjb,int type);
	
//	/**
//	 * 按条件查找人大代表情况
//	 * @Title: getPersonOfZXWY 
//	 * @Description: TODO(这里用一句话描述这个方法的作用)
//	 * @param @param ids
//	 * @param @param year
//	 * @param @param zzjb
//	 * @param @param apzw
//	 * @param @param apjb
//	 * @param @param type
//	 * @param @return 参数说明
//	 * @return List<Person> 返回类型
//	 * @throws
//	 */
//	public List<Person> getPersonOfRddb(Integer[] ids,String year,int zzjb,int apzw,int apjb,int type);
//	
//	public int getCountOfPersonOfRddb(Integer[] ids,String year,int zzjb,int apzw,int apjb,int type);
//	
//	public List<Person> getPersonOfRddbOnpage(int pageindex,int count,Integer[] ids,String year,int zzjb,int apzw,int apjb,int type);
	
	List<String> getAllYears();
	
	/**
	 * 上报和取消上报（删除）
	 * 上报之后删除是将其改为状态改为未上报。不能真正将其删除。
	 * @Title: UpdatePersonType 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param ids
	 * @param @param type
	 * @param @return 参数说明
	 * @return boolean 返回类型
	 * @throws
	 */
	public boolean UpdatePersonType(Integer[] ids,int type);
	
	Integer[] getdwgbIds(String year);

	public Integer[] getPersonBySearch(List<String> search);

}
