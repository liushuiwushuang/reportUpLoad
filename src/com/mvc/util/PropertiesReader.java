package com.mvc.util;

import java.io.IOException;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;

public class PropertiesReader {

	private static Properties weizhi = new Properties();
	
	private static ClassPathResource _weizhi = new ClassPathResource(
			"server.properties");
	
	static {
		try {
			if (_weizhi.exists()) {
				weizhi.load(_weizhi.getInputStream());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getSaveFilePath() {
		return weizhi.getProperty("save_document_path");
	}
	
	public static String getSaveFilePath2() {
		return weizhi.getProperty("read_document_path");
	}
	
	public static String getFilePath() {
		return weizhi.getProperty("file_path");
	}
	
}
