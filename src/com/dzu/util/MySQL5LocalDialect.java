package com.dzu.util;
import org.hibernate.Hibernate;   
import org.hibernate.dialect.MySQL5Dialect;   
import org.hibernate.dialect.function.SQLFunctionTemplate ;   

/**
 * 重写数据库方言，使其可以按照拼音排序。
 * 需要在数据库方言配置到此文件
 * @ClassName: MySQL5LocalDialect 
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月26日 下午12:07:56
 *
 */
public class MySQL5LocalDialect extends MySQL5Dialect {   
	@SuppressWarnings("deprecation")
	public MySQL5LocalDialect(){  
	super();    
		registerFunction("convert", new SQLFunctionTemplate(Hibernate.STRING, "convert(?1 using 'gbk')") ); 
			//Hibernate.STRING在Hibernate3.6.5.Final版本以下可以使用，
			//因为在Hibernate4.0及以上的版本中，Hibernate.STRING已经不再使用了 
		    //可以使用
		    //registerFunction("convert", new SQLFunctionTemplate(new StringType(), "convert(?1 using ?2)") ); 代替    
	}  
}  