package com.dzu.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 数组处理公共类
 * @ClassName: ArrayUtil 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 德州学院 惠晓东-李明元
 * @date 2016年7月23日 下午4:41:20
 *
 */
public class ArrayUtil {
	
	/**
	 * 多个Integer[]取交集。用于综合查询
	 * @Title: getPids 
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param @param l
	 * @param @return 参数说明
	 * @return Integer[] 返回类型
	 * @throws
	 */
	public static Integer[] getPids(Integer[]... l){
		Integer[] i=null;
		List<Integer> list=new ArrayList<Integer>();
		for(Integer[] i1:l){
			for(Integer x:i1){
				if(!list.contains(x)){
					list.add(x);
				}
			}
			if(i1==null||i1.length==0){
				return null;
			}
		}
		Map<Integer,Integer> map=new HashMap<Integer,Integer>();
		for(Integer i1:list){
			int num=0;
			for(Integer[] i2:l){
				for(Integer x:i2){
					if(x==i1){
						num++;
					}
				}
			}
			map.put(i1,num);
		}
		List<Integer> li=new ArrayList<Integer>();
		for (Entry<Integer, Integer> entry : map.entrySet()) {
			if(entry.getValue()==l.length){
				li.add(entry.getKey());
			}
		}
		if(li.size()==0){
			li.add(0);
		}
		
		Integer[] x=new Integer[li.size()];
		for(int q=0;q<x.length;q++){
			x[q]=li.get(q);
		}
		return x;
	}
	
	public static Integer[] getIngeter(List<Integer> l){
		Integer[] i=new Integer[l.size()];
		for(int x=0;x<l.size();x++){
			i[x]=l.get(x);
		}
		return i;
	}
	
	public static Integer[] getInteger(String[] ids){
				Integer[] ids1=new Integer[ids.length];
				for(int i=0;i<ids.length;i++){
					ids1[i]=Integer.valueOf(ids[i]);
				}
				return ids1;
	}
}
