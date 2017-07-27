package com.dzu.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

public class Listip {

	public static String getWebIp() {
		try {
			URL url = new URL("http://smart-ip.net/myip");
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			String s = "";
			StringBuffer sb = new StringBuffer("");
			String webContent = "";
			while ((s = br.readLine()) != null) {
				sb.append("r"+s + "n");
			}

			br.close();
			webContent = sb.toString();
			int start = webContent.indexOf("r") + 1;
			int end = webContent.indexOf("n");
			if (start < 0 || end < 0) {
				return null;
			}
			webContent = webContent.substring(start, end);
			return webContent;

		} catch (Exception e) {
			e.printStackTrace();
			return "127.0.0.1";

		}
	}
}