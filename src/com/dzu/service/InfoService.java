package com.dzu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dzu.dao.CongressDao;
import com.dzu.dao.PersonDao;
import com.dzu.dao.PoliticalDao;
import com.dzu.model.Congress;
import com.dzu.model.Person;

@Service
public class InfoService {

	@Resource
	private PersonDao personDao;
	@Resource
	private PoliticalDao politicalDao;
	@Resource
	private CongressDao congressDao;
	
	/**
	 * 获取政协委员
	 * @Title: getPersonsIdOfZXWY 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param year
	 * @param @param zzjb
	 * @param @param apzw
	 * @param @param apjb
	 * @param @return 参数说明
	 * @return Integer[] 返回类型
	 * @throws
	 */
	public Integer[] getPersonsIdOfZXWY(String year,int zzjb,int apzw,int apjb){
		Integer[] i=politicalDao.getPoliticalIds(year, zzjb, apzw, apjb);
		if(i.length==0){
			i=new Integer[]{0};
		}
		return i;
	}
	
	public Integer[] getPersonIdsOfRDDB(String year,int zzjb,int apzw){
		Integer[] i=congressDao.getCongressIds(year, zzjb, apzw);
		if(i.length==0){
			i=new Integer[]{0};
		}
		return i;
	}
	
	/**
	 * 获取党外干部
	 * @Title: getPersonIdOfDWGB 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param year
	 * @param @return 参数说明
	 * @return Integer[] 返回类型
	 * @throws
	 */
	public Integer[] getPersonIdOfDWGB(String year){
		Integer[] i=personDao.getdwgbIds(year);
		if(i.length==0){
			i=new Integer[]{0};
		}
		return i;
	}
	
	//==========================以下是三个基本查询/可以全局套用================//
	public List<Person> getPerson(Integer[] ids,String year,int dw,int type,Integer[] pids){
		return personDao.getPerson(ids,year,dw,type,pids);
	}
	
	public int getCountPerson(Integer[] ids,String year,int dw,int type,Integer[] pids){
		return personDao.getConuntsOfPerson(ids, year, dw, type,pids);
	}
	
	public List<Person> getPersonOnpage(int pageindex,int count,Integer[] ids,String year,int dw,int type,Integer[] pids){
		return personDao.getPersonOnpage(pageindex,count,ids,year,dw,type,pids);
	}
	
	/**
	 * 获取所有有效查询年份
	 * @return
	 */
	public List<String> getAllYears(){
		return personDao.getAllYears();
	}
	
	/**
	 * 根据id获取人员信息
	 * @Title: getPerson 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param id
	 * @param @return 参数说明
	 * @return Person 返回类型
	 * @throws
	 */
	public Person getPerson(Integer id){
		return personDao.getById(id);
	}
}
