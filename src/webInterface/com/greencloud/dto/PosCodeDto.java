package com.greencloud.dto;

public class PosCodeDto {
    private String code;
    private String descript;
    //营业点列表 电话
    private String phone;
    //营业点列表 地址
    private String address;
    // 特色介绍
    private String specialities;
    // 温馨提示
    private String reminder ;
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getDescript()
	{
		return descript;
	}
	public void setDescript(String descript)
	{
		this.descript = descript;
	}
	public String getPhone()
	{
		return phone;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public String getSpecialities()
	{
		return specialities;
	}
	public void setSpecialities(String specialities)
	{
		this.specialities = specialities;
	}
	public String getReminder()
	{
		return reminder;
	}
	public void setReminder(String reminder)
	{
		this.reminder = reminder;
	}
    
}
