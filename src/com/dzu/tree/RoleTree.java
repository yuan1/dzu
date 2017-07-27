package com.dzu.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSON;
import com.dzu.model.Dept;
import com.dzu.model.Role;
import com.dzu.service.SymServ;

/**
 * 角色树
 * @ClassName: DeptTree 
 * @Description: TODO 构建角色树，搭配Ztree
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月19日 下午7:15:50
 *
 */
public class RoleTree {

	/**
	 * 获取json数据。关于自己管辖范围内的角色树
	 * @Title: getJSON 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param d
	 * @param @param url
	 * @param @param alldept
	 * @param @return 参数说明
	 * @return String 返回类型
	 * @throws
	 */
	public String getJSON(Role r,String url){
		List<Map<String,Object>> lm=new ArrayList<Map<String,Object>>();
		Map<String,Object> m=new HashMap<String, Object>();
		try{
			m.put("id",r.getId());
			if(r.getRole()!=null)
				m.put("pId",r.getRole().getId());
			m.put("name",r.getName());
			if(url.length()>0)
				m.put("url",url+r.getId());
			m.put("open",true);
			m.put("children",getChildren(r,url));
			m.put("iconOpen","ztree/css/zTreeStyle/img/diy/1_open.png");
			m.put("iconClose","ztree/css/zTreeStyle/img/diy/1_open.png");
			m.put("icon","ztree/css/zTreeStyle/img/diy/1_open.png");
			lm.add(m);
		}catch(Exception e){e.printStackTrace();}
		return JSON.toJSONString(lm);
	}
	
	/**
	 * 获取角色树需要的递归循环
	 * @Title: getChildren 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param d
	 * @param @param url
	 * @param @param alldept
	 * @param @return 参数说明
	 * @return List<Map<String,Object>> 返回类型
	 * @throws
	 */
	private List<Map<String,Object>> getChildren(Role r,String url){
		List<Map<String,Object>> lm=new ArrayList<Map<String,Object>>();
		try{
		Set<Role> ld=r.getRoles();
		for(Role role:ld){
			if(role.getStatus()==1){
				Map<String,Object> m=new HashMap<String, Object>();
				m.put("id",role.getId());
				m.put("pId",role.getRole().getId());
				m.put("name",role.getName());
				if(url.length()>0)
					m.put("url",url+role.getId());
				m.put("children",getChildren(role,url));
				m.put("open",true);
				m.put("iconOpen","ztree/css/zTreeStyle/img/diy/1_open.png");
				m.put("iconClose","ztree/css/zTreeStyle/img/diy/1_open.png");
				m.put("icon","ztree/css/zTreeStyle/img/diy/1_open.png");
				lm.add(m);
			}
		}
		}catch(Exception e){e.printStackTrace();}
		return lm;
	}
}
