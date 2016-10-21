package com.greencloud.listener;

import java.util.Date;



import org.springframework.context.ApplicationEvent;

import org.springframework.context.ApplicationListener;

import com.greencloud.entity.LogService;
import com.greencloud.service.ILogServiceService;
import com.greencloud.util.UserManager;

public class LogServiceListener implements ApplicationListener<ApplicationEvent> {

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		
		if(event instanceof LogServiceEvent){
			
			if(event !=null){
				
				LogServiceEvent logServiceEvent = (LogServiceEvent)event;
				LogService logService = new LogService();
				
				logService.setAmount(logServiceEvent.getAmount());
				logService.setCustomerId(logServiceEvent.getCustomerId());
				logService.setCustomerName(logServiceEvent.getCustomerName());
				logService.setServiceType(logServiceEvent.getServiceType());
				logService.setRemark(logServiceEvent.getRemark());
				//添加相关信息
				logService.setCreateDatetime(new Date());
				logService.setCreateUser(UserManager.getUserCode());
				
				logServiceBean.saveLogService(logService);
			}
		}
		
		
	}

	private ILogServiceService logServiceBean;

	public void setLogServiceBean(ILogServiceService logServiceBean) {
		this.logServiceBean = logServiceBean;
	}

	

}
