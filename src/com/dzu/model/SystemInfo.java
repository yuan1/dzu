package com.dzu.model;

/** 
 * @Title: SystemInfo.java 
 * @Package com.dzu.model 
 * @Description: 系统信息
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月18日 下午12:41:58 
 * @version V1.0 
 */
public class SystemInfo {
	
	//系统名字
	private String osname;
	//服务器地址
	private String serIP;
	//主机地址
	private String hostIP;
	//系统路径
	private String appDir;
	
	public String getOsname() {
		return osname;
	}
	public void setOsname(String osname) {
		this.osname = osname;
	}
	public String getSerIP() {
		return serIP;
	}
	public void setSerIP(String serIP) {
		this.serIP = serIP;
	}
	public String getHostIP() {
		return hostIP;
	}
	public void setHostIP(String hostIP) {
		this.hostIP = hostIP;
	}
	public String getAppDir() {
		return appDir;
	}
	public void setAppDir(String appDir) {
		this.appDir = appDir;
	}
}


