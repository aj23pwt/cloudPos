package com.greencloud.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONReader;
import com.greencloud.entity.PosRes;
import com.greencloud.service.IPosResService;
import com.greencloud.service.IPosSycOperation;

/**
 * 本地数据库取数据,发送给中央服务,做数据上传
 * @author gc-pwt
 *
 */
@Controller
@RequestMapping(value = "/PosSycLocalUpload")
public class PosSycLocalUploadController {
	@Resource
	private  IPosSycOperation posSycOperation;
	
	/**
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/savePosMater")
	public <T> void savePosMater(HttpServletRequest request,
	          HttpServletResponse response) throws Exception{
		
		// 读取请求内容
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String line = null;
        StringBuilder sb = new StringBuilder();
        while((line = br.readLine())!=null){
            sb.append(line);
        }
        String data = sb.toString().substring(sb.toString().indexOf("["));
        System.out.println("data:"+data);
		    List<PosRes> newlist = JSON.parseArray(data, PosRes.class); 
		 
		    System.out.println("newlist:"+newlist.size());
			List<String> keyfields = new ArrayList<String>();
			keyfields.add("id");
			posSycOperation.saveData(newlist, false,keyfields);
			printResponse(response, "0");
			} 
	// 统一返回XML结果
		private void printResponse(HttpServletResponse response, String xml)
				throws Exception {
			response.setContentType("text/xml;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(xml);
			response.getWriter().close();
			response.getWriter().flush();
		}
}
