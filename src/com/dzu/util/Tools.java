package com.dzu.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Tools {
	public static String date(String format) {
		String d = "";
		try {
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			d = sdf.format(dt);
		} catch (Exception e) {
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			d = sdf.format(dt);
		}

		return d;
	}

	public static String Bianma(String str) {
		try {
			str = new String(str.getBytes(), "ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}

	public static String ReadTXT(String Path, String encoding) {
		// System.out.println(Path);
		String tpl = "";
		try {
			File file = new File(Path);
			if (file.isFile() && file.exists())// 判断文件是否存在
			{
				InputStreamReader read = new InputStreamReader(new FileInputStream(file), encoding);// 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					tpl = tpl + lineTxt + "\r\n";
				}
				read.close();
			} else {
				System.out.println(Path + "文件不存在！");
			}
		} catch (Exception e) {
			System.out.println(Path + "读取文件出错！");
			e.printStackTrace();
		}
		return tpl;
	}

	public static void WriteTXT(String path, String txt) {
		File file = new File(path);
		Writer writer = null;
		try {
			writer = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
		} catch (UnsupportedEncodingException | FileNotFoundException e) {

		}
		try {
			writer.write(txt);
			writer.close();
		} catch (IOException e) {
		}

	}

	public static void appendText(String fileName, String content) {
		try {
			// 打开一个写文件器，构造函数中的第二个参数true表示以追加形式写文件
			FileWriter writer = new FileWriter(fileName, true);
			writer.write(content);
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void fileChannelCopy(File s, File t) {

		FileInputStream fi = null;

		FileOutputStream fo = null;

		FileChannel in = null;

		FileChannel out = null;

		try {

			fi = new FileInputStream(s);

			fo = new FileOutputStream(t);

			in = fi.getChannel();// 得到对应的文件通道

			out = fo.getChannel();// 得到对应的文件通道

			in.transferTo(0, in.size(), out);// 连接两个通道，并且从in通道读取，然后写入out通道

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				fi.close();

				in.close();

				fo.close();

				out.close();

			} catch (IOException e) {

				e.printStackTrace();

			}

		}

	}

	public static void deleteAllFilesOfDir(File path) {  
	    if (!path.exists())  
	        return;  
	    if (path.isFile()) {  
	        path.delete();  
	        return;  
	    }  
	    File[] files = path.listFiles();  
	    for (int i = 0; i < files.length; i++) {  
	        deleteAllFilesOfDir(files[i]);  
	    }  
	    path.delete();  
	}  
}
