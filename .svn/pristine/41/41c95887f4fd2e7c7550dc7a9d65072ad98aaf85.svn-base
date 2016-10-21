package com.greencloud.facade;

import java.util.Date;
import java.util.List;

import com.greencloud.dto.MinRenCodeDto;
import com.greencloud.dto.MinRenTicketV2Dto.MRInterfaceDto;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_DKQ;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_FP;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_Freeze;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_JF;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_PQ1;
import com.greencloud.dto.MinRenTicketV2Dto.MinRenTicketDto_PQ2;
import com.greencloud.entity.Accredit;
import com.greencloud.entity.PosAccount;

public interface IMinRenTicketV2Facade {
	
	/**
	 * 根据帐号获取券列表
	 * @param cardNo
	 * @return
	 */
	List<MinRenTicketDto_PQ1> getTickets_PQ1(String accnt,Date bizDate);
	/**
	 * 根据帐号获取券列表,合计
	 * @param cardNo
	 * @return
	 */
	List<MinRenTicketDto_PQ2> getTickets_PQ2(String accnt,Date bizDate);
	/**
	 * 根据帐号获取  折扣券 列表
	 * @param cardNo
	 * @return
	 */
	List<MinRenTicketDto_DKQ> getTickets_DKQ(String accnt,Date bizDate);
	/**
	 * 根据帐号获取积分列表
	 * @param cardNo
	 * @return
	 */
	List<MinRenTicketDto_JF> getTickets_JF(String accnt,Date bizDate);
	
	/**
	 * 根据id删除设置
	 * @param id
	 */
	public void deleteCodeSet(Long id);
	/**
	 * 根据传入参数新增或修改设置
	 * @param mrc
	 */
	public void saveOrUpdateCodeSet(MinRenCodeDto mrc);
	public String applyTransaction(MRInterfaceDto mrDto);
	void unfreeze(Long accId ,String usercode);
	void freeze(Accredit acc, String ticketsn);
	void strickTickets(Integer integer, String usercode);
	List<MinRenTicketDto_FP> getTickets_FP(String accnt);
	List<MinRenTicketDto_Freeze> getTickets_freeze(String accnt);
	String useTickets(PosAccount account, String ticketsn);
}
