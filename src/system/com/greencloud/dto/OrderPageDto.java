package com.greencloud.dto;

import java.util.List;

import com.greencloud.entity.PosAccess;
import com.greencloud.entity.PosPluAll;
import com.greencloud.entity.PosSortAll;


public class OrderPageDto {

	private List<PosSortAll> list1;
	private List<PosPluAll> list2;
	private List<PosAccess> list3;
	
	public List<PosAccess> getList3() {
		return list3;
	}
	public void setList3(List<PosAccess> list3) {
		this.list3 = list3;
	}
	public List<PosSortAll> getList1() {
		return list1;
	}
	public void setList1(List<PosSortAll> list1) {
		this.list1 = list1;
	}
	public List<PosPluAll> getList2() {
		return list2;
	}
	public void setList2(List<PosPluAll> list2) {
		this.list2 = list2;
	}
	
}
