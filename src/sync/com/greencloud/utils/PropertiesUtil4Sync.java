package com.greencloud.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Properties;

import com.greencloud.util.StringUtil;

public class PropertiesUtil4Sync {

	private static Properties sycProp = new Properties();
	private static Properties jdbcProp = new Properties();
	private final static URL filePath = PropertiesUtil4Sync.class.getClassLoader().getResource("config/syc.properties");
	static {
		try {
			InputStream inputStream = PropertiesUtil4Sync.class.getClassLoader().getResourceAsStream("config/syc.properties");
			sycProp.load(inputStream);
			
			InputStream inputStream2 = PropertiesUtil4Sync.class.getClassLoader().getResourceAsStream("config/jdbc.mysql.properties");
			jdbcProp.load(inputStream2);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String getProperty(String key) {
		String value = "";
		if(sycProp.getProperty(key) != null){
			value = StringUtil.replace(sycProp.getProperty(key),"'\\:'",":");
		}else if(jdbcProp.getProperty(key) != null){
			value = jdbcProp.getProperty(key);
		}
		return value;
	}

	public static void setProper(String key, String value) throws Exception {
		/**
		 * 将文件加载到内存中，在内存中修改key对应的value值，再将文件保存
		 */
		try {
			sycProp.setProperty(key, value);
			FileOutputStream fos = new FileOutputStream(new File(filePath.toURI()));
			sycProp.store(fos, null);
			fos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
}