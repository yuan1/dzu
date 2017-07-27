package com.dzu.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSON;
import com.dzu.model.Dept;
import com.dzu.service.SymServ;

/**
 * 部门树
 * @ClassName: DeptTree 
 * @Description: TODO 构建部门树，搭配Ztree
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月19日 下午7:15:50
 * 
 * 修改于2016-06-25
 * 
 * 取消了遍历。读取速度更快。
 *
 */
public class DeptTree {

	/**
	 * 获取json数据。关于自己管辖范围内的组织机构树
	 * @Title: getJSON 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param d
	 * @param @param url
	 * @param @param alldept
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String getJSON(String url,List<Dept> alldept){
		List<Map<String,Object>> lm=new ArrayList<Map<String,Object>>();
		for(Dept d:alldept){
			Map<String,Object> m=new HashMap<String, Object>();
			m.put("id",d.getId());
			if(d.getDept()!=null)
				m.put("pId",d.getDept().getId());
			else{
				m.put("pId",0);
			}
			m.put("name",d.getDept_name());
			if(url.length()>0)
				m.put("url",url+d.getId());
			m.put("open",true);
			//m.put("children",getChildren(d,url,alldept));
			m.put("iconOpen","ztree/css/zTreeStyle/img/diy/1_open.png");
			m.put("iconClose","ztree/css/zTreeStyle/img/diy/1_open.png");
			m.put("icon","ztree/css/zTreeStyle/img/diy/1_open.png");
			lm.add(m);
		}
		return JSON.toJSONString(lm);
	}
	
	public String getJSON1(List<Dept> alldept,List<Dept> dept){
		List<Map<String,Object>> lm=new ArrayList<Map<String,Object>>();
		for(Dept d:alldept){
			Map<String,Object> m=new HashMap<String, Object>();
			m.put("id",d.getId());
			if(d.getDept()!=null)
				m.put("pId",d.getDept().getId());
			else{
				m.put("pId",0);
			}
			m.put("name",d.getDept_name());
			m.put("open",true);
			if(dept.contains(d))
				m.put("checked", true);
			//m.put("children",getChildren(d,url,alldept));
			m.put("iconOpen","ztree/css/zTreeStyle/img/diy/1_open.png");
			m.put("iconClose","ztree/css/zTreeStyle/img/diy/1_open.png");
			m.put("icon","ztree/css/zTreeStyle/img/diy/1_open.png");
			lm.add(m);
		}
		return JSON.toJSONString(lm);
	}
	
	/**
	 * 获取组织机构树需要的递归循环
	 * @Title: getChildren 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param d
	 * @param @param url
	 * @param @param alldept
	 * @param @return 参数说明
	 * @return List<Map<String,Object>> 返回类型
	 * @throws
	 */
	/*private List<Map<String,Object>> getChildren(Dept d,String url,List<Integer> alldept){
		List<Map<String,Object>> lm=new ArrayList<Map<String,Object>>();
		Set<Dept> ld=d.getChildren();
		for(Dept dept:ld){
			if(dept.getStatus()==1&&alldept.contains(dept.getId())){
				Map<String,Object> m=new HashMap<String, Object>();
				m.put("id",dept.getId());
				m.put("pId",dept.getDept().getId());
				m.put("name",dept.getDept_name());
				if(url.length()>0)
					m.put("url",url+dept.getId());
				m.put("children",getChildren(dept,url,alldept));
				m.put("open",true);
				m.put("iconOpen","ztree/css/zTreeStyle/img/diy/1_open.png");
				m.put("iconClose","ztree/css/zTreeStyle/img/diy/1_open.png");
				m.put("icon","ztree/css/zTreeStyle/img/diy/1_open.png");
				lm.add(m);
			}
		}
		return lm;
	}*/
	
	/**
	 * 获取json数据。关于自己管辖范围内的组织机构树
	 * @Title: getAllJSON 
	 * @Description: 这个区别于上一个是这个是所有的，上一个是管辖范围内的
	 * @param @param d
	 * @param @param alldept
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String getAllJSON(List<Dept> alldept,Set<Dept> dept){
		List<Map<String,Object>> lm=new ArrayList<Map<String,Object>>();
		for(Dept d:alldept){
			Map<String,Object> m=new HashMap<String, Object>();
			m.put("id",d.getId());
			if(d.getDept()!=null)
				m.put("pId",d.getDept().getId());
			else{
				m.put("pId",0);
			}
			m.put("name",d.getDept_name());
			m.put("open",true);
			//m.put("children",getAllChildren(d,alldept));
			if(dept.contains(d))
				m.put("checked", true);
			m.put("iconOpen","ztree/css/zTreeStyle/img/diy/1_open.png");
			m.put("iconClose","ztree/css/zTreeStyle/img/diy/1_open.png");
			m.put("icon","ztree/css/zTreeStyle/img/diy/1_open.png");
			lm.add(m);
		}
		return JSON.toJSONString(lm);
	}
	
	/**
	 * 获取组织机构树需要的递归循环
	 * @Title: getChildren 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param d
	 * @param @param url
	 * @param @param alldept
	 * @param @return 参数说明
	 * @return List<Map<String,Object>> 返回类型
	 * @throws
	 */
	/*private List<Map<String,Object>> getAllChildren(Dept d,Set<Dept> alldept){
		List<Map<String,Object>> lm=new ArrayList<Map<String,Object>>();
		Set<Dept> ld=d.getChildren();
		for(Dept dept:ld){
				Map<String,Object> m=new HashMap<String, Object>();
				m.put("id",dept.getId());
				m.put("pId",dept.getDept().getId());
				m.put("name",dept.getDept_name());
				m.put("children",getAllChildren(dept,alldept));
				m.put("open",true);
				if(alldept.contains(dept))
					m.put("checked", true);
				m.put("iconOpen","ztree/css/zTreeStyle/img/diy/1_open.png");
				m.put("iconClose","ztree/css/zTreeStyle/img/diy/1_open.png");
				m.put("icon","ztree/css/zTreeStyle/img/diy/1_open.png");
				lm.add(m);
		}
		return lm;
	}*/
}
