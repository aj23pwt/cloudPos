package com.greencloud.facade;

import java.math.BigDecimal;
import java.util.List;

import com.greencloud.dto.POSInterfaceScanDto;
import com.greencloud.dto.PosBillDto;
import com.greencloud.entity.PosHotelTransfer;
import com.greencloud.entity.PosMaster;
import com.greencloud.entity.PosOrder;
import com.greencloud.entity.PosPluAll;
import com.greencloud.entity.PosSortAll;

public interface IPosPluFacade {
	public String getTpPluAllTreeDto();
	public void updateParamGroup(Object object);
	public List<PosOrder> savePosOrder(PosMaster posMaster,String tableNo,PosPluAll posPluAll);
	public List<PosOrder> savePosOrderNew(PosMaster posMaster,String tableNo,PosPluAll posPluAll,String dishNum);
	public void deletePosOrder(PosMaster posMaster,String tableNo);
	public void updateOrderToDetail(PosMaster posMaster,String tableNo,String info);
	public void updateDealNum(PosMaster posMaster,String tableNo,String type,long id,String dealType);
	public String updateCanclePlu(PosMaster posMaster,String tableNo,String type,long id,String info,BigDecimal number);
	public void updateCahngeNum(PosMaster posMaster,String tableNo,String type,long id,String num);
	public void updateCahngePrice(PosMaster posMaster,String tableNo,String type,long id,String price);
	public void updateCahngeDescript(PosMaster posMaster,String tableNo,String type,long id,String descript);
	public void updateCahngeDescriptOr(PosMaster posMaster,String tableNo,String type,long id,String descript,String num,String price,String unit);
	public void updateFreePlu(PosMaster posMaster,String tableNo,String type,long id,String info);
	public void updateCancleFreePlu(PosMaster posMaster,String tableNo,String type,long id,String info);
	public void updateDecPlu(PosMaster posMaster,String tableNo,String type,long id,String reason,String amount5,String dsc);
	public void updatePluCook(PosMaster posMaster,String tableNo,String type,long id,String codes,String cook,String remark);
	
	public String updateCheckOut(String coi,PosMaster posMaster,String tableNo,String accnts,String taCode,BigDecimal pay,String reason,String reasonDesc,String cardno,String remark,String balance);
	public String updateCheckOutHotelTransfer(PosHotelTransfer hotelTransferData ,String coi,PosMaster posMaster,String tableNo,String accnts,String taCode,BigDecimal pay,String reason,String reasonDesc,String cardno,String remark,String balance);
	public String updateCheckOutMinRenTicket(String ticketsn,String coi,PosMaster posMaster,String tableNo,String accnts,String taCode,BigDecimal pay,String reason,String reasonDesc,String cardno,String remark,String balance);

	public void updateZhuanSetail(PosMaster posMaster,String tableNo,String type,long id,String num,String zaccnt,String ztable);
	
	public List<PosOrder> saveCachePosOrder(String accnt,String tableNo,List<PosOrder> list);
	
	public void updateCancleAccount(String id);
	public String getTpPluAllTreeDto(String pccode);
	
    public  List<Object> getStdList(String accnt,String tableNo,String type,long id);
	
	public  void updateIn(String accnt,String tableNo,String type,String ids,long mainId);
	public  void updateOut(String accnt,String tableNo,String type,String ids,long mainId);
	
	public  PosBillDto getPosBillDtoByAccnt(String accnt,String tableNo);
	public int getMaxPosPluId(String sortCode);
	public void updatePluAllPic();
	public String getPluAllPhotoZip();
	
	public String getPosSortAllTreeDto();
	public String getPosPluAllTreeDto();
	public List<PosSortAll> getPosSortAllList();
	public void updatePosPluFlag(String selSort,String strFlag,String num);
	public List<PosPluAll> getPosPluByText(String ctext);
	public String getFlagByCode(String pcode,String num);
	
	public void updateKitchenInputDishcard(String accnt,String id,String type);
	
	public void savePosOrderCopyPlu(PosMaster posMaster,String accnt,String tableno,String type);
	
	public void updateRevokePlu(String accnt,long id,String info);
	public void updateScanSat(POSInterfaceScanDto pOSInterfaceScanDto);
	
	
}
