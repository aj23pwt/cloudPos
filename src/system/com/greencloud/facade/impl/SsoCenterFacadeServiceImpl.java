package com.greencloud.facade.impl;
import static com.greencloud.i18n.Resources.*;
import com.greencloud.i18n.FResourceBundleMessageSource;

import java.util.List;
import java.util.UUID;

import com.greencloud.constant.BizExceptionConstant;
import com.greencloud.entity.Hotel;
import com.greencloud.entity.HotelGroup;
import com.greencloud.entity.Sso;
import com.greencloud.entity.User;
import com.greencloud.exception.BizException;
import com.greencloud.facade.ISsoCenterFacadeService;
import com.greencloud.service.IHotelGroupService;
import com.greencloud.service.IHotelService;
import com.greencloud.service.ISsoService;
import com.greencloud.service.IUserService;
import com.greencloud.util.MessageDigestUtil;

public class SsoCenterFacadeServiceImpl implements ISsoCenterFacadeService {
    private FResourceBundleMessageSource resourceBundle;
    public void setResourceBundle(FResourceBundleMessageSource resourceBundle) {
        this.resourceBundle = resourceBundle;
    }
/**
	 * 
	 */
	private static final long serialVersionUID = 822433918894122428L;
	//	private static final Log log = LogFactory
//			.getLog(SsoCenterFacadeServiceImpl.class);
	private IUserService userService;
	private ISsoService ssoService;
	private IHotelService hotelService;
	private IHotelGroupService hotelGroupService;
	private String serverType;

	
    public void setServerType(String serverType) {
        this.serverType = serverType;
    }

    public void setHotelGroupService(IHotelGroupService hotelGroupService) {
		this.hotelGroupService = hotelGroupService;
	}

	public void setHotelService(IHotelService hotelService) {
		this.hotelService = hotelService;
	}

	public void setSsoService(ISsoService ssoService) {
		this.ssoService = ssoService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}


	@Override
	public String loginCenter(String userName, String password, String typeCode,
			String type) {
		//传的是hotel/hotelGroup code，需要先查hotel/hotelGroup
		User user = new User();
		Hotel hotel = new Hotel();
		hotel.setCode(typeCode);
		List<Hotel> hotels = hotelService.listHotel(hotel);
		if(hotels!=null && hotels.size()==1){
//		    if(serverType!=null && !serverType.equals("ipms") && !serverType.equals("thef")){
//		        throw new BizException( BizExceptionConstant.INVALID_CLIENT );
//		    }
			hotel = hotels.get(0);
			if(hotel.getSta().equals("R")){
				throw new BizException( resourceBundle.getMessage(AYFSMCSTBVER),BizExceptionConstant.INVALID_PARAM);
			}
			if(hotel.getSta().equals("H")){
				throw new BizException( resourceBundle.getMessage(VUMBJNFNUULW),BizExceptionConstant.INVALID_PARAM);
			}
			user.setHotelGroupId(hotel.getHotelGroupId());
			if(userName.equals("ADMIN")){//因为ADMIN在集团内有重复，所以需要在酒店内搜索
				user.setHotelId(hotel.getId());
			}
		}
		else{
			HotelGroup hotelGroup = new HotelGroup();
			hotelGroup.setCode(typeCode);
			List<HotelGroup> hotelGroups = hotelGroupService.listHotelGroup(hotelGroup);
			
			if(hotelGroups!=null && hotelGroups.size() == 1){
//	            if(serverType!=null && !serverType.equals("group")){
//	                throw new BizException( BizExceptionConstant.INVALID_CLIENT );
//	            }
				hotelGroup = hotelGroups.get(0);
				if(hotelGroup.getSta().equals("R")){
					throw new BizException( resourceBundle.getMessage(WMGNXXKVXDPT),BizExceptionConstant.INVALID_PARAM);
				}
				if(hotelGroup.getSta().equals("H")){
					throw new BizException( resourceBundle.getMessage(ORTYFRMCSNXE),BizExceptionConstant.INVALID_PARAM);
				}
				user.setHotelGroupId(hotelGroup.getId());
				if(userName.equals("ADMIN")){//因为ADMIN在集团内有重复，所以需要在集团内搜索
					user.setHotelId(0L);
				}
			}
			else{
				throw new BizException(BizExceptionConstant.NO_HOTEL_GROUP_CODE);
			}
		}
		
		//设置userCode
		user.setCode(userName);
		List<User> userList = userService.list(user);

		if(userList==null || userList.size()!=1){
			throw new BizException(BizExceptionConstant.NO_USER);//new MessageException("No User");
		}
		if (userList!=null && userList.size() == 1) {
			user = userList.get(0);
			//验证 password
			String digestPwd = MessageDigestUtil.digestPassword(password);
			if(!digestPwd.equals(user.getPassword())){
				throw new BizException(BizExceptionConstant.WRONG_PASSWORD);
			}
			// 1. 验证登录，登录成功则将 UserId 加到Session内
			// session.setAttribute(LoginConstant.LOGIN_USER_ID, user.getId());
			// 3. 将权限，用户信息，放到缓存里，并放到线程级变量里
			// UserManager.setUser(user);
			// 2. 登录成功还需要产生一个token，保存到数据库中，返回token到Flex端
			Sso sso = new Sso();
			sso.setUserId(user.getId());
			List<Sso> ssoList = ssoService.listSso(sso);
			String token = null;

			if (ssoList.size() > 0) { // 表示已登陆过了
				token = ssoList.get(0).getToken();
			} else {
				token = UUID.randomUUID().toString().replace("-", "");
				sso.setClientCount(0);
				sso.setToken(token);
				sso.setUserId(user.getId());
				ssoService.saveSso(sso);// 保存sso
			}
			return token;
		}

		return null;
	}

}