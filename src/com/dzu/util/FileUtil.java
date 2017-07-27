package com.dzu.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.dzu.model.Person;
import com.dzu.util.Tools;
import com.dzu.util.ZipCompressor;

/**
 * @ClassName: FileUtil
 * @Description: 文件上传工具
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月23日 下午10:50:56
 *
 */
public class FileUtil {
	private static final int BUFFER_SIZE = 16 * 1024;

	public static String createNewName(String oldFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		return sdf.format(Calendar.getInstance().getTime()) + (int) (Math.random() * 10000) + "."
				+ getExtensionName(oldFileName);

	}

	public static String getExtensionName(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length() - 1))) {
				return filename.substring(dot + 1);
			}
		}
		return filename;
	}

	public static String getFileNameNoEx(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length()))) {
				return filename.substring(0, dot);
			}
		}
		return filename;
	}

	public static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst), BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void zip(String url,String filename,List<Person> lp){
		
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		
		File uploadFile = new File(url+"export/linshi/"+dateString+"/");
		if (!uploadFile.exists()) {
			uploadFile.mkdirs();
		}
		File file = new File(url+"export/linshi/"+dateString+"/people.info");
		Writer writer;
		try {
			writer = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
			
			writer.write(JSON.toJSONString(lp));
			writer.close();
			// 写入文件完毕，people.info
			
			
			ZipCompressor zc = new ZipCompressor(url+"export/"+filename);
			
			File uploadFile1 = new File(url+"resources/images/defaultuser.png");
			File uploadFile2 = new File(url + "export/linshi/"+dateString+"/defaultuser.png");
			copy(uploadFile1,uploadFile2);
			
			String savePath = ServletActionContext.getRequest().getRealPath("");
			String proName=ServletActionContext.getRequest().getContextPath();
			savePath = savePath.substring(0, savePath.length()-proName.length());
			savePath = savePath + "/uploads/";
			for(Person p:lp){
				uploadFile1 = new File(savePath+p.getSczp());
				uploadFile2 = new File(url + "export/linshi/"+dateString+"/"+p.getSczp());
				copy(uploadFile1,uploadFile2);
			}
			
			zc.compress(url + "export/linshi/"+dateString+"/");
			
			// 删除临时文件
			File p = new File(url + "export/linshi/"+dateString+"/");
			Tools.deleteAllFilesOfDir(p);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public static List<Person> importinfo(String url){
		//获取日期字符串来命名
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(currentTime);
		
		//解压文件
		String zipFile=url;
		String savePath = ServletActionContext.getRequest().getRealPath("")+"/uploads/"+dateString+"/";
		try {
			ZipCompressor.unZipFiles(zipFile,savePath);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//读取json数据
		String strUserTemp = Tools.ReadTXT(savePath+"people.info", "UTF8");
		strUserTemp=strUserTemp.replaceAll("\"id\":0,","");
//		String strUserTemp="[{\"bgdh\":\"\",\"bz\":\"\",\"cjgzsj\":\"\",\"csny\":\"2015-07\",\"dedp\":\"\",\"dedpjrsj\":\"\",\"dept\":{\"id\":101,\"isshownum\":0,\"sort\":0,\"status\":0},\"dydp\":\"\",\"dydpjrsj\":\"\",\"dzxx\":\"\",\"fzdwjzw\":\"\",\"gj\":\"\",\"gzjl\":[],\"hjhsbzqk\":[],\"hwlxjl\":\"否\",\"hwlxjlgb\":\"\",\"jg\":\"\",\"jtcyjzyshgx\":[],\"jwnlcjpxqk\":[],\"lrdw\":1,\"mqzgjrdapqk\":[],\"mqzgjzxapqk\":[{\"apjb\":\"59\",\"apsj\":\"\",\"apzw\":\"55\",\"gjzxzzmc\":\"12312312\",\"jc\":\"213123\",\"person\":{\"$ref\":\"$[0]\"},\"year\":\"2016\",\"zzjb\":\"50\"}],\"mz\":\"汉族\",\"ndkhqk\":[],\"qqhm\":\"\",\"rtjsj\":\"\",\"rxzsj\":\"\",\"sczp\":\"nophoto.png\",\"sfzhm\":\"213123123123123\",\"shxjc\":\"\",\"sjhm\":\"\",\"txdz\":\"\",\"type\":2,\"wxhm\":\"\",\"xb\":\"男\",\"xlxx\":[],\"xm\":\"阿萨是拉萨\",\"xrjb\":\"\",\"xrqtshzw\":[],\"xrygbmqk\":[],\"xrzwqk\":[],\"year\":\"2016\",\"yzbm\":\"\",\"zcjb\":\"\",\"zhpjqk\":[],\"zjlb\":\"\",\"zycjhshyx\":\"\",\"zyjszc\":\"\",\"zyzzbx\":\"\"},{\"bgdh\":\"\",\"bz\":\"\",\"cjgzsj\":\"\",\"csny\":\"\",\"dedp\":\"\",\"dedpjrsj\":\"\",\"dept\":{\"id\":101,\"isshownum\":0,\"sort\":0,\"status\":0},\"dydp\":\"\",\"dydpjrsj\":\"\",\"dzxx\":\"\",\"fzdwjzw\":\"\",\"gj\":\"\",\"gzjl\":[],\"hjhsbzqk\":[],\"hwlxjl\":\"否\",\"hwlxjlgb\":\"\",\"jg\":\"\",\"jtcyjzyshgx\":[],\"jwnlcjpxqk\":[],\"lrdw\":1,\"mqzgjrdapqk\":[],\"mqzgjzxapqk\":[],\"mz\":\"汉族\",\"ndkhqk\":[],\"qqhm\":\"\",\"rtjsj\":\"\",\"rxzsj\":\"\",\"sczp\":\"nophoto.png\",\"sfzhm\":\"3333333333333333333333333333333\",\"shxjc\":\"\",\"sjhm\":\"\",\"txdz\":\"\",\"type\":2,\"wxhm\":\"\",\"xb\":\"男\",\"xlxx\":[],\"xm\":\"大帅1111\",\"xrjb\":\"\",\"xrqtshzw\":[],\"xrygbmqk\":[],\"xrzwqk\":[],\"year\":\"2016\",\"yzbm\":\"\",\"zcjb\":\"\",\"zhpjqk\":[],\"zjlb\":\"\",\"zycjhshyx\":\"\",\"zyjszc\":\"\",\"zyzzbx\":\"\"},{\"bgdh\":\"\",\"bz\":\"\",\"cjgzsj\":\"\",\"csny\":\"2016-05\",\"dedp\":\"\",\"dedpjrsj\":\"\",\"dept\":{\"id\":101,\"isshownum\":0,\"sort\":0,\"status\":0},\"dydp\":\"16\",\"dydpjrsj\":\"\",\"dzxx\":\"\",\"fzdwjzw\":\"\",\"gj\":\"\",\"gzjl\":[],\"hjhsbzqk\":[],\"hwlxjl\":\"否\",\"hwlxjlgb\":\"\",\"jg\":\"\",\"jtcyjzyshgx\":[],\"jwnlcjpxqk\":[],\"lrdw\":1,\"mqzgjrdapqk\":[],\"mqzgjzxapqk\":[],\"mz\":\"哈萨克族\",\"ndkhqk\":[],\"qqhm\":\"\",\"rtjsj\":\"\",\"rxzsj\":\"\",\"sczp\":\"20164625144630.png\",\"sfzhm\":\"34543534534534\",\"shxjc\":\"\",\"sjhm\":\"\",\"txdz\":\"\",\"type\":2,\"wxhm\":\"\",\"xb\":\"男\",\"xlxx\":[],\"xm\":\"雷毅\",\"xrjb\":\"\",\"xrqtshzw\":[],\"xrygbmqk\":[],\"xrzwqk\":[],\"year\":\"2016\",\"yzbm\":\"\",\"zcjb\":\"\",\"zhpjqk\":[],\"zjlb\":\"\",\"zycjhshyx\":\"\",\"zyjszc\":\"\",\"zyzzbx\":\"\"},{\"bgdh\":\"\",\"bz\":\"\",\"cjgzsj\":\"\",\"csny\":\"\",\"dedp\":\"\",\"dedpjrsj\":\"\",\"dept\":{\"id\":101,\"isshownum\":0,\"sort\":0,\"status\":0},\"dydp\":\"\",\"dydpjrsj\":\"\",\"dzxx\":\"\",\"fzdwjzw\":\"\",\"gj\":\"\",\"gzjl\":[],\"hjhsbzqk\":[],\"hwlxjl\":\"否\",\"hwlxjlgb\":\"\",\"jg\":\"\",\"jtcyjzyshgx\":[],\"jwnlcjpxqk\":[],\"lrdw\":1,\"mqzgjrdapqk\":[],\"mqzgjzxapqk\":[],\"mz\":\"汉族\",\"ndkhqk\":[],\"qqhm\":\"\",\"rtjsj\":\"\",\"rxzsj\":\"\",\"sczp\":\"nophoto.png\",\"sfzhm\":\"66666666666666\",\"shxjc\":\"24\",\"sjhm\":\"\",\"txdz\":\"\",\"type\":2,\"wxhm\":\"\",\"xb\":\"男\",\"xlxx\":[],\"xm\":\"李明元\",\"xrjb\":\"\",\"xrqtshzw\":[],\"xrygbmqk\":[],\"xrzwqk\":[],\"year\":\"2016\",\"yzbm\":\"\",\"zcjb\":\"\",\"zhpjqk\":[],\"zjlb\":\"\",\"zycjhshyx\":\"\",\"zyjszc\":\"\",\"zyzzbx\":\"\"}]";
		List<Person> lp=JSON.parseArray(strUserTemp, Person.class);
		for(Person p:lp){
			System.out.println(p.getId());
		}
		
		File uploadFile1=null;
		File uploadFile2=null;
		
		//照片存放路径
		String savePath1 = ServletActionContext.getRequest().getRealPath("");
		String proName=ServletActionContext.getRequest().getContextPath();
		savePath1 = savePath1.substring(0, savePath1.length()-proName.length());
		savePath1 = savePath1 + "/uploads/";
		
		for(Person p:lp){
			uploadFile1 = new File(savePath+p.getSczp());
			uploadFile2 = new File(savePath1+p.getSczp());
			copy(uploadFile1,uploadFile2);
		}
		
		//删除临时文件
		File p = new File(savePath);
		Tools.deleteAllFilesOfDir(p);
		File p1 = new File(zipFile);
		Tools.deleteAllFilesOfDir(p1);
		
		return lp;
	}
}
