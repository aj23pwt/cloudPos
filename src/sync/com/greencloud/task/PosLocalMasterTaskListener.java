package com.greencloud.task;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Value;

public class PosLocalMasterTaskListener implements ServletContextListener {
	
	public ScheduledExecutorService scheduExec = Executors.newScheduledThreadPool(1); 
	  @Value("${MaterSycTime}")
	  private String MaterSycTime;
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		scheduExec.shutdownNow();
		event.getServletContext().log("餐饮同步Master任务定时器销毁");   
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		//在这里初始化监听器，在tomcat启动的时候监听器启动，考试,大提示可以在这里实现定时器功能
		PosMasterTask task = new PosMasterTask();
		event.getServletContext().log("酒店餐饮同步任务定时器已启动");//添加日志，可在tomcat日志中查看到   
		scheduExec.scheduleWithFixedDelay(task, 20, 60, TimeUnit.SECONDS);
	}

}
