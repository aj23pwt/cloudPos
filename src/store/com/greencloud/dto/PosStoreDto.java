package com.greencloud.dto;

import java.math.BigDecimal;
import java.util.List;

public class PosStoreDto {

	public Long id;
	public String type;
	public String code;
	public String name;
	public BigDecimal price;
	
	public List<PosStoreDto> children;
}
