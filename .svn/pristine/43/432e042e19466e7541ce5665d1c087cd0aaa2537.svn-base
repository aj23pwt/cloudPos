package com.greencloud.task;

import org.springframework.web.context.ContextLoader;

import com.greencloud.facade.IPosSycFacade;



public class PosResTask implements Runnable {

	private static boolean isRunning = false;   
	
	private IPosSycFacade posSycFacadeService;

	public void run() {
		if(isRunning)
			return;
		
		isRunning = true;
		System.out.println("pos Restask begin:");
		
		posSycFacadeService = (IPosSycFacade) ContextLoader.getCurrentWebApplicationContext().getBean("posSycFacade");
		
		posSycFacadeService.getRes();
		
		System.out.println("pos Restask end:");
		
		isRunning = false;
	}

}

