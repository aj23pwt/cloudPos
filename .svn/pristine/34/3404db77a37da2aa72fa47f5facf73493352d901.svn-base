package com.greencloud.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;


/**
 * 数据交互http请求统一返回JSON
 * @author gc-pwt
 *
 */
public class BaseHttpResponseController {
	public static void OutputJson(Object object,HttpServletResponse response) {
		PrintWriter out = null;
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		String json=null;
		try {
			out = response.getWriter();
			json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss");
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.close();
	}
	public static void OutputJson(Object object,String type,HttpServletResponse response) {
		PrintWriter out = null;
		 response.setContentType(type);
		 response.setCharacterEncoding("utf-8");
		String json=null;
		try {
			out = response.getWriter();
			json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss");
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(json);
		out.close();
	}
	public static void Output(Object object,HttpServletResponse response) {
		// 2、打印数据
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
