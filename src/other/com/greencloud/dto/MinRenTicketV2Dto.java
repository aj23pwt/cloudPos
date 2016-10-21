package com.greencloud.dto;

import java.math.BigDecimal;
import java.util.Date;

public class MinRenTicketV2Dto
{

	public static final class MinRenTicketTag
	{
		/**
		 * 交易
		 */
		public static final String CHARGE = "0";
		/**
		 * 冲账
		 */
		public static final String STRIKE = "10";
		/**
		 * 冻结
		 */
		public static final String FREEZE = "4";
		/**
		 * 取消冻结
		 */
		public static final String UNFREEZE = "9";
	}

	public class MinRenTicketDto_PQ1
	{
		private String formulaid; // 方案号
		private String formulaname;// 方案名称
		private String tp_id;// 套票号
		private String categorynamenew;// 票券封套名称
		private String categoryid;// 票券类型号
		private String categoryname;// 票券类型名称
		private String hotelcode;// 酒店代码
		private String hotelname;// 酒店名称
		private String name;// 票券类别名称
		private String code;// 票券类别代码1,本金2赠券,6零元券，7积分券，5机加酒
		private BigDecimal tmoney;// 票券实际金额
		private BigDecimal fmoney;// 票券票面金额
		private String flag;// 标记
		private BigDecimal rate;

		public String getFormulaid()
		{
			return formulaid;
		}

		public void setFormulaid(String formulaid)
		{
			this.formulaid = formulaid;
		}

		public String getFormulaname()
		{
			return formulaname;
		}

		public void setFormulaname(String formulaname)
		{
			this.formulaname = formulaname;
		}

		public String getTp_id()
		{
			return tp_id;
		}

		public void setTp_id(String tp_id)
		{
			this.tp_id = tp_id;
		}

		public String getHotelcode()
		{
			return hotelcode;
		}

		public void setHotelcode(String hotelcode)
		{
			this.hotelcode = hotelcode;
		}

		public String getHotelname()
		{
			return hotelname;
		}

		public void setHotelname(String hotelname)
		{
			this.hotelname = hotelname;
		}

		public String getCategoryid()
		{
			return categoryid;
		}

		public void setCategoryid(String categoryid)
		{
			this.categoryid = categoryid;
		}

		public String getCategoryname()
		{
			return categoryname;
		}

		public void setCategoryname(String categoryname)
		{
			this.categoryname = categoryname;
		}

		public String getCategorynamenew()
		{
			return categorynamenew;
		}

		public void setCategorynamenew(String categorynamenew)
		{
			this.categorynamenew = categorynamenew;
		}

		public String getName()
		{
			return name;
		}

		public void setName(String name)
		{
			this.name = name;
		}

		public String getCode()
		{
			return code;
		}

		public void setCode(String code)
		{
			this.code = code;
		}

		public BigDecimal getTmoney()
		{
			return tmoney;
		}

		public void setTmoney(BigDecimal tmoney)
		{
			this.tmoney = tmoney;
		}

		public BigDecimal getFmoney()
		{
			return fmoney;
		}

		public void setFmoney(BigDecimal fmoney)
		{
			this.fmoney = fmoney;
		}

		public String getFlag()
		{
			return flag;
		}

		public void setFlag(String flag)
		{
			this.flag = flag;
		}

		public BigDecimal getRate()
		{
			return rate;
		}

		public void setRate(BigDecimal rate)
		{
			this.rate = rate;
		}

	}

	public class MinRenTicketDto_PQ2
	{
		private String formulaid;// 方案号
		private String formulaname;// 方案名称
		private BigDecimal totalmoney;// 合计金额

		public String getFormulaid()
		{
			return formulaid;
		}

		public void setFormulaid(String formulaid)
		{
			this.formulaid = formulaid;
		}

		public String getFormulaname()
		{
			return formulaname;
		}

		public void setFormulaname(String formulaname)
		{
			this.formulaname = formulaname;
		}

		public BigDecimal getTotalmoney()
		{
			return totalmoney;
		}

		public void setTotalmoney(BigDecimal totalmoney)
		{
			this.totalmoney = totalmoney;
		}

	}

	public class MinRenTicketDto_DKQ
	{
		private String formulaid; // 方案号
		private String formulaname;// 方案名称
		private String tp_id;// 套票号
		private String hotelcode;// 酒店代码
		private String hotelname;// 酒店名称
		private String categoryid;// 票券类型号
		private String categoryname;// 票券类型名称
		private String name;// 票券类别名称
		private String code;// 票券类别代码1,本金2赠券,6零元券，7积分券，5机加酒
		private BigDecimal tmoney;// 票券实际金额
		private BigDecimal fmoney;// 票券票面金额
		private Date datebegin;// 有效期起
		private Date dateend;// 有效期止
		private String dzpq; // 票券类型代码
		private String dzpqname;// 票券类型名称
		private String ticketsn;// 票券号码，有查询时传入

		public String getFormulaid()
		{
			return formulaid;
		}

		public void setFormulaid(String formulaid)
		{
			this.formulaid = formulaid;
		}

		public String getFormulaname()
		{
			return formulaname;
		}

		public void setFormulaname(String formulaname)
		{
			this.formulaname = formulaname;
		}

		public String getTp_id()
		{
			return tp_id;
		}

		public void setTp_id(String tp_id)
		{
			this.tp_id = tp_id;
		}

		public String getHotelcode()
		{
			return hotelcode;
		}

		public void setHotelcode(String hotelcode)
		{
			this.hotelcode = hotelcode;
		}

		public String getHotelname()
		{
			return hotelname;
		}

		public void setHotelname(String hotelname)
		{
			this.hotelname = hotelname;
		}

		public String getCategoryid()
		{
			return categoryid;
		}

		public void setCategoryid(String categoryid)
		{
			this.categoryid = categoryid;
		}

		public String getCategoryname()
		{
			return categoryname;
		}

		public void setCategoryname(String categoryname)
		{
			this.categoryname = categoryname;
		}

		public String getName()
		{
			return name;
		}

		public void setName(String name)
		{
			this.name = name;
		}

		public String getCode()
		{
			return code;
		}

		public void setCode(String code)
		{
			this.code = code;
		}

		public BigDecimal getTmoney()
		{
			return tmoney;
		}

		public void setTmoney(BigDecimal tmoney)
		{
			this.tmoney = tmoney;
		}

		public BigDecimal getFmoney()
		{
			return fmoney;
		}

		public void setFmoney(BigDecimal fmoney)
		{
			this.fmoney = fmoney;
		}

		public Date getDatebegin()
		{
			return datebegin;
		}

		public void setDatebegin(Date datebegin)
		{
			this.datebegin = datebegin;
		}

		public Date getDateend()
		{
			return dateend;
		}

		public void setDateend(Date dateend)
		{
			this.dateend = dateend;
		}

		public String getDzpq()
		{
			return dzpq;
		}

		public void setDzpq(String dzpq)
		{
			this.dzpq = dzpq;
		}

		public String getDzpqname()
		{
			return dzpqname;
		}

		public void setDzpqname(String dzpqname)
		{
			this.dzpqname = dzpqname;
		}

		public String getTicketsn()
		{
			return ticketsn;
		}

		public void setTicketsn(String ticketsn)
		{
			this.ticketsn = ticketsn;
		}

	}

	public class MinRenTicketDto_JF
	{
		private String useraccount;
		private String bosscard;
		private BigDecimal tmoney;
		private BigDecimal score;

		public String getUseraccount()
		{
			return useraccount;
		}

		public void setUseraccount(String useraccount)
		{
			this.useraccount = useraccount;
		}

		public String getBosscard()
		{
			return bosscard;
		}

		public void setBosscard(String bosscard)
		{
			this.bosscard = bosscard;
		}

		public BigDecimal getTmoney()
		{
			return tmoney;
		}

		public void setTmoney(BigDecimal tmoney)
		{
			this.tmoney = tmoney;
		}

		public BigDecimal getScore()
		{
			return score;
		}

		public void setScore(BigDecimal score)
		{
			this.score = score;
		}
	}

	public class MinRenTicketDto_FP
	{
		private String tag;
		private String fpcode; // 发票号
		private String taitou; // 发票抬头
		private String amount; // 已开/总额
		private String content;// 备注
		private Date fptime;// 开票日期
		private String bosscard;// 内部卡号
		private String cardno;// 外部卡号

		public String getTag()
		{
			return tag;
		}

		public void setTag(String tag)
		{
			this.tag = tag;
		}

		public String getFpcode()
		{
			return fpcode;
		}

		public void setFpcode(String fpcode)
		{
			this.fpcode = fpcode;
		}

		public String getTaitou()
		{
			return taitou;
		}

		public void setTaitou(String taitou)
		{
			this.taitou = taitou;
		}

		public String getAmount()
		{
			return amount;
		}

		public void setAmount(String amount)
		{
			this.amount = amount;
		}

		public String getContent()
		{
			return content;
		}

		public void setContent(String content)
		{
			this.content = content;
		}

		public Date getFptime()
		{
			return fptime;
		}

		public void setFptime(Date fptime)
		{
			this.fptime = fptime;
		}

		public String getBosscard()
		{
			return bosscard;
		}

		public void setBosscard(String bosscard)
		{
			this.bosscard = bosscard;
		}

		public String getCardno()
		{
			return cardno;
		}

		public void setCardno(String cardno)
		{
			this.cardno = cardno;
		}

	}

	public class MinRenTicketDto_Freeze
	{
		private String ticketsn;// 券号
		private Date userdate;// 日期
		private String usertype;//
		private String name;// 操作，冻结？解冻？
		private String xfcode;// 消费码,
		private BigDecimal tmoney;// 金额
		private String cardno;// 卡号
		private String hotelcode;// 酒店
		private String addname;// 操作人
		private Date addtime;// 操作时间

		public String getTicketsn()
		{
			return ticketsn;
		}

		public void setTicketsn(String ticketsn)
		{
			this.ticketsn = ticketsn;
		}

		public Date getUserdate()
		{
			return userdate;
		}

		public void setUserdate(Date userdate)
		{
			this.userdate = userdate;
		}

		public String getUsertype()
		{
			return usertype;
		}

		public void setUsertype(String usertype)
		{
			this.usertype = usertype;
		}

		public String getName()
		{
			return name;
		}

		public void setName(String name)
		{
			this.name = name;
		}

		public String getXfcode()
		{
			return xfcode;
		}

		public void setXfcode(String xfcode)
		{
			this.xfcode = xfcode;
		}

		public BigDecimal getTmoney()
		{
			return tmoney;
		}

		public void setTmoney(BigDecimal tmoney)
		{
			this.tmoney = tmoney;
		}

		public String getCardno()
		{
			return cardno;
		}

		public void setCardno(String cardno)
		{
			this.cardno = cardno;
		}

		public String getHotelcode()
		{
			return hotelcode;
		}

		public void setHotelcode(String hotelcode)
		{
			this.hotelcode = hotelcode;
		}

		public String getAddname()
		{
			return addname;
		}

		public void setAddname(String addname)
		{
			this.addname = addname;
		}

		public Date getAddtime()
		{
			return addtime;
		}

		public void setAddtime(Date addtime)
		{
			this.addtime = addtime;
		}

	}

	public class MinRenTicketResultDto
	{
		private String msg;
		private String code;

		public String getMsg()
		{
			return msg;
		}

		public void setMsg(String msg)
		{
			this.msg = msg;
		}

		public String getCode()
		{
			return code;
		}

		public void setCode(String code)
		{
			this.code = code;
		}

	}

	public class MRInterfaceDto
	{
		public MRInterfaceDto()
		{

		}

		private int methedWay;// 0：普通票券，1，抵扣券，2，积分
		private String usercode;// 访问用户代码
		private String pwd;// 访问用户密码
		private String usertype;// 交易类型（0交易、4冻结、9解冻、10冲账）

		private String formulaid;// 方案号
		private String categoryid;// 票券类型号
		private String tpid;// 套票号
		private String ticketsn;// 票券号
		private String no;// 卡号（例如V282220）

		private String xfcode;// 消费代码:目前采用：酒店代码+masterBase.id
		private String jycode;// 交易代码,目前采用：酒店代码+{0}+account.id ;{0}=FR or CH
								// ，冻结或消费
		private BigDecimal fmoney;// 扣款金额
		private BigDecimal tmoney;// 实际扣款金额

		private String hotelcode;// 酒店代码
		private String deptcode;// 部门代码
		private String addname;// 操作工号
		private String gdcode;// 岗点代码
		private Date userdate;// 消费时间

		public int getMethedWay()
		{
			return methedWay;
		}

		public void setMethedWay(int methedWay)
		{
			this.methedWay = methedWay;
		}

		public String getUsercode()
		{
			return usercode;
		}

		public void setUsercode(String usercode)
		{
			this.usercode = usercode;
		}

		public String getPwd()
		{
			return pwd;
		}

		public void setPwd(String pwd)
		{
			this.pwd = pwd;
		}

		public String getUsertype()
		{
			return usertype;
		}

		public void setUsertype(String usertype)
		{
			this.usertype = usertype;
		}

		public String getFormulaid()
		{
			return formulaid;
		}

		public void setFormulaid(String formulaid)
		{
			this.formulaid = formulaid;
		}

		public String getCategoryid()
		{
			return categoryid;
		}

		public void setCategoryid(String categoryid)
		{
			this.categoryid = categoryid;
		}

		public String getTicketsn()
		{
			return ticketsn;
		}

		public void setTicketsn(String ticketsn)
		{
			this.ticketsn = ticketsn;
		}

		public String getNo()
		{
			return no;
		}

		public void setNo(String no)
		{
			this.no = no;
		}

		public String getXfcode()
		{
			return xfcode;
		}

		public void setXfcode(String xfcode)
		{
			this.xfcode = xfcode;
		}

		public String getJycode()
		{
			return jycode;
		}

		public void setJycode(String jycode)
		{
			this.jycode = jycode;
		}

		public BigDecimal getFmoney()
		{
			return fmoney;
		}

		public void setFmoney(BigDecimal fmoney)
		{
			this.fmoney = fmoney;
		}

		public BigDecimal getTmoney()
		{
			return tmoney;
		}

		public void setTmoney(BigDecimal tmoney)
		{
			this.tmoney = tmoney;
		}

		public String getHotelcode()
		{
			return hotelcode;
		}

		public void setHotelcode(String hotelcode)
		{
			this.hotelcode = hotelcode;
		}

		public String getDeptcode()
		{
			return deptcode;
		}

		public void setDeptcode(String deptcode)
		{
			this.deptcode = deptcode;
		}

		public String getAddname()
		{
			return addname;
		}

		public void setAddname(String addname)
		{
			this.addname = addname;
		}

		public String getGdcode()
		{
			return gdcode;
		}

		public void setGdcode(String gdcode)
		{
			this.gdcode = gdcode;
		}

		public Date getUserdate()
		{
			return userdate;
		}

		public void setUserdate(Date userdate)
		{
			this.userdate = userdate;
		}

		public String getTpid()
		{
			return tpid;
		}

		public void setTpid(String tpid)
		{
			this.tpid = tpid;
		}

	}

}
