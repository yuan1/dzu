package com.dzu.commonDao;

import java.util.List;

/** 
 * @Title: BaseDao.java 
 * @Package com.dzu.commonDao 
 * @Description: 基础数据库操作接口
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:45:08 
 * @version V1.0 
 */
public interface BaseDao<T> {

	/**
	 * 查询总记录数
	 */
	Long getCount();
	Long getCount(String[] colums,String...parmeters);
	/**
	 * 保存实体
	 * 
	 * @param entity
	 */
	void save(T entity);
	
	T save1(T entity);

	/**
	 * 删除实体
	 * 
	 * @param id
	 */
	void delete(int id);

	/**
	 * 更新实体
	 * 
	 * @param entity
	 */
	void update(T entity);
	
	void update1(T entity);

	/**
	 * 按id查询
	 * 
	 * @param id
	 * @return
	 */
	T getById(int id);
	
	T getById1(int id);

	/**
	 * 按id查询
	 * 
	 * @param ids
	 * @return
	 */
	List<T> getByIds(Integer[] ids);

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	List<T> findAll();
	List<T> findAll(String[] orderColum);
	List<T> findAll(String[] colums,String orderColum,String ...parmeters);
	List<T> findAllName(String[] colums,String orderColum,String ...parmeters);
	/**
	  * 多条件查询
	  * @return
	  */
	List<T> getByParmeter(String[] colums,String orderColum,String ...parmeters);
	
	/**
	 * 多条件模糊查询
	 * @param colums
	 * @param orderColum
	 * @param parmeters
	 * @return
	 */
	List<T> getByParmeter1(String[] colums,String orderColum,String ...parmeters);
	/**
	 * 分页条件查询
	 * @param pageIndex 第几个开始查
	 * @param count 数量
	 * @param colums
	 * @param orderColum
	 * @param parmeters
	 * @return
	 */
	List<T> getByParmeterOnPage(int pageIndex,int count,String[] colums,String orderColum,String ...parmeters);
	
	/**
	 * 模糊分页查询
	 * @param pageIndex
	 * @param count
	 * @param colums
	 * @param orderColum
	 * @param parmeters
	 * @return
	 */
	List<T> getByParmeterOnPage1(int pageIndex,int count,String[] colums,String orderColum,String ...parmeters);
	/**
	 * 分页全部查询
	 * @param pageIndex
	 * @param count
	 * @return
	 */
	List<T> getAllOnPage(int pageIndex,int count);
	

}

