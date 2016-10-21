package com.greencloud.utils;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.alibaba.fastjson.JSON;
import com.aua.jdbc.core.JdbcTemplate;
import com.greencloud.controller.BasePosSycHttpRequester;
import com.greencloud.dao.IPosAccntSyncDao;
import com.greencloud.dto.DaBengBusinessTaxDataDeatilDto;
import com.greencloud.dto.DaBengBusinessTaxDataDto;
import com.greencloud.entity.PosAccntSync;

public class TestDabengBusinessTax
{	
	private static JdbcTemplate thisJdbcTemplate;
	private static ApplicationContext factory;
	private static IPosAccntSyncDao posAccntSyncDao ;
	
	public static void main(String[] args){
		factory = ContextLoader.getCurrentWebApplicationContext();
		thisJdbcTemplate = (JdbcTemplate)factory.getBean("jdbcTemplate");

		PosAccntSync lt = new PosAccntSync();
		lt.setAccnt("P605180002");
		lt.setCreateDatetime(new Date());
		lt.setCreateUser("ADMIN");
		lt.setEntityName("com.greencloud.entity.PosMaster");
		lt.setHotelGroupId((long) 2);
		lt.setHotelId((long) 9);
		lt.setIsHalt("F");
		lt.setIsSync("F");
		lt.setModifyDatetime(new Date());
		lt.setModifyUser("ADMIN");
		lt.setResAccnt("");
		lt.setType("CHECK");
//		thisJdbcTemplate.
//		posSubService.saveCodeCollection(posAccntSyncList);
//		posAccntSyncDao.save(lt);
		
	}
	public void test()
	{
		// TODO Auto-generated method stub
		Map<String, String> params = new HashMap<String, String>();
		params.put("TenantId","dbgo.dbi.saas");
		
		DaBengBusinessTaxDataDeatilDto detail = new DaBengBusinessTaxDataDeatilDto();
		detail.setCode("001");
		detail.setMtCode("306106152200");
		detail.setSpecification("150GX30粒粒桃");
		detail.setMtName("旺旺维多粒果冻爽_150gx29_粒粒桃");
		detail.setCtCode("001");
		detail.setTrxCode("222222222222777");
		detail.setAddressTel("中国杭州");
		detail.setCustomerName( "绿云餐饮");
		detail.setBankInfo("6555254526558751588");
		detail.setSumAmount(new BigDecimal("56.10"));
		detail.setPrice(new BigDecimal("1.00"));
		detail.setQuentity("1");
		detail.setUnit("箱");
		detail.setTaxType("1");
		detail.setTransDate("2016-05-1 11:18:08");
		
		DaBengBusinessTaxDataDto tenat = new DaBengBusinessTaxDataDto();
		tenat.setTenantId("4739ecc7b3114b359ff9bb9edd6150c6");
		tenat.setPrintUser("test@qq.com");
		List<DaBengBusinessTaxDataDeatilDto> DataList = new ArrayList<DaBengBusinessTaxDataDeatilDto>();
		
		DataList.add(detail);
		tenat.setDataList(DataList);
		
		Map<String, String> propertys = new HashMap<String, String>();
		propertys.put("Charset", "UTF-8");
		propertys.put("Content-Type", "application/json");
		propertys.put("DBISaaS-UserName","dbgo.dbi.saas");
		propertys.put("DBISaaS-Password","1qaz@WSX");
		BasePosSycHttpRequester hp = new BasePosSycHttpRequester();
		String url = "http://sandboxdbisaas.chinacloudsites.cn/extapi/transaction/addwithcustomer";
		String response;
			try
			{
				response = hp.sendPostJson(url,"POST",JSON.toJSONString(tenat),params, propertys, "UTF-8")
						.getContent();
				System.out.print(response);
			} catch (IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
//	public IPosAccntSyncDao getPosAccntSyncDao() {
//		return posAccntSyncDao;
//	}
	public void setPosAccntSyncDao(IPosAccntSyncDao posAccntSyncDao) {
		this.posAccntSyncDao = posAccntSyncDao;
	}

}
