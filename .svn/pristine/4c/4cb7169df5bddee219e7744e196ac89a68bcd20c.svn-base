package com.greencloud.task;

import org.springframework.web.context.ContextLoader;

import com.greencloud.facade.IPosSycFacade;

public class PosPmsCodeTask implements Runnable {

	private static boolean isRunning = false;

	private IPosSycFacade posSycFacadeService;

	public void run() {
		if (isRunning)
			return;
		isRunning = true;
		System.out.println("pos PmsCodeTask begin:");
		posSycFacadeService = (IPosSycFacade) ContextLoader
				.getCurrentWebApplicationContext().getBean("posSycFacade");
			posSycFacadeService.getPmsCode();
			System.out.println("PmsCodeTask CodeTask end:");
			//isRunning = false;
	}
}
