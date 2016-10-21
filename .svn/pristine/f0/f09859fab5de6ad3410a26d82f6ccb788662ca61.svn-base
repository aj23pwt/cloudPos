package com.greencloud.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.greencloud.entity.PosIp;
import com.greencloud.service.IPosIpService;

@Controller
@RequestMapping(value = "/PosIp")
public class PosIpGetController {
	
	private IPosIpService posIpService; 

	public void setPosIpService(IPosIpService posIpService) {
		this.posIpService = posIpService;
	}
//	http://localhost:8080/pos/PosIp/GetPosIp?hotelGroupId=2&hotelId=9
	@RequestMapping(value = "/GetPosIp")
	@ResponseBody
	public void getPosIp(
			@RequestParam(value = "hotelGroupId", required = true) String hotelGroupId,
			@RequestParam(value = "hotelId", required = true) String hotelId,
			HttpServletResponse response) throws Exception{
		ResponseJson j = new ResponseJson();
		List<PosIp> T = new ArrayList<PosIp>();
		PosIp posIp = new PosIp();
		posIp.setHotelGroupId(Long.parseLong(hotelGroupId));
		posIp.setHotelId(Long.parseLong(hotelId));
		T = posIpService.listPosIp(posIp);
		j.setObj(JSON.toJSON(T).toString());
		j.setMsg("success");
		j.setSuccess(true);
		BaseHttpResponseController.Output(j, response);

	}




				
//	(
//			@RequestParam(value = "hotelGroupId", required = true) String hotelGroupId,
//			@RequestParam(value = "hotelId", required = true) String hotelId,
//			@RequestParam(value = "type", required = true) String type,
//			@RequestParam(value = "entity", required = true) String entity,
//			@RequestParam(value = "date", required = true) String date,
//			@RequestParam(value = "days", required = true) String days,
//			HttpServletResponse response) throws Exception
}
