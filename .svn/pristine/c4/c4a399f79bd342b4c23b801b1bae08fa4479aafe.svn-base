package com.greencloud.facade.impl;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.web.context.ContextLoader;

import com.aua.jdbc.core.JdbcTemplate;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.greencloud.constant.BizExceptionConstant;
import com.greencloud.dto.MinRenCodeDto;
import com.greencloud.dto.MinRenTicketV2Dto;
import com.greencloud.dto.MinRenTicketV2Dto.MRInterfaceDto;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_FP;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_Freeze;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_JF;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_PQ1;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_PQ2;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_DKQ;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketResultDto;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketTag;
import com.greencloud.entity.Account;
import com.greencloud.entity.Accredit;
import com.greencloud.entity.PosAccount;
import com.greencloud.exception.BizException;
import com.greencloud.facade.ICardFacadeService;
import com.greencloud.facade.IMinRenTicketV2Facade;
import com.greencloud.service.ISysOptionService;
import com.greencloud.util.DateUtil;
import com.greencloud.util.StringUtil;
import com.greencloud.util.UserManager;

public class MinRenTicketV2FacadeServiceImpl implements IMinRenTicketV2Facade {

	private ApplicationContext factory;
	private String             serverAddr = "http://ticket.4008266333.net/Service.asmx";
	private boolean isDebug = false;
	private final String  USERCODE = "green";
	private final String  PWD = "gxhysn";
	

	private ISysOptionService sysOptionService;
    public void setSysOptionService(ISysOptionService sysOptionService) {
		this.sysOptionService = sysOptionService;
	}
    private JdbcTemplate      mysqlJdbcTemplate;
	public JdbcTemplate getMysqlJdbcTemplate() {
        if (mysqlJdbcTemplate == null) {
            factory = ContextLoader.getCurrentWebApplicationContext();
            mysqlJdbcTemplate = (JdbcTemplate) factory.getBean("jdbcTemplate");
        }

        return mysqlJdbcTemplate;
    }
	private ICardFacadeService cardFacadeService;
	public void setCardFacadeService(ICardFacadeService cardFacadeService) {
		this.cardFacadeService = cardFacadeService;
	}
	
    private String getServerAddr(){
    	if (isDebug) return  serverAddr;
    	String setValue = sysOptionService.findSysOptionByCatalogItemAsString("interface", "min_ren_tickets_addr", UserManager.getHotelGroupId(), UserManager.getHotelId());
    	if(StringUtil.isNotBlank(setValue)){
    		serverAddr = setValue;
    	}
    	return serverAddr;
    }
    
    public void setDebug(String value){
    	isDebug = true;
    	serverAddr = value;
    }
    
	@Override
	public List<MinRenTicketDto_PQ1> getTickets_PQ1(String accnt,Date bizDate) {
		getServerAddr();
		accnt = cardFacadeService.findMrAccountByCardNo(accnt);
		
		String postXml = " <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> "+
			"   <soap12:Body> "+
			"     <Ticket_user_v_create_Get xmlns=\"http://tempuri.org/\"> "+
			"       <useraccount>"+accnt+"</useraccount> "+
			"       <type>1</type> "+
			"       <xydate>"+DateUtil.getWebDateString(bizDate)+"</xydate> "+
			"       <hotelcode>"+UserManager.getHotelCode()+"</hotelcode> " +
			"     </Ticket_user_v_create_Get> "+
			"   </soap12:Body> "+
			" </soap12:Envelope> ";
		String strRespons = webServiceGetUTF8(serverAddr, "http://tempuri.org/Ticket_user_v_create_Get", postXml);
		strRespons = StringUtil.getSubString(strRespons, "<Ticket_user_v_create_GetResult>(", ")</Ticket_user_v_create_GetResult>");
		if (StringUtil.isNotBlank(strRespons)){
			Gson gson =  new GsonBuilder().setDateFormat(DateUtil.newFormat).create();		
			List<MinRenTicketDto_PQ1> lst = gson.fromJson(strRespons, new TypeToken<List<MinRenTicketDto_PQ1>>(){}.getType());
			return lst;
		}else
			return null;
	}
	@Override
	public List<MinRenTicketDto_PQ2> getTickets_PQ2(String accnt,Date bizDate) {
		getServerAddr();
		accnt = cardFacadeService.findMrAccountByCardNo(accnt);
		String postXml = " <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> "+
				"   <soap12:Body> "+
				"     <Ticket_user_v_create_Get xmlns=\"http://tempuri.org/\"> "+
				"       <useraccount>"+accnt+"</useraccount> "+
				"       <type>2</type> "+
				"       <xydate>"+DateUtil.getWebDateString(bizDate)+"</xydate> "+
				"       <hotelcode>"+UserManager.getHotelCode()+"</hotelcode> " +
				"     </Ticket_user_v_create_Get> "+
				"   </soap12:Body> "+
				" </soap12:Envelope> ";
		String strRespons = webServiceGetUTF8(serverAddr, "http://tempuri.org/Ticket_user_v_create_Get", postXml);
		strRespons = StringUtil.getSubString(strRespons, "<Ticket_user_v_create_GetResult>(", ")</Ticket_user_v_create_GetResult>");
		if (StringUtil.isNotBlank(strRespons)){
			Gson gson =  new GsonBuilder().setDateFormat(DateUtil.newFormat).create();		
			List<MinRenTicketDto_PQ2> lst = gson.fromJson(strRespons, new TypeToken<List<MinRenTicketDto_PQ2>>(){}.getType());
			return lst;
		}else
			return null;
	}
	@Override
	public List<MinRenTicketDto_DKQ> getTickets_DKQ(String accnt,Date bizDate) {
		getServerAddr();
		String postXml = " <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> "+
				"   <soap12:Body> "+
				"     <Ticketsn_search_Get xmlns=\"http://tempuri.org/\"> "+
				"       <ticketsn>"+accnt+"</ticketsn> "+
				"       <xydate>"+DateUtil.getWebDateString(bizDate)+"</xydate> "+
				"     </Ticketsn_search_Get> "+
				"   </soap12:Body> "+
				" </soap12:Envelope> ";
		String strRespons = webServiceGetUTF8(serverAddr, "http://tempuri.org/Ticketsn_search_Get", postXml);
		strRespons = StringUtil.getSubString(strRespons, "<Ticketsn_search_GetResult>(", ")</Ticketsn_search_GetResult>");
		if (StringUtil.isNotBlank(strRespons)){
			Gson gson =  new GsonBuilder().setDateFormat(DateUtil.newFormat).create();		
			List<MinRenTicketDto_DKQ> lst = gson.fromJson(strRespons, new TypeToken<List<MinRenTicketDto_DKQ>>(){}.getType());
			for (MinRenTicketDto_DKQ temp: lst){
				temp.setTicketsn(accnt);
			}
			return lst;
		}else
			return null;
	}
	@Override
	public List<MinRenTicketDto_JF> getTickets_JF(String accnt,Date bizDate) {
		getServerAddr();
		accnt = cardFacadeService.findMrAccountByCardNo(accnt);
		String postXml = " <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> "+
				"   <soap12:Body> "+
				"     <Jifen_user_v_Get xmlns=\"http://tempuri.org/\"> "+
				"       <useraccount>"+accnt+"</useraccount> "+
				"       <xydate>"+DateUtil.getWebDateString(bizDate)+"</xydate> "+
				"     </Jifen_user_v_Get> "+
				"   </soap12:Body> "+
				" </soap12:Envelope> ";
		String strRespons = webServiceGetUTF8(serverAddr, "http://tempuri.org/Jifen_user_v_Get", postXml);
		strRespons = StringUtil.getSubString(strRespons, "<Jifen_user_v_GetResult>(", ")</Jifen_user_v_GetResult>");
		if (StringUtil.isNotBlank(strRespons)){
			Gson gson =  new GsonBuilder().setDateFormat(DateUtil.newFormat).create();		
			List<MinRenTicketDto_JF> lst = gson.fromJson(strRespons, new TypeToken<List<MinRenTicketDto_JF>>(){}.getType());
			return lst;
		}else
			return null;
	}     
	
	@Override
	public List<MinRenTicketDto_FP> getTickets_FP(String accnt) {
		getServerAddr();
		accnt = cardFacadeService.findMrAccountByCardNo(accnt);
		String postXml = " <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> "+
				"   <soap12:Body> "+
				"     <Ticketsn_fp_Get xmlns=\"http://tempuri.org/\"> "+
				"       <useraccount>"+accnt+"</useraccount> "+
				"     </Ticketsn_fp_Get> "+
				"   </soap12:Body> "+
				" </soap12:Envelope> ";
		String strRespons = webServiceGetUTF8(serverAddr, "http://tempuri.org/Ticketsn_fp_Get", postXml);
		strRespons = StringUtil.getSubString(strRespons, "<Ticketsn_fp_GetResult>(", ")</Ticketsn_fp_GetResult>");
		if (StringUtil.isNotBlank(strRespons)){
			Gson gson =  new GsonBuilder().setDateFormat(DateUtil.newFormat).create();		
			List<MinRenTicketDto_FP> lst = gson.fromJson(strRespons, new TypeToken<List<MinRenTicketDto_FP>>(){}.getType());
			return lst;
		}else
			return null;
	}
	
	@Override
	public List<MinRenTicketDto_Freeze> getTickets_freeze(String accnt) {
		getServerAddr();
		accnt = cardFacadeService.findMrAccountByCardNo(accnt);
		String postXml = " <soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> "+
				"   <soap12:Body> "+
				"     <Ticket_jl_ysq_Get xmlns=\"http://tempuri.org/\"> "+
				"       <useraccount>"+accnt+"</useraccount> "+
				"       <ticketsn></ticketsn> "+
				"     </Ticket_jl_ysq_Get> "+
				"   </soap12:Body> "+
				" </soap12:Envelope> ";
		String strRespons = webServiceGetUTF8(serverAddr, "http://tempuri.org/Ticket_jl_ysq_Get", postXml);
		strRespons = StringUtil.getSubString(strRespons, "<Ticket_jl_ysq_GetResult>(", ")</Ticket_jl_ysq_GetResult>");
		if (StringUtil.isNotBlank(strRespons)){
			Gson gson =  new GsonBuilder().setDateFormat(DateUtil.newFormat).create();		
			List<MinRenTicketDto_Freeze> lst = gson.fromJson(strRespons, new TypeToken<List<MinRenTicketDto_Freeze>>(){}.getType());
			return lst;
		}else
			return null;
	}
    
	@Override
    public String applyTransaction(MRInterfaceDto mrDto) {
    	String result = "";
    	if (mrDto.getMethedWay() == 0)
    		result = doTransaction(mrDto,"Ticket_jl_add_Set");
    		//result = 0000188747
    	else if (mrDto.getMethedWay() == 1)
    		result = doTransaction(mrDto,"Ticket_jl_jf_add_Set");
    	else if (mrDto.getMethedWay() == 2)
    		result = doTransaction(mrDto,"Ticket_jl_add_ticketsn_Set");
    	return result;
    }
    private String doTransaction(MRInterfaceDto mrDto,String action){
    	getServerAddr();
		String postXml ="<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> "+
						"    <soap12:Body> "+
						"       <"+action+" xmlns=\"http://tempuri.org/\"> "+
						"          <myprocess> "+
						"             <usercode>"+mrDto.getUsercode()+"</usercode> "+
						"             <pwd>"+mrDto.getPwd()+"</pwd> "+
						"             <usertype>"+mrDto.getUsertype()+"</usertype> "+
						"              "+
						"             <FormulaId>"+mrDto.getFormulaid()+"</FormulaId> "+
						"             <Tp_Id>"+mrDto.getTpid()+"</Tp_Id> "+
						"             <CategoryId>"+mrDto.getCategoryid()+"</CategoryId> "+
						"             <ticketsn>"+mrDto.getTicketsn() +"</ticketsn> "+
						"             <no>"+mrDto.getNo() +"</no> "+
						"             "+
						"             <xfcode>"+mrDto.getXfcode() +"</xfcode> "+
						"             <jycode>"+mrDto.getJycode() +"</jycode> "+
						"             <fmoney>"+mrDto.getFmoney().toString() +"</fmoney> "+
						"             <tmoney>"+mrDto.getTmoney().toString() +"</tmoney> "+
						"              "+
						"             <hotelcode>"+mrDto.getHotelcode() +"</hotelcode> "+
						"             <deptcode>"+mrDto.getDeptcode() +"</deptcode> "+
						"              <addname>"+mrDto.getAddname() +"</addname> "+
						"              <gdcode>"+mrDto.getGdcode() +"</gdcode> "+
						"              <userdate>"+DateUtil.getWebDateString(mrDto.getUserdate()) +"</userdate> "+
						"    "+
						"         </myprocess> "+
						"       </"+action+"> "+
						"    </soap12:Body> "+
						" </soap12:Envelope>";
		 String strRespons = webServiceGetUTF8(serverAddr, "http://tempuri.org/"+action, postXml);
		 
		 strRespons = StringUtil.getSubString(strRespons, "<"+action+"Result>(", ")</"+action+"Result>");
		 if (StringUtil.isNotBlank(strRespons)){
				Gson gson =  new GsonBuilder().setDateFormat(DateUtil.newFormat).create();		
				List<MinRenTicketResultDto> result = gson.fromJson(strRespons, new TypeToken<List<MinRenTicketResultDto>>(){}.getType());//MinRenTicketResultDto.class);
				if (result == null || result.size() < 1)
					 throw new BizException("票券接口："+strRespons, BizExceptionConstant.INVALID_PARAM,BizException.BIZ_TYPE.TYPE_1);
				else
					if ("success".equalsIgnoreCase(result.get(0).getMsg()))
						return result.get(0).getCode();
					else
						throw new BizException("票券接口："+result.get(0).getMsg()+"("+result.get(0).getCode()+")", BizExceptionConstant.INVALID_PARAM,
			                    BizException.BIZ_TYPE.TYPE_1);
		 }else{
				 throw new BizException("票券接口：无返回结果", BizExceptionConstant.INVALID_PARAM,BizException.BIZ_TYPE.TYPE_1);
		 }
	}
	
    public void saveOrUpdateCodeSet(MinRenCodeDto mrc){
    	SqlRowSet rs = getMysqlJdbcTemplate().queryForRowSet("select * from interface_mr_tkt_code where hotel_group_id = ? and hotel_id = ? and code = ?", UserManager.getHotelGroupId(),UserManager.getHotelId(),mrc.getCode());
    	if(!rs.next()){
    		getMysqlJdbcTemplate().update("insert into interface_mr_tkt_code(hotel_group_id,hotel_id,code,descript,fee_code,fee_descript,is_halt,create_user,create_datetime,modify_user,modify_datetime) values(?,?,?,?,?,?,?,?,?,?,?)", UserManager.getHotelGroupId(),UserManager.getHotelId(),
    				mrc.getCode(),mrc.getDescript(),mrc.getFeeCode(),mrc.getFeeDescript(),mrc.getIsHalt(),UserManager.getUserCode(),new Date(),UserManager.getUserCode(),new Date());
    	}else{
    		// 代码已存在，则更新
    		getMysqlJdbcTemplate().update("update interface_mr_tkt_code set descript = ?,fee_code = ?,fee_descript = ?,is_halt = ?,modify_user = ?,modify_datetime = ? where hotel_group_id = ? and hotel_id = ? and code = ?", 
    				mrc.getDescript(),mrc.getFeeCode(),mrc.getFeeDescript(),mrc.getIsHalt(),UserManager.getUserCode(),new Date(),UserManager.getHotelGroupId(),UserManager.getHotelId(),mrc.getCode());

    	}
    }
    
	@Override
	public void deleteCodeSet(Long id) {
		SqlRowSet rs = getMysqlJdbcTemplate().queryForRowSet("select * from interface_mr_tkt_code where id = ?", id);
		if(rs.next()){
			getMysqlJdbcTemplate().update("delete from interface_mr_tkt_code where id = ?", id);
		}else{
			throw new BizException("该记录不存在!", BizExceptionConstant.RECODE_NOT_EXISTS);
		}
	}
	    
    public String webServiceGetUTF8(String serviceAddr, String soapAction, String soap) {
        String result = "";
        URL url;

        try {
            url = new URL(serviceAddr);

            URLConnection connection = url.openConnection();
            HttpURLConnection httpconn = (HttpURLConnection) connection;
            ByteArrayOutputStream bout = new ByteArrayOutputStream();
            bout.write(soap.getBytes());
            byte[] b = bout.toByteArray();
            httpconn.setRequestProperty("Content-Length", String.valueOf(b.length));
            httpconn.setRequestProperty("Content-Type", "application/soap+xml;charset=UTF-8;action=\""+soapAction+"\"");
            httpconn.setRequestProperty("Accept-Encoding", "gzip,deflate");
            httpconn.setRequestProperty("Host", "ticket.4008266333.net");
//            httpconn.setRequestProperty("SOAPAction", soapAction);
            httpconn.setRequestMethod("POST");
            httpconn.setDoInput(true);
            httpconn.setDoOutput(true);
            // httpconn.setReadTimeout(15000);

            OutputStream out = httpconn.getOutputStream();
            out.write(b);
            out.close();

            InputStreamReader isr = new InputStreamReader(httpconn.getInputStream());
            BufferedReader in = new BufferedReader(isr);
            String inputLine;
            while (null != (inputLine = in.readLine())) {
                result = result + inputLine + "\n";
            }
            doSaveLog(serviceAddr + "   " + soapAction, soap, result);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getStackTrace());

            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            String stackInfo = sw.toString();
            doSaveLog(serviceAddr + "   " + soapAction, soap, stackInfo);
            throw new BizException("名人票券：服务器未知错误。", BizExceptionConstant.INVALID_PARAM,
                    BizException.BIZ_TYPE.TYPE_1);
        }

        return result;

    }

    private void doSaveLog(String soapAction, String inValue, String outValue) {
    	if (isDebug) 
    		System.out.println(outValue);
    	else
    		getMysqlJdbcTemplate().update(
                "INSERT INTO `ticket_mr_log` (`hotel_group_id`,`hotel_id`,`soap_action`, `in_value`,`out_value`, "
                        + " `create_user`, `create_datetime`) " + " VALUES(?,?,?,?,?,?,now())",
                UserManager.getHotelGroupId(), UserManager.getHotelId(), soapAction, StringUtil.getLeft(inValue, 65533), StringUtil.getLeft(outValue, 65533),
                UserManager.getUserCode());
    }

    
	@Override
	public void freeze(Accredit acc,String ticketsn) {
		String[] arr = ticketsn.split(",");
		if (arr.length < 6 ){
			throw new BizException("票券接口参数不全，不能使用",BizExceptionConstant.INVALID_PARAM);
		}
		if ("0".equalsIgnoreCase(arr[0])){			
			MinRenTicketV2Dto a = new MinRenTicketV2Dto();
			MRInterfaceDto mr = a.new MRInterfaceDto();
			mr.setMethedWay(0);
			mr.setUsercode(USERCODE);
			mr.setPwd(PWD); 
			mr.setUsertype(MinRenTicketTag.FREEZE);
			
			if (StringUtil.isBlank(arr[1])){
				throw new BizException("票券接口FormulaId参数错误，不能使用",BizExceptionConstant.INVALID_PARAM);
			}else
				mr.setFormulaid(arr[1]);
			if (StringUtil.isBlank(arr[2])){
				throw new BizException("票券接口Tp_id参数错误，不能使用",BizExceptionConstant.INVALID_PARAM);
			}else
				mr.setTpid(arr[2]);
			if (StringUtil.isBlank(arr[3])){
				throw new BizException("票券接口Categoryid参数错误，不能使用",BizExceptionConstant.INVALID_PARAM);
			}else
				mr.setCategoryid(arr[3]);
			mr.setTicketsn(arr[4]);
			mr.setNo(arr[5]);
			
			mr.setXfcode(UserManager.getHotelCode() + "-" + acc.getAccnt());
			mr.setJycode(UserManager.getHotelCode() + "-" + "FR" + "-" + acc.getId());
			mr.setFmoney(acc.getAmount());
			mr.setTmoney(acc.getAmount());
			
			mr.setHotelcode(UserManager.getHotelCode());
			mr.setDeptcode("02");
			mr.setAddname(acc.getCreateUser());
			mr.setGdcode(UserManager.getWorkStationCode() + "-"+UserManager.getWorkStationDescript());
			mr.setUserdate(UserManager.getBizDate());					
			
			String result = applyTransaction(mr);
			
	    	String insertSql = " INSERT INTO `ticket_mr_result` " +
		            "(`hotel_group_id`,`hotel_id`,`methed_way`,`FormulaId`,`Tp_Id`,`CategoryId`,`ticketsn`,`no`,`xfcode`,`jycode`,`amount`,`trans_result`,`create_datetime`) "+
		    		" values (?,?,?,?,?,?,?,?,?,?,?,?,now());";
		    	
				getMysqlJdbcTemplate().update(
						insertSql,
		                UserManager.getHotelGroupId(), UserManager.getHotelId(), mr.getMethedWay(),
		                mr.getFormulaid(),mr.getTpid(), mr.getCategoryid(),mr.getTicketsn(),mr.getNo(),mr.getXfcode(),mr.getJycode(),mr.getTmoney(),
		                result);
		}else{
			throw new BizException("该类票券不能用于信用操作",BizExceptionConstant.INVALID_PARAM);
		}
		
	}
    
    @Override
	public void unfreeze(Long accId,String usercode) {
		MinRenTicketV2Dto a = new MinRenTicketV2Dto();
		MRInterfaceDto mr = a.new MRInterfaceDto();
		SqlRowSet rs = getMysqlJdbcTemplate().queryForRowSet("SELECT methed_way,`FormulaId`,  `Tp_Id`,`CategoryId`, `ticketsn`, `no`, `xfcode`, `jycode`,`amount`, `trans_result`,strick " +
							" FROM `ticket_mr_result` where hotel_group_id=? and hotel_id=?  and jycode=?", 
							UserManager.getHotelGroupId(),UserManager.getHotelId(),UserManager.getHotelCode() + "-" + "FR" + "-" +accId);
		if (rs.next()){
			if ("T".equalsIgnoreCase(rs.getString("strick"))){
				return;//由于事务的原因可能多次调用解冻方法，若标记为已解冻了，就直接返回
			}else{
				mr.setMethedWay(rs.getInt("methed_way"));
				mr.setUsercode(USERCODE);
				mr.setPwd(PWD);    	
				mr.setUsertype(MinRenTicketTag.UNFREEZE);
				
				mr.setFormulaid(rs.getString("FormulaId"));
				mr.setTpid(rs.getString("Tp_Id"));
				mr.setCategoryid(rs.getString("CategoryId"));
				mr.setTicketsn(rs.getString("ticketsn"));
				mr.setNo(rs.getString("no"));
				
				mr.setXfcode(rs.getString("xfcode"));
				mr.setJycode(rs.getString("jycode"));
				mr.setFmoney(rs.getBigDecimal("amount"));
				mr.setTmoney(rs.getBigDecimal("amount"));
				
				mr.setHotelcode(UserManager.getHotelCode());
				mr.setDeptcode("02");
				mr.setAddname(usercode);
				mr.setGdcode(UserManager.getWorkStationCode() + "-"+UserManager.getWorkStationDescript() );
				mr.setUserdate(UserManager.getBizDate());	
				
				String result = applyTransaction(mr);
		    	String updateSql = " update `ticket_mr_result` " +
			            "set strick = 'T' , strick_result = ? , modify_datetime = now() "+
		    			" where hotel_group_id = ? and hotel_id = ? and jycode =?;";
			    	
				getMysqlJdbcTemplate().update(
						updateSql,result,
			                UserManager.getHotelGroupId(), UserManager.getHotelId(), mr.getJycode());
			}
		}else
			 throw new BizException("票券接口数据不全", BizExceptionConstant.INVALID_PARAM,
	                    BizException.BIZ_TYPE.TYPE_1);
	}
	@Override
	public String useTickets(PosAccount account, String ticketsn) {
		String newCode ="";
		ticketsn= ticketsn + "end";//不然后几个参数都为空时，会导致arr.length不足
		String[] arr = ticketsn.split(",");
		if (arr.length < 8 ){
			throw new BizException("票券接口参数不全，不能使用",BizExceptionConstant.INVALID_PARAM);
		}
		MinRenTicketV2Dto a = new MinRenTicketV2Dto();
		MRInterfaceDto mr = a.new MRInterfaceDto();
		mr.setMethedWay(Integer.parseInt(arr[0]));
		mr.setUsercode(USERCODE);
		mr.setPwd(PWD); 
		if (account.getCredit().compareTo(BigDecimal.ZERO) > 0) //名人接口要求
			mr.setUsertype(MinRenTicketTag.CHARGE);
		else
			mr.setUsertype(MinRenTicketTag.STRIKE);
		
		if (mr.getMethedWay() == 0){
			if (StringUtil.isBlank(arr[1]))
				throw new BizException("票券接口FormulaId参数错误，不能使用",BizExceptionConstant.INVALID_PARAM);
			if (StringUtil.isBlank(arr[2]))
				throw new BizException("票券接口Tp_id参数错误，不能使用",BizExceptionConstant.INVALID_PARAM);
			if (StringUtil.isBlank(arr[3]))
				throw new BizException("票券接口Categoryid参数错误，不能使用",BizExceptionConstant.INVALID_PARAM);
		}else if (mr.getMethedWay() == 1){
			if (StringUtil.isBlank(arr[5]))
				throw new BizException("票券接口No参数错误，不能使用",BizExceptionConstant.INVALID_PARAM);
		}else if (mr.getMethedWay() == 2){
			if (StringUtil.isBlank(arr[4]))
				throw new BizException("票券接口Ticketsn参数错误，不能使用",BizExceptionConstant.INVALID_PARAM);
		}
		newCode = findNewTacode(account.getHotelGroupId(), account.getHotelId(), arr[6]);
		mr.setFormulaid(arr[1]);
		mr.setTpid(arr[2]);
		mr.setCategoryid(arr[3]);
		mr.setTicketsn(arr[4]);
		mr.setNo(arr[5]);
		
		mr.setXfcode(UserManager.getHotelCode() + "-" + account.getAccnt());
		mr.setJycode(UserManager.getHotelCode() + "-" + "POS" + "-" + account.getId());
		mr.setFmoney(account.getCredit());
		mr.setTmoney(account.getCredit());
		
		mr.setHotelcode(UserManager.getHotelCode());
		mr.setDeptcode("02");
		mr.setAddname(account.getCreateUser());
		mr.setGdcode(UserManager.getWorkStationCode() + "-"+UserManager.getWorkStationDescript());
		mr.setUserdate(UserManager.getBizDate());					
		
		String result = applyTransaction(mr);
		
    	String insertSql = " INSERT INTO `ticket_mr_result` " +
	            "(`hotel_group_id`,`hotel_id`,`methed_way`,`FormulaId`,`Tp_Id`,`CategoryId`,`ticketsn`,`no`,`xfcode`,`jycode`,`amount`,`trans_result`,`create_datetime`) "+
	    		" values (?,?,?,?,?,?,?,?,?,?,?,?,now());";
	    	
			getMysqlJdbcTemplate().update(
					insertSql,
					account.getHotelGroupId(), account.getHotelId(), mr.getMethedWay(),
	                mr.getFormulaid(),mr.getTpid(), mr.getCategoryid(),mr.getTicketsn(),mr.getNo(),mr.getXfcode(),mr.getJycode(),mr.getTmoney(),
	                result);
		//return newCode;
		return result;
	}
	@Override
	public void strickTickets(Integer accId,String usercode) {
		MinRenTicketV2Dto a = new MinRenTicketV2Dto();
		MRInterfaceDto mr = a.new MRInterfaceDto();
		SqlRowSet rs = getMysqlJdbcTemplate().queryForRowSet("SELECT methed_way,`FormulaId`, `Tp_Id`,`CategoryId`,  `ticketsn`, `no`, `xfcode`, `jycode`,`amount`, `trans_result`,strick " +
							" FROM `ticket_mr_result` where hotel_group_id=? and hotel_id=?  and jycode=?", 
							UserManager.getHotelGroupId(),UserManager.getHotelId(),UserManager.getHotelCode() + "-" + "POS" + "-" +accId);
		if (rs.next()){
			if ("T".equalsIgnoreCase(rs.getString("strick"))){
				return;//由于事务的原因可能多次调用解冻方法，若标记为已解冻了，就直接返回
			}else{
				mr.setMethedWay(rs.getInt("methed_way"));
				mr.setUsercode(USERCODE);
				mr.setPwd(PWD);    	
				if (rs.getBigDecimal("amount").negate().compareTo(BigDecimal.ZERO) > 0) //名人接口要求
					mr.setUsertype(MinRenTicketTag.CHARGE);
				else
					mr.setUsertype(MinRenTicketTag.STRIKE);

				
				mr.setFormulaid(rs.getString("FormulaId"));
				mr.setTpid(rs.getString("Tp_Id"));
				mr.setCategoryid(rs.getString("CategoryId"));
				mr.setTicketsn(rs.getString("ticketsn"));
				mr.setNo(rs.getString("no"));
				
				mr.setXfcode(rs.getString("xfcode"));
				mr.setJycode(rs.getString("jycode"));
				mr.setFmoney(rs.getBigDecimal("amount").negate());
				mr.setTmoney(rs.getBigDecimal("amount").negate());
				
				mr.setHotelcode(UserManager.getHotelCode());
				mr.setDeptcode("02");
				mr.setAddname(usercode);
				mr.setGdcode(UserManager.getWorkStationCode() + "-"+UserManager.getWorkStationDescript());
				mr.setUserdate(UserManager.getBizDate());	
				
				String result = applyTransaction(mr);
		    	String updateSql = " update `ticket_mr_result` " +
			            "set strick = 'T' , strick_result = ? , modify_datetime = now() "+
		    			" where hotel_group_id = ? and hotel_id = ? and jycode =?;";
			    	
				getMysqlJdbcTemplate().update(
						updateSql,result,
			                UserManager.getHotelGroupId(), UserManager.getHotelId(), mr.getJycode());
			}
		}else
			 throw new BizException("票券接口数据不全", BizExceptionConstant.INVALID_PARAM,
	                    BizException.BIZ_TYPE.TYPE_1);
	}

	private String findNewTacode(Long hotelGroupId,Long hotelId,String typeCode){
		String result = "";
		String strSql = "SELECT fee_code FROM interface_mr_tkt_code WHERE hotel_group_id=? AND hotel_id=? AND code=?" ;
		SqlRowSet rs = getMysqlJdbcTemplate().queryForRowSet(
				strSql,hotelGroupId,hotelId,typeCode);
		if (rs.next()){
			return rs.getString("fee_code");
		}
		return result;
	}
}
