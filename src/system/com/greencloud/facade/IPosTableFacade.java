package com.greencloud.facade;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.greencloud.dto.OrderPageDto;
import com.greencloud.dto.PosPluDto;
import com.greencloud.dto.PosTableDto;
import com.greencloud.entity.CodeBase;
import com.greencloud.entity.PosPccode;
import com.greencloud.entity.PosPluAll;
import com.greencloud.entity.PosSortAll;
import com.greencloud.entity.PosStation;
import com.greencloud.entity.WorkStation;

public interface IPosTableFacade {
	public List<PosTableDto> getPosTable();
	public List<PosPccode> getPosPccode();
	public List<PosPccode> getPosPccodeAll();
	public List<CodeBase> getTableType();
	public List<CodeBase> getCashierData();
	public OrderPageDto getPosSortAll(String pcCode);
	public PosPluDto getPosPluAllBySort(String sort);
	public Date setCashier(String cashier); 
	public List<WorkStation> getWorkStation();
}
