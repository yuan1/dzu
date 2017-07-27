package com.dzu.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.dzu.commonDao.BaseDaoImpl;
import com.dzu.dao.PersonDao;
import com.dzu.model.Person;

@Repository
public class PersonDaoImpl extends BaseDaoImpl<Person> implements PersonDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> getPerson(Integer[] ids,String year,int dw,int type,Integer[] pids) {
		String hql="from Person where year=?";
		if(dw!=0){
			hql+=" and lrdw="+dw;
		}
		if(type!=0){
			hql+=" and type="+type;
		}
		if(pids!=null&&pids.length>0){
			hql+=" and id in (:pids) ";
		}
		if(ids!=null&&ids.length>0){
			hql+=" and dept.id in (:ids) ";
		}
		hql+=" order by convert(dept.dept_name)asc,convert(xm) asc ";
		Query q= getSession().createQuery(hql)
				.setString(0,year);
		if(pids!=null&&pids.length>0){
			q.setParameterList("pids",pids);
		}
		if(ids!=null&&ids.length>0){
			q.setParameterList("ids",ids);
		}
		return q.list();
	}

	@Override
	public List<String> getAllYears() {
		Session session = getSession();
		Query query = session
				.createQuery("select DISTINCT(year) from Person order by year desc");
		return query.list();
	}

	@Override
	public List<Person> getPersonOnpage(int pageindex, int count, Integer[] ids, String year, int dw, int type,
			Integer[] pids) {
		String hql="from Person where year=?";
		if(dw!=0){
			hql+=" and lrdw="+dw;
		}
		if(type!=0){
			hql+=" and type="+type;
		}
		if(pids!=null&&pids.length>0){
			hql+=" and id in (:pids) ";
		}if(ids!=null&&ids.length>0){
			hql+=" and dept.id in (:ids) ";
		}
		hql+=" order by convert(dept.dept_name)asc,convert(xm) asc ";
		Query q= getSession().createQuery(hql)
				.setFirstResult(pageindex*count)
				.setMaxResults(count)
				.setString(0,year);
		if(pids!=null&&pids.length>0){
			q.setParameterList("pids",pids);
		}
		if(ids!=null&&ids.length>0){
			q.setParameterList("ids",ids);
		}
		return q.list();
	}

	@Override
	public int getConuntsOfPerson(Integer[] ids, String year, int dw, int type,Integer[] pids) {
		String hql="select count(*) from Person where year=?";
		if(dw!=0){
			hql+=" and lrdw="+dw;
		}
		if(type!=0){
			hql+=" and type="+type;
		}
		if(pids!=null&&pids.length>0){
			hql+=" and id in (:pids) ";
		}
		if(ids!=null&&ids.length>0){
			hql+=" and dept.id in (:ids) ";
		}
		hql+=" order by convert(dept.dept_name)asc,convert(xm) asc ";
		Query q= getSession().createQuery(hql)
				.setString(0,year);
		if(pids!=null&&pids.length>0){
			q.setParameterList("pids",pids);
		}
		if(ids!=null&&ids.length>0){
			q.setParameterList("ids",ids);
		}
		return Integer.valueOf(q.uniqueResult().toString());
	}
//
//	@Override
//	public List<Person> getPersonOfZXWY(Integer[] ids, String year, int zzjb, int apzw, int apjb,int type) {
//		String hql="from Person where year=?";
//		if(zzjb!=0){
//			hql+=" and mqzgjzxapqk.zzjb="+zzjb;
//		}
//		if(apzw!=0){
//			hql+=" and mqzgjzxapqk.apzw="+apzw;
//		}
//		if(apjb!=0){
//			hql+=" and mqzgjzxapqk.apjb="+apjb;
//		}
//		if(type!=0){
//			hql+=" and type="+type;
//		}
//		hql+=" and dept.id in (:ids) and mqzgjzxapqk is not empty order by convert(dept.dept_name)asc,convert(xm) asc ";
//		Query q= getSession().createQuery(hql)
//				.setParameterList("ids",ids)
//				.setString(0,year);
//		return q.list();
//	}
//
//	@Override
//	public int getCountOfPersonOfZXWY(Integer[] ids, String year, int zzjb, int apzw, int apjb,int type) {
//		String hql="select count(*) from Person as p where year=?";
//		if(zzjb!=0){
//			hql+=" and mqzgjzxapqk.zzjb="+zzjb;
//		}
//		if(apzw!=0){
//			hql+=" and mqzgjzxapqk.apzw="+apzw;
//		}
//		if(apjb!=0){
//			hql+=" and mqzgjzxapqk.apjb="+apjb;
//		} 				
//		if(type!=0){
//			hql+=" and type="+type;
//		}
//		hql+=" and dept.id in (:ids) and p.mqzgjzxapqk is not empty order by convert(dept.dept_name)asc,convert(xm) asc ";
//		System.out.println(hql);
//		Query q= getSession().createQuery(hql)
//				.setParameterList("ids",ids)
//				.setString(0,year);
//		return Integer.valueOf(q.uniqueResult().toString());
//	}
//
//	@Override
//	public List<Person> getPersonOfZXWYOnpage(int pageindex, int count, Integer[] ids, String year, int zzjb, int apzw,
//			int apjb,int type) {
//		String hql="from Person as p where year=?";
//		if(zzjb!=0){
//			hql+=" and mqzgjzxapqk.zzjb="+zzjb;
//		}
//		if(apzw!=0){
//			hql+=" and mqzgjzxapqk.apzw="+apzw;
//		}
//		if(apjb!=0){
//			hql+=" and mqzgjzxapqk.apjb="+apjb;
//		}
//		if(type!=0){
//			hql+=" and type="+type;
//		}
//		hql+=" and dept.id in (:ids) and p.mqzgjzxapqk is not empty order by convert(dept.dept_name)asc,convert(xm) asc ";
//		Query q= getSession().createQuery(hql)
//				.setParameterList("ids",ids)
//				.setMaxResults(count)
//				.setFirstResult(count*pageindex)
//				.setString(0,year);
//		return q.list();
//	}

	@Override
	public boolean UpdatePersonType(Integer[] ids,int type) {
		getSession().createQuery("update Person set type=? where id in (:ids)")
				.setParameterList("ids",ids).setLong(0,type).executeUpdate();
		return true;
	}

	@Override
	public Integer[] getdwgbIds(String year) {
		String hql="SELECT DISTINCT(id) FROM Person where year=? and xrjb!='' and xrjb !=27";
		Session session =getSession();
		Query query = session
				.createQuery(hql);
		query.setString(0, year);
		List<Integer> l= query.list();
		Integer[] i=new Integer[l.size()];
		for(int x=0;x<i.length;x++){
			i[x]=l.get(x);
		}
		return i;
	}

	@Override
	public Integer[] getPersonBySearch(List<String> search) {
		String hql="SELECT DISTINCT(id) FROM Person where 1=1";
		if(!search.get(0).equals("")){
			hql+=" and xm='"+search.get(0)+"'";
		}
		if(!search.get(1).equals("")){
			hql+=" and xb='"+search.get(1)+"'";
		}
		if(!search.get(2).equals("")){
			hql+=" and mz='"+search.get(2)+"'";
		}
		if(!search.get(3).equals("")){
			hql+=" and csny>='"+search.get(3)+"'";
		}
		if(!search.get(4).equals("")){
			hql+=" and csny<='"+search.get(4)+"'";
		}
		if(!search.get(5).equals("")){
			hql+=" and sfzhm='"+search.get(5)+"'";
		}
		if(!search.get(6).equals("")){
			hql+=" and rylb='"+search.get(6)+"'";
		}
		if(!search.get(7).equals("")){
			hql+=" and lrdw='"+search.get(7)+"'";
		}
		if(!search.get(8).equals("")){
			hql+=" and xrjb='"+search.get(8)+"'";
		}
		Session session =getSession();
		Query query = session
				.createQuery(hql);
		List<Integer> l= query.list();
		Integer[] i=new Integer[l.size()];
		for(int x=0;x<i.length;x++){
			i[x]=l.get(x);
		}
		return i;
	}

}
