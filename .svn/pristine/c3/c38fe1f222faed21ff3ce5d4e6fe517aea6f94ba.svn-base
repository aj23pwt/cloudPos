package com.greencloud.flex.message.interceptor;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.flex.core.MessageProcessingContext;
import org.springframework.flex.core.ResourceHandlingMessageInterceptor;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.aua.util.DateHelper;
import com.greencloud.constant.BizExceptionConstant;
import com.greencloud.constant.LoginConstant;
import com.greencloud.database.DataSourceContextHolder;
import com.greencloud.dto.UserDto;
import com.greencloud.entity.AuditFlag;
import com.greencloud.entity.Hotel;
import com.greencloud.entity.HotelGroup;
import com.greencloud.entity.SysOption;
import com.greencloud.entity.User;
import com.greencloud.entity.WorkStation;
import com.greencloud.entity.WorkStationStatus;
import com.greencloud.exception.BizException;
import com.greencloud.service.IAppService;
import com.greencloud.service.IAuditFlagService;
import com.greencloud.service.IHotelGroupService;
import com.greencloud.service.IHotelService;
import com.greencloud.service.ISysOptionService;
import com.greencloud.service.IUserService;
import com.greencloud.service.IWorkStationService;
import com.greencloud.service.IWorkStationStatusService;
import com.greencloud.util.DateUtil;
import com.greencloud.util.DebugLogUtil;
import com.greencloud.util.UserManager;

import flex.messaging.FlexContext;
import flex.messaging.MessageException;
import flex.messaging.endpoints.Endpoint;
import flex.messaging.messages.Message;
import flex.messaging.messages.RemotingMessage;
/**
 * blazeDS消息拦截器                            flex-blazeDS1.0.2 之前只能用org.springframework.flex.core.MessageInterceptor
 * @author weihuawon
 *
 */
public class AuditMessageInterceptor implements ResourceHandlingMessageInterceptor {

	private static final Log log = LogFactory.getLog(AuditMessageInterceptor.class);

	
	private boolean singleSession = true;
	private boolean needLogin = true;
	

	// TODO 1.第一写一个缓存管理器的SERVICE ，并注入进来
	private IUserService userService;
	private IWorkStationService workStationService;
	private IHotelService hotelService;
	private IHotelGroupService hotelGroupService;
	private ISysOptionService sysOptionService;
	private IAuditFlagService auditFlagService;
	private IAppService appService;
	private IWorkStationStatusService workStationStatusService;

	public void setWorkStationStatusService(
			IWorkStationStatusService workStationStatusService) {
		this.workStationStatusService = workStationStatusService;
	}

	public void setAuditFlagService(IAuditFlagService auditFlagService) {
		this.auditFlagService = auditFlagService;
	}

    public void setAppService(IAppService appService) {
		this.appService = appService;
	}

	public void setSysOptionService(ISysOptionService sysOptionService) {
		this.sysOptionService = sysOptionService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
    public void setWorkStationService(IWorkStationService workStationService) {
    	this.workStationService = workStationService;
    }
    
    public void setHotelService(IHotelService hotelService) {
    	this.hotelService = hotelService;
    }
    
    public void setHotelGroupService(IHotelGroupService hotelGroupService) {
    	this.hotelGroupService = hotelGroupService;
    }
    
	public void setSingleSession(boolean singleSession) {
		this.singleSession = singleSession;
	}

	public void setNeedLogin(boolean needLogin) {
		this.needLogin = needLogin;
	}
	/**
     * Hook for post-processing the outgoing AMF {@link Message}
     * 
     * @param context context for the current request
     * @param inputMessage the incoming AMF message
     * @param outputMessage the outgoing AMF message
     * @return the AMF message to send in response
     */
	public Message postProcess(MessageProcessingContext messageProcessingContext, Message inputMessage,
			Message outputMessage) {
		DebugLogUtil.postProcess(inputMessage,outputMessage);
		if(log.isDebugEnabled()){
			log.debug("postProcess");
		}
		return outputMessage;
	}
    /**
     * Hook for pre-processing the incoming AMF {@link Message}
     * 
     * @param context context for the current request
     * @param inputMessage the incoming AMF message
     * @return the AMF message to process in the current request
     */
	public Message preProcess(MessageProcessingContext messageProcessingContext, Message inputMessage) {
		DebugLogUtil.preProcess(inputMessage);
		//一个用户多次登录
	    if(inputMessage instanceof RemotingMessage){
	    		RemotingMessage remotingMessage = (RemotingMessage) inputMessage;
		    	String serviceName = remotingMessage.getDestination();
		    	String methodName=remotingMessage.getOperation();
		    	if(jumpLoginFunction(serviceName, methodName)){
		    		//跳过登录，可以直接调用
		    		String appCode = "1";
					UserManager.setCurrentApp(appService.listAppByCode(appCode));
		    	}
		    	else if(LoginConstant.LOGIN_SERVICE_METHOD.equals(methodName)&&LoginConstant.LOGIN_SERVICE_NAME.equals(serviceName)){
		    		//登录中心
		    		//调用他的方法里面，要求，查用户，权限放到缓存里，并放到线程级变量里
		    	}else if(
		    			(LoginConstant.LOGIN_SERVICE_METHOD_APP.equals(methodName) 	|| LoginConstant.LOGIN_SERVICE_METHOD_APPBYID.equals(methodName)	|| LoginConstant.PASS_METHOD_FINDAPPBYDTO.equals(methodName)	|| LoginConstant.PASS_METHOD_RESETSESSION.equals(methodName))&&	LoginConstant.LOGIN_SERVICE_NAME_APP.equals(serviceName)){	
		    		//登录应用
		    	}
		    	else{
		    		//不需要session就能够调用的方法
		    		if(( LoginConstant.PASS_METHOD_FINDALLAPP.equals(methodName) 	|| LoginConstant.PASS_METHOD_FINDHOTELBYUSERNAME.equals(methodName)	|| LoginConstant.PASS_METHOD_UPDATEUSERPWDBYUSERCODEHOTELCODE.equals(methodName))&&	LoginConstant.PASS_SERVICE.equals(serviceName)){
		    			return inputMessage;
		    		}
		    		if(("countMasterLink".equals(methodName))	&& "masterFacadeService".equals(serviceName)){
						return inputMessage;
					}
		    		
		    		
		    		UserDto userDto = null;
                    if(inputMessage.getHeader("userDto")!=null && !inputMessage.getHeader("userDto").equals("-1")){
                        try{
                            String stringUserDto = inputMessage.getHeader("userDto").toString();
                            userDto = JSON.parseObject(stringUserDto, UserDto.class);//gson.fromJson(inputMessage.getHeader("userDto").toString(), UserDto.class);
                            //userDto存在的话 从userDto里取，不读取Session
                            if(userDto!=null){
                                HttpServletRequest req =  FlexContext.getHttpRequest();
                                if(req==null)
                                    req = ((ServletRequestAttributes ) RequestContextHolder.getRequestAttributes()).getRequest();
                                HttpSession session = req.getSession();
                                session.setAttribute("userDto", stringUserDto);
                                
                                User user = userDto.getUser();
                                Hotel hotel = userDto.getHotel();
                                HotelGroup group = userDto.getHotelGroup();
                                if(user!=null){
                                    UserManager.setUser(user);
                                    if(hotel!=null){
                                        UserManager.setHotel(hotel);
                                    }
                                    else{
                                        UserManager.setHotelId(0L);
                                        UserManager.setHotelCode("");
                                        UserManager.setHotelDescript(null);
                                        UserManager.setHotelDescriptEn(null);
                                    }
                                    if(group!=null){
                                        UserManager.setHotelGroup(group);
                                    }
                                    UserManager.setCurrentApp(userDto.getApp());
                                    UserManager.setLoginType(userDto.getLoginType());
                                    UserManager.setWorkStation(userDto.getWorkStation());
                                    UserManager.setLoginTimeAppServer(userDto.getLoginTimeAppServer());
                                    UserManager.setLoginTimeClient(userDto.getLoginTimeClient());

//                                    if(!serverType.equals("member") && !serverType.equals("group")){
                                        Date bizDate = userDto.getBizDate();
                                        
//                                        if(bizDate!=null && DateUtil.dateNum(bizDate, getBizDate())!=0){
//                                            //客户端营业日期与数据库营业日期不一致
//                                            AuditFlag auditFlag = auditFlagService.findAuditFlag(UserManager.getHotelGroupId(), UserManager.getHotelId());
//                                            if(auditFlag.getBizDate().equals(auditFlag.getBizDate1())) //不在过夜审期间
//                                                throw new MessageException(
//                                                    LoginConstant.SESSION_INVALID);
//                                            
//                                            if(!auditFlag.getStationAudit().equals(UserManager.getWorkStationCode()))//在过夜审期间，但不是夜审机器
//                                                throw new MessageException(
//                                                        LoginConstant.SESSION_INVALID);
//                                            
//                                        }
//                                    }
                                    UserManager.setBizDate(getBizDate());
                                    
                                   
                                    
                                    
                                    UserManager.setFunLic(sysOptionService.findFunLic(UserManager.getHotelGroupId(), UserManager.getHotelId()));

                                    //设置班次
                                    Long cashier = userDto.getCashier();//Long.parseLong(inputMessage.getHeader(LoginConstant.LOGIN_CASHIER));//(Long)session.getAttribute(LoginConstant.LOGIN_CASHIER);
                                    if(cashier!=null)
                                        UserManager.setCashier(cashier);
                                    
                                    //检查站点是否在线，若下线，则抛异常，无记录或在线，则没事
                                  WorkStationStatus workStationStatus = new WorkStationStatus();
                                  workStationStatus.setHotelGroupId(UserManager.getHotelGroupId());
                                  workStationStatus.setHotelId(UserManager.getHotelId());
                                  workStationStatus.setAppCode(UserManager.getCurrentAppCode());
                                  workStationStatus.setWorkUser(UserManager.getUserCode());
                                  workStationStatus.setStationCode(UserManager.getWorkStationCode());
                                  List<WorkStationStatus> status = workStationStatusService.listWorkStationStatus(workStationStatus);
                                  if(status!=null && status.size()>0){
                                      if(status.get(0).getStatus().equals("H")){
                                          if(!methodName.equals("destroySession")){
                                              throw new BizException("该工作站被其他站点强制下线，您需要重新运行程序",BizExceptionConstant.INVALID_PARAM);
                                          }
                                      }
                                  }

                                }
                                return inputMessage;
                            }
                        }catch(JSONException e){
                            System.out.println(inputMessage.getHeader("userDto").toString());
                            System.out.println( "Json 格式报错" );
                            System.out.println("------------stack trace start");
                            System.out.println(e.getStackTrace());
                            System.out.println("------------stack trace end");
                            System.out.println("------------message start");
                            System.out.println(e.getMessage());
                            System.out.println("------------message end");
                        }
                        
                    }


                    //走Session 考虑老的计费程序
                    HttpServletRequest req =  FlexContext.getHttpRequest();
                    if(req==null)
                        req = ((ServletRequestAttributes ) RequestContextHolder.getRequestAttributes()).getRequest();
                    HttpSession session = req.getSession();
		    		//
		    		//根据sessionId 找到用户的Id，把对应用户的ID相应的信息，放到线程级变量里。
		    		//service 里面来做这一件事。
		    		//获得Session
		    		//在Session中查找userId

					if (session.getAttribute(LoginConstant.LOGIN_USER_ID) != null) {
						if (singleSession) {
							;// TODO 不允许多Session登录时，需要做些什么事，记录有效SessionId 或
								// 清掉其他含有UserId的Session
						}
						// TODO 找到用户的Id，调用缓存管理器的服务，将用户Id对应的信息，放到线程级变量里面
						User user = new User();
						Long userId =(Long)session.getAttribute(LoginConstant.LOGIN_USER_ID);
						user.setId(userId);
						List<User> userList = userService.list(user);
				
						if (userList.size() > 0) {
							UserManager.setUser((User)userList.get(0).cloneEx());
							//hotelGroupId, hotelId, currentAppId 从session读出来，放到线程级变量
							
							Long authHotelId = (Long)session.getAttribute(LoginConstant.AUTH_HOTEL_ID);
							if(authHotelId!=null && !authHotelId.equals(0L)){
								Hotel hotel = hotelService.findHotelById(authHotelId);
								UserManager.setHotelId(authHotelId);
								UserManager.setHotelCode(hotel.getCode());
								UserManager.setHotelDescript(hotel.getDescript());
								UserManager.setHotelDescriptEn(hotel.getDescriptEn());
								UserManager.setHotel(hotel);
							}else{
								UserManager.setHotelId(0L);
								UserManager.setHotelCode("");
								UserManager.setHotelDescript(null);
								UserManager.setHotelDescriptEn(null);
							}
							Long authGroupId = (Long)session.getAttribute(LoginConstant.AUTH_GROUP_ID);
							if(authGroupId!=null){
								HotelGroup hotelGroup = hotelGroupService.findHotelGroupById(authGroupId);
								UserManager.setHotelGroupId(hotelGroup.getId());
								UserManager.setHotelGroupCode(hotelGroup.getCode());
								UserManager.setHotelGroupDescript(hotelGroup.getDescript());
								UserManager.setHotelGroupDescriptEn(hotelGroup.getDescriptEn());
								UserManager.setHotelGroup(hotelGroup);
							}
							Long appId = (Long)session.getAttribute(LoginConstant.CURRENT_APP_ID);
							UserManager.setCurrentApp(appService.listAppById(appId));
							//设置loginType
							String loginType = (String)session.getAttribute(LoginConstant.LOGIN_TYPE);
							UserManager.setLoginType(loginType);
							
							//设置工作站信息
							Long workStationId = (Long)session.getAttribute(LoginConstant.LOGIN_WORKSTATION_ID);
							WorkStation workStation = workStationService.findWorkStationById(workStationId);
							if(workStation!=null){
								UserManager.setWorkStation(workStation);
							}
							//设置两个登录时间
							UserManager.setLoginTimeClient((Date)session.getAttribute(LoginConstant.LOGIN_TIME_CLIENT));
							UserManager.setLoginTimeAppServer((Date)session.getAttribute(LoginConstant.LOGIN_TIME_APPSERVER));
							//设置营业日期
							Date bizDate = (Date)session.getAttribute(LoginConstant.CLIENT_BIZ_DATE);
//							if(!bizDate.equals(getBizDate())){
//								//客户端营业日期与数据库营业日期不一致
//								AuditFlag auditFlag = auditFlagService.findAuditFlag(UserManager.getHotelGroupId(), UserManager.getHotelId());
//								if(auditFlag.getBizDate().equals(auditFlag.getBizDate1())) //不在过夜审期间
//									throw new MessageException(
//										LoginConstant.SESSION_INVALID);
//								
//								if(!auditFlag.getStationAudit().equals(workStation.getCode()))//在过夜审期间，但不是夜审机器
//									throw new MessageException(
//											LoginConstant.SESSION_INVALID);
//								
//							}
							
							UserManager.setBizDate(getBizDate());
							
							UserManager.setFunLic(sysOptionService.findFunLic(UserManager.getHotelGroupId(), UserManager.getHotelId()));

							//设置班次
							Long cashier = (Long)session.getAttribute(LoginConstant.LOGIN_CASHIER);
							if(cashier!=null)
								UserManager.setCashier(cashier);
							
							//检查站点是否在线，若下线，则抛异常，无记录或在线，则没事
							WorkStationStatus workStationStatus = new WorkStationStatus();
							workStationStatus.setHotelGroupId(UserManager.getHotelGroupId());
							workStationStatus.setHotelId(UserManager.getHotelId());
							workStationStatus.setAppCode(UserManager.getCurrentAppCode());
							workStationStatus.setWorkUser(UserManager.getUserCode());
							workStationStatus.setStationCode(UserManager.getWorkStationCode());
							List<WorkStationStatus> status = workStationStatusService.listWorkStationStatus(workStationStatus);
							if(status!=null && status.size()>0){
								if(status.get(0).getStatus().equals("H")){
									if(!methodName.equals("destroySession")){
										throw new BizException("该工作站被其他站点强制下线，您需要重新运行程序",BizExceptionConstant.INVALID_PARAM);
									}
								}
							}
							
						}
						
					}
					// 根据sessionid找不到用户的ID
					else {
						throw new MessageException(LoginConstant.SESSION_INVALID);
						// 接到异常FLEX转重新登录页面
					}
		    	}
	    	
	    }
		return inputMessage;
	}
	
	  /**
     * Callback to be invoked when message processing is complete, giving the interceptor a chance to clean up resources.
     * 
     * @param context - the {@link MessageProcessingContext} for the current request
     * @param inputMessage - the incoming AMF message
     * @param outputMessage - the outgoing AMF message, null in the case of an exception thrown by the {@link Endpoint}
     * @param ex - exception thrown by the {@link Endpoint}, null in the case of successful processing
     */
	public void afterCompletion(MessageProcessingContext context,
			Message inputMessage, Message outputMessage, Exception ex) {
		DebugLogUtil.afterCompletion(inputMessage, outputMessage, ex);
		DataSourceContextHolder.clearDataSourceType();
	}
	
	private boolean jumpLoginFunction(String destination , String operator){
		if(destination.equals("fReportFacadeService")){
			return true;
		}
		if(destination.equals("interfacePictureFacadeService") && operator.equals("saveInterfacePictureWithOutLogin")){
			return true;
		}
		return false;
	}
	
	
	private Date getBizDate(){
		SysOption sysOption = new SysOption();
		sysOption.setHotelGroupId(UserManager.getHotelGroupId());
		sysOption.setHotelId(UserManager.getHotelId());
		sysOption.setCatalog("system");
		sysOption.setItem("pos_biz_date");
		List<SysOption> list = sysOptionService.listSysOption(sysOption);
		if(list != null && list.size()>0){
			SysOption sysOptionGet=list.get(0);
			if (sysOptionGet == null) {
				return null;
			} else {
			    if ("1970-01-01".equals(sysOptionGet.getSetValue())){
			          Calendar c = Calendar.getInstance();
			            c.setTime(new Date());
			            c.set(Calendar.HOUR_OF_DAY, 0);
			            c.set(Calendar.MINUTE, 0);
			            c.set(Calendar.SECOND, 0);
			            c.set(Calendar.MILLISECOND, 0);
			            return c.getTime();
			    } else {
			    	return(DateHelper.parseString(sysOptionGet.getSetValue(), null));
			    }
			}
		}else{
			return null;
		}
	}
}
