package com.greencloud.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.greencloud.entity.CodeBase;
import com.greencloud.entity.PosAccess;
import com.greencloud.entity.PosConddtl;
import com.greencloud.entity.PosCondst;
import com.greencloud.entity.PosCurrentPrice;
import com.greencloud.entity.PosModeDef;
import com.greencloud.entity.PosModeName;
import com.greencloud.entity.PosPay;
import com.greencloud.entity.PosPccode;
import com.greencloud.entity.PosPccodeNote;
import com.greencloud.entity.PosPccodeShift;
import com.greencloud.entity.PosPccodeTable;
import com.greencloud.entity.PosRes;
import com.greencloud.entity.PosResOrder;
import com.greencloud.entity.PosStation;
import com.greencloud.entity.PosSysReason;
import com.greencloud.service.IPosSycOperation;
import com.greencloud.util.UserManager;

/**
 * 新餐饮本地请求,获取中央数据（代码、预订单同步）
 * 
 * @author gc-pwt
 *
 */
@Controller
@RequestMapping(value = "/PosSycLocalGet")
public class PosSycLocalGetController {

	// 同步存储Service
	@Resource
	private IPosSycOperation posSycOperation;

	public Object getclass(String className) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException { // className是类名
		Object obj = Class.forName(className).newInstance(); // 以String类型的className实例化类
		return obj;
	}

	private String hotelGroupId = UserManager.getHotelGroupId() + "";
	private String hotelId = UserManager.getHotelId() + "";
	private String sycUrl = "";
	private String sycDays = "3";

	// 获取配置文件参数
	public void getSycConfig() {
		InputStream inputStream = this.getClass().getClassLoader()
				.getResourceAsStream("config/syc.properties");
		Properties p = new Properties();
		try {
			p.load(inputStream);
			hotelGroupId = p.getProperty("hotelGroupId");
			hotelId = p.getProperty("hotelId");
			sycUrl = p.getProperty("SycHttpUrl");
			sycDays = p.getProperty("SycDays");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 从中央获取预订单、预订菜式、预订金信息
	 * @param type
	 * @param entity
	 * @param date
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 */
	@ResponseBody
	@RequestMapping(value = "/getRes")
	public <T> void getRes(String type, String entity, String date)
			throws IOException, ClassNotFoundException, InstantiationException,
			IllegalAccessException {

		this.getSycConfig();
		Map<String, String> params = new HashMap<String, String>();
		params.put("hotelGroupId", hotelGroupId);
		params.put("hotelId", hotelId);
		params.put("type", type);
		params.put("entity", entity);
		params.put("date", date);
		params.put("days", sycDays);

		Map<String, String> propertys = new HashMap<String, String>();
		propertys.put("Charset", "UTF-8");
		propertys.put("Content-Type", "application/json");

		BasePosSycHttpRequester hp = new BasePosSycHttpRequester();
		String url = sycUrl + "/PosSycRemoteGet/getRes.do";
		String response = hp.sendGet(url, params, propertys, "UTF-8")
				.getContent();
		JSONObject j = JSON.parseObject(response);

		if (j.getString("success") == "true") {
			List<String> keyfields = new ArrayList<String>();
			keyfields.add("hotelGroupId");
			keyfields.add("hotelId");
			keyfields.add("accnt");
			if ("PosRes" == entity) {
				List<PosRes> oldlist = new ArrayList<PosRes>();
				oldlist = JSON.parseArray(j.getString("obj"), PosRes.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosResOrder" == entity) {
				List<PosResOrder> oldlist = new ArrayList<PosResOrder>();
				oldlist = JSON
						.parseArray(j.getString("obj"), PosResOrder.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosPay" == entity) {
				List<PosPay> oldlist = new ArrayList<PosPay>();
				oldlist = JSON.parseArray(j.getString("obj"), PosPay.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			}
		}

	}

	/**
	 * 获取中央基本代码、业务代码的设置信息
	 * @param type
	 * @param entity
	 * @param date
	 * @throws IOException
	 * @throws ClassNotFoundException
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 */
	@ResponseBody
	@RequestMapping(value = "/getCode")
	public <T> void getCode(String type, String entity, String date)
			throws IOException, ClassNotFoundException, InstantiationException,
			IllegalAccessException {
		this.getSycConfig();
		Map<String, String> params = new HashMap<String, String>();
		params.put("hotelGroupId", hotelGroupId);
		params.put("hotelId", hotelId);
		params.put("type", type);
		params.put("entity", entity);
		params.put("date", date);

		Map<String, String> propertys = new HashMap<String, String>();
		propertys.put("Charset", "UTF-8");
		propertys.put("Content-Type", "application/json");

		BasePosSycHttpRequester hp = new BasePosSycHttpRequester();
		String url = sycUrl + "/PosSycRemoteGet/getCode.do";
		String response = hp.sendGet(url, params, propertys, "UTF-8")
				.getContent();

		JSONObject j = JSON.parseObject(response);
		if (j.getString("success") == "true") {
			List<String> keyfields = new ArrayList<String>();
			keyfields.add("hotelGroupId");
			keyfields.add("hotelId");

			if ("CodeBae" == entity) {
				List<CodeBase> oldlist = new ArrayList<CodeBase>();
				oldlist = JSON.parseArray(j.getString("obj"), CodeBase.class);
				keyfields.add("code");
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosAccess" == entity) {
				List<PosAccess> oldlist = new ArrayList<PosAccess>();
				oldlist = JSON.parseArray(j.getString("obj"), PosAccess.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosConddtl" == entity) {
				List<PosConddtl> oldlist = new ArrayList<PosConddtl>();
				oldlist = JSON.parseArray(j.getString("obj"), PosConddtl.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosCondst" == entity) {
				List<PosCondst> oldlist = new ArrayList<PosCondst>();
				oldlist = JSON.parseArray(j.getString("obj"), PosCondst.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosCurrentPrice" == entity) {
				List<PosCurrentPrice> oldlist = new ArrayList<PosCurrentPrice>();
				oldlist = JSON.parseArray(j.getString("obj"),
						PosCurrentPrice.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosModeDef" == entity) {
				List<PosModeDef> oldlist = new ArrayList<PosModeDef>();
				oldlist = JSON.parseArray(j.getString("obj"), PosModeDef.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosModeName" == entity) {
				List<PosModeName> oldlist = new ArrayList<PosModeName>();
				oldlist = JSON
						.parseArray(j.getString("obj"), PosModeName.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosPccode" == entity) {
				List<PosPccode> oldlist = new ArrayList<PosPccode>();
				oldlist = JSON.parseArray(j.getString("obj"), PosPccode.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosPccodeNote" == entity) {
				List<PosPccodeNote> oldlist = new ArrayList<PosPccodeNote>();
				oldlist = JSON.parseArray(j.getString("obj"),
						PosPccodeNote.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosPccodeShift" == entity) {
				List<PosPccodeShift> oldlist = new ArrayList<PosPccodeShift>();
				oldlist = JSON.parseArray(j.getString("obj"),
						PosPccodeShift.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosPccodeTable" == entity) {
				List<PosPccodeTable> oldlist = new ArrayList<PosPccodeTable>();
				oldlist = JSON.parseArray(j.getString("obj"),
						PosPccodeTable.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosSysReason" == entity) {
				List<PosSysReason> oldlist = new ArrayList<PosSysReason>();
				oldlist = JSON.parseArray(j.getString("obj"),
						PosSysReason.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			} else if ("PosStation" == entity) {
				List<PosStation> oldlist = new ArrayList<PosStation>();
				oldlist = JSON.parseArray(j.getString("obj"), PosStation.class);
				posSycOperation.saveData(oldlist, false, keyfields);
			}
		}
	}

}
