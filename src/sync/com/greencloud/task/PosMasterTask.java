package com.greencloud.task;

import org.apache.http.client.utils.DateUtils;
import org.springframework.web.context.ContextLoader;

import com.greencloud.facade.IPosSycFacade;
import com.greencloud.util.DateUtil;



public class PosMasterTask implements Runnable {

	private static boolean isRunning = false;   
	
	private IPosSycFacade posSycFacadeService;

	public void run() {
		if(isRunning)
			return;
		
		isRunning = true;
		System.out.println("pos Matertask begin:");
		
		posSycFacadeService = (IPosSycFacade) ContextLoader.getCurrentWebApplicationContext().getBean("posSycFacade");
		
		posSycFacadeService.saveMaster();
		
		//System.out.println("pos Matertask end:");
		
		isRunning = false;
	}

}

