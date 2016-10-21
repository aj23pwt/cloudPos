package com.greencloud.task;

import org.springframework.web.context.ContextLoader;

import com.greencloud.facade.IPosSycFacade;

public class PosCodeTask implements Runnable {

	private static boolean isRunning = false;

	private IPosSycFacade posSycFacadeService;

	public void run() {
		if (isRunning)
			return;
		isRunning = true;
		System.out.println("pos CodeTask begin:");
		posSycFacadeService = (IPosSycFacade) ContextLoader
				.getCurrentWebApplicationContext().getBean("posSycFacade");
			posSycFacadeService.getCode();
			System.out.println("posCode CodeTask end:");
			isRunning = false;
	}
}
