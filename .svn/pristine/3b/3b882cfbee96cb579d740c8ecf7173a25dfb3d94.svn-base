package com.greencloud.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.greencloud.dto.UserDto;
import com.greencloud.entity.OperationInfo;
import com.greencloud.entity.PosMaster;
import com.greencloud.entity.PosPay;
import com.greencloud.entity.PosPccodeAuditFlag;
import com.greencloud.entity.PosRes;
import com.greencloud.entity.PosResOrder;
import com.greencloud.service.IPosPccodeAuditFlagService;
import com.greencloud.service.IPosSubService;
import com.greencloud.service.IPosSycOperation;
import com.greencloud.service.impl.PosPccodeAuditFlagServiceImpl;
import com.greencloud.util.DateUtil;
import com.greencloud.util.StringUtil;

/**
 * 被本地服务请求,中央数据接收服务
 * 
 * @author gc-pwt
 *
 */
@Controller
@RequestMapping(value = "/PosSycRemoteUpload")
public class PosSycRemoteUploadController {
	@Resource
	private IPosSycOperation posSycOperation;
	private IPosSubService posSubService;
	private IPosPccodeAuditFlagService posPccodeAuditFlagService;
	
	public void setPosPccodeAuditFlagService(
			IPosPccodeAuditFlagService posPccodeAuditFlagService)
	{
		this.posPccodeAuditFlagService = posPccodeAuditFlagService;
	}

	public void setPosSubService(IPosSubService posSubService) {
		this.posSubService = posSubService;
	}

	public Object getclass(String className) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException { // className是类名
		Object obj = Class.forName(className).newInstance(); // 以String类型的className实例化类
		return obj;
	}

	@ResponseBody
	@RequestMapping(value = "/getDatePosMaster")
	public void getDatePosMaster(
			@RequestParam(value = "hotelGroupId", required = true) String hotelGroupId,
			@RequestParam(value = "hotelId", required = true) String hotelId,
			@RequestParam(value = "type", required = true) String type,
			@RequestParam(value = "entity", required = true) String entity,
			HttpServletResponse response) throws Exception {
		ResponseJson j = new ResponseJson();
		List<OperationInfo> T = new ArrayList<OperationInfo>();
		OperationInfo objectInfo = new OperationInfo();
		objectInfo.setHotelGroupId(java.lang.Long.parseLong(hotelGroupId));
		objectInfo.setHotelId(java.lang.Long.parseLong(hotelId));
		// 获得本地需要同步的表的最新时间
		T = posSubService.getSycLocalDateList(entity, objectInfo);
		if (T != null) {
			j.setSuccess(true);
			j.setMsg(DateUtil.getLongDateString(T.get(0).getModifyDatetime()));
			System.out.println(entity + "最新同步时间："
					+ DateUtil.getLongDateString(T.get(0).getModifyDatetime()));

		} else {
			j.setSuccess(false);
			j.setMsg("没有符合条件的同步时间");
			j.setObj(entity);
		}
		BaseHttpResponseController.OutputJson(j, response);
	}

	@ResponseBody
	@RequestMapping(value = "/savePosMater")
	public <T> void savePosMater(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// 读取请求内容
		BufferedReader br = new BufferedReader(new InputStreamReader(
				request.getInputStream(),"UTF-8"));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		String requestData = sb.toString();
		String entity = requestData.substring(
				StringUtil.indexOfAnyBut(requestData, "&entity="),
				requestData.indexOf("&data="));
		String data = requestData.substring(requestData.indexOf("["));
		ResponseJson j = new ResponseJson();
		
		try {
			List<String> keyfields = new ArrayList<String>();
			keyfields.add("hotelGroupId");
			keyfields.add("hotelId");
			keyfields.add("accnt");
			@SuppressWarnings("rawtypes")
			Class c = null;
				try {
					c = Class.forName("com.greencloud.entity."+entity);
					@SuppressWarnings("unchecked")
					List<Object> newlist = JSON.parseArray(data,c);
					posSycOperation.saveData(newlist, false, keyfields);					
					j.setSuccess(true);
					j.setMsg("同步成功");
					j.setObj(entity);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					j.setSuccess(false);
					j.setMsg("同步失败");
					j.setObj(entity);
				}
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
			j.setMsg("同步失败");
			j.setObj(entity);
		}
		BaseHttpResponseController.OutputJson(j, response);

	}
	
	@ResponseBody
	@RequestMapping(value = "/savePosRes")
	public <T> void savePosRes(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// 读取请求内容
		BufferedReader br = new BufferedReader(new InputStreamReader(
				request.getInputStream(),"UTF-8"));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		String requestData = sb.toString();
		String entity = requestData.substring(
				StringUtil.indexOfAnyBut(requestData, "&entity="),
				requestData.indexOf("&data="));
		String data = requestData.substring(requestData.indexOf("["));
		ResponseJson j = new ResponseJson();
		try {
			List<String> keyfields = new ArrayList<String>();
			keyfields.add("hotelGroupId");
			keyfields.add("hotelId");
			keyfields.add("accnt");
			if ("PosRes".equalsIgnoreCase(entity.trim())) {
				List<PosRes> newlist = JSON
						.parseArray(data, PosRes.class);
				posSycOperation.saveData(newlist, false, keyfields);
			} else if ("PosResOrder".equalsIgnoreCase(entity.trim())) {
				List<PosResOrder> newlist = JSON.parseArray(data,
						PosResOrder.class);
				posSycOperation.saveData(newlist, false, keyfields);
			}else if ("PosPay".equalsIgnoreCase(entity.trim())) {
				List<PosPay> newlist = JSON.parseArray(data,
						PosPay.class);
				posSycOperation.saveData(newlist, false, keyfields);
			}
			j.setSuccess(true);
			j.setMsg("同步成功");
			j.setObj(entity);
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
			j.setMsg("同步失败");
			j.setObj(entity);
		}
		BaseHttpResponseController.OutputJson(j, response);

	}
	@ResponseBody
	@RequestMapping(value = "/updatePosAuditUpdatePosBizdate")
	public void updatePosAuditUpdatePosBizdate(
		@RequestParam(value = "hotelGroupId", required = true) String hotelGroupId,
		@RequestParam(value = "hotelId", required = true) String hotelId,
		@RequestParam(value = "type", required = true) String type,
		HttpServletResponse response) throws Exception {
		ResponseJson j = new ResponseJson();
		try {
			j.setSuccess(true);
		    j.setMsg(posSubService.updatePosAuditUpdatePosBizdate(java.lang.Long.parseLong(hotelGroupId),java.lang.Long.parseLong(hotelId)));;
		} catch(Exception e){
			j.setSuccess(false);
			j.setMsg("-1");
		}
		BaseHttpResponseController.OutputJson(j, response);
	}
	@ResponseBody
	@RequestMapping(value = "/uploadPosPccodeAuditFlag")
	public <T> void uploadPosPccodeAuditFlag(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// 读取请求内容
		BufferedReader br = new BufferedReader(new InputStreamReader(
				request.getInputStream(),"UTF-8"));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		String requestData = sb.toString();
		String entity = requestData.substring(
				StringUtil.indexOfAnyBut(requestData, "&entity="),
				requestData.indexOf("&data="));
		String data = requestData.substring(requestData.indexOf("["));
		ResponseJson j = new ResponseJson();
		try {
			List<String> keyfields = new ArrayList<String>();
			keyfields.add("hotelGroupId");
			keyfields.add("hotelId");
			keyfields.add("posPccode");
			keyfields.add("bizDate");
			@SuppressWarnings("rawtypes")
			Class c = null;
				try {
					c = Class.forName("com.greencloud.entity."+entity);
					@SuppressWarnings("unchecked")
					List<Object> newlist = JSON.parseArray(data,c);
					if(newlist.size()>0){
					   posSycOperation.saveData(newlist, false, keyfields);
					}
					j.setSuccess(true);
					j.setMsg("同步成功");
					j.setObj(entity);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					j.setSuccess(false);
					j.setMsg("同步失败");
					j.setObj(entity);
				}
			
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
			j.setMsg("同步失败");
			j.setObj(entity);
		}
		BaseHttpResponseController.OutputJson(j, response);
	}
	/**
	 * 夜间稽核 
	 * 修改PosPccodeAuditFlag表对应服务的关账操作,表示可以过夜审了
	 * @author gc-pwt
	 *
	 */
	@ResponseBody
	@RequestMapping(value = "/updatePosServerRegisterAuditFlag")
	public <T> void updatePosServerRegisterAuditFlag(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// 读取请求内容
		BufferedReader br = new BufferedReader(new InputStreamReader(
				request.getInputStream(),"UTF-8"));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		String requestData = sb.toString();
		UserDto user = JSON.parseObject(requestData, UserDto.class);
		ResponseJson j = new ResponseJson();
		try {
			PosPccodeAuditFlag  posPccodeAuditFlag = new PosPccodeAuditFlag();
			posPccodeAuditFlag.setHotelGroupId(user.getHotelGroup().getId());
			posPccodeAuditFlag.setHotelId(user.getHotel().getId());
			posPccodeAuditFlag.setPosPccode(user.getAuthCode());
			List<PosPccodeAuditFlag> list = posPccodeAuditFlagService.listPosPccodeAuditFlag(posPccodeAuditFlag);
			if(list!=null && list.size()>0){
				Calendar cld=Calendar.getInstance();
				cld.setTime(user.getBizDate());
				cld.add(Calendar.DATE, 1);
				for(Iterator<PosPccodeAuditFlag> i = list.iterator();i.hasNext();){
					PosPccodeAuditFlag server = i.next();
					//表示本注册服务地址第一次开单,开账表示改为T
					if(user.getAlert().equalsIgnoreCase("T")){
						server.setIsAudit("T");
						server.setIsRmposted("F");
//						server.setBizDate(user.getBizDate());
					}else if(user.getAlert().equalsIgnoreCase("F")){
					//表示本注册服务地址清机关账,开账标志设置为F,同时营业日期+1	
						server.setBizDate(cld.getTime());
						server.setIsAudit("F");
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						Date auditDateTime = df.parse(df.format(new Date()));
						server.setBizDate1(auditDateTime);						
					}
					server.setAuditUser(user.getUser().getCode());
//					server.setBizDate1(user.getBizDate());
					server.setStationAudit(user.getWorkStation().getCode());
					posPccodeAuditFlagService.saveOrUpdate(server);
			    }
				if(user.getAlert().equalsIgnoreCase("F")){
					PosPccodeAuditFlag  posPccodeAuditFlagCheck = new PosPccodeAuditFlag();
					posPccodeAuditFlagCheck.setHotelGroupId(user.getHotelGroup().getId());					
					posPccodeAuditFlagCheck.setHotelId(user.getHotel().getId());
					posPccodeAuditFlagCheck.setPosPccode(user.getAuthCode());
					List<PosPccodeAuditFlag> listCheck = posPccodeAuditFlagService.listPosPccodeAuditFlag(posPccodeAuditFlagCheck);
					if(listCheck != null && listCheck.size() > 0){
						PosPccodeAuditFlag listCheckGet = listCheck.get(0);
						SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
						Date d1=sdf.parse(sdf.format(listCheckGet.getBizDate())); 
						Date d2=sdf.parse(sdf.format(user.getBizDate()));
						if(d2.before(d1)){
							j.setSuccess(true);
							j.setMsg("1");
							j.setObj(user.getAuthCode());
						}else{
							j.setSuccess(false);
							j.setMsg("时间修改不成功");
							j.setObj(user.getAuthCode());
						}										
					}else{
						j.setSuccess(true);
						j.setMsg("1");
						j.setObj(user.getAuthCode());
					}
				}else{
					j.setSuccess(true);
					j.setMsg("1");
					j.setObj(user.getAuthCode());
				}
			}else{
				j.setSuccess(false);
				j.setMsg("服务代码未找到");
				j.setObj(user.getAuthCode());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
			j.setMsg("服务关帐失败");
			j.setObj(user.getAuthCode());
		}
		BaseHttpResponseController.OutputJson(j, response);
		
	}

	@ResponseBody
	@RequestMapping(value = "/updatePosDetailByAccnt")
	public <T> void updatePosDetailByAccnt(HttpServletRequest request,
				HttpServletResponse response) throws IOException {
		
		// 读取请求内容
		BufferedReader br = new BufferedReader(new InputStreamReader(
				request.getInputStream(),"UTF-8"));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
//			&hotelGroupId=2&entity=PosDetail&accnt=P1101609290031&hotelId=9
		
		String requestData = sb.toString();
		requestData = "&".concat(requestData).concat("&");
		
		String hotelGroupId = requestData.substring(requestData.indexOf("hotelGroupId=")+13);
		hotelGroupId = hotelGroupId.substring(0,hotelGroupId.indexOf("&"));
		
		String hotelId = requestData.substring(requestData.indexOf("hotelId=")+8);
		hotelId = hotelId.substring(0,hotelId.indexOf("&"));
		
		String accnt = requestData.substring(requestData.indexOf("accnt=")+6);
		accnt = accnt.substring(0,accnt.indexOf("&"));
		
		String entity = requestData.substring(requestData.indexOf("entity=")+7);
		entity = entity.substring(0,entity.indexOf("&"));
		
		ResponseJson j = new ResponseJson();
		
		try {			
			posSycOperation.updateDeleteSqlAllData(hotelGroupId,hotelId,accnt);
			
			j.setSuccess(true);
			j.setMsg("同步成功");
			j.setObj(entity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			j.setSuccess(false);
			j.setMsg("同步失败");
			j.setObj(entity);
		}
		BaseHttpResponseController.OutputJson(j, response);
	}

}
