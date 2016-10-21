package com.greencloud.dto;

import java.io.Serializable;

public class CompanySearchDto implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = -2310101855404222545L;
    private String            profileId;
    private String            registerNo;
    private String            name;
    private String            country;
    private String            city;
    private String            market;
    private String            arNo1;
    private String            src;
    private String            membershipNo;
    private String            phone;
    private String            email;
    private String            street;
    private String            code1;
    private String            code2;
    private String            saleMan;
    private String            validBeginFrom;
    private String            validBeginTo;
    private String            validEndFrom;
    private String            validEndTo;
    private String            createDateTimeFrom;
    private String            createDateTimeTo;
    private String            guestType;
    private String            class1;
    private String            class2;
    private String            class3;
    private String            class4;
    private String            sysCat;
    private String            isSimpleSearch;
    private String            searchText;
    private String            manualNo;
    private String            scope;
    private String            hotels;
    private Long              createHotel;
    private Long              fixedHotel;
    private String            belongCode;

    public void setClass3(String class3) {
        this.class3 = class3;
    }

    public String getClass3() {
        return class3;
    }

    public void setClass4(String class4) {
        this.class4 = class4;
    }

    public String getClass4() {
        return class4;
    }

    public String getBelongCode() {
        return belongCode;
    }

    public void setBelongCode(String belongCode) {
        this.belongCode = belongCode;
    }

    public void setFixedHotel(Long fixedHotel) {
        this.fixedHotel = fixedHotel;
    }

    public Long getFixedHotel() {
        return fixedHotel;
    }

    public Long getCreateHotel() {
        return createHotel;
    }

    public void setCreateHotel(Long createHotel) {
        this.createHotel = createHotel;
    }

    public String getRegisterNo() {
        return registerNo;
    }

    public void setRegisterNo(String registerNo) {
        this.registerNo = registerNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public String getClass2() {
        return class2;
    }

    public void setClass2(String class2) {
        this.class2 = class2;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getMarket() {
        return market;
    }

    public void setMarket(String market) {
        this.market = market;
    }

    public String getArNo1() {
        return arNo1;
    }

    public void setArNo1(String arNo1) {
        this.arNo1 = arNo1;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getMembershipNo() {
        return membershipNo;
    }

    public void setMembershipNo(String membershipNo) {
        this.membershipNo = membershipNo;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCode1() {
        return code1;
    }

    public void setCode1(String code1) {
        this.code1 = code1;
    }

    public String getCode2() {
        return code2;
    }

    public void setCode2(String code2) {
        this.code2 = code2;
    }

    public String getSaleMan() {
        return saleMan;
    }

    public void setSaleMan(String saleMan) {
        this.saleMan = saleMan;
    }

    public String getValidBeginFrom() {
        return validBeginFrom;
    }

    public void setValidBeginFrom(String validBeginFrom) {
        this.validBeginFrom = validBeginFrom;
    }

    public String getValidBeginTo() {
        return validBeginTo;
    }

    public void setValidBeginTo(String validBeginTo) {
        this.validBeginTo = validBeginTo;
    }

    public String getValidEndFrom() {
        return validEndFrom;
    }

    public void setValidEndFrom(String validEndFrom) {
        this.validEndFrom = validEndFrom;
    }

    public String getValidEndTo() {
        return validEndTo;
    }

    public void setValidEndTo(String validEndTo) {
        this.validEndTo = validEndTo;
    }

    public String getGuestType() {
        return guestType;
    }

    public void setGuestType(String guestType) {
        this.guestType = guestType;
    }

    public String getClass1() {
        return class1;
    }

    public void setClass1(String class1) {
        this.class1 = class1;
    }

    public String getIsSimpleSearch() {
        return isSimpleSearch;
    }

    public void setIsSimpleSearch(String isSimpleSearch) {
        this.isSimpleSearch = isSimpleSearch;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

    public String getSysCat() {
        return sysCat;
    }

    public void setSysCat(String sysCat) {
        this.sysCat = sysCat;
    }

    public String getManualNo() {
        return manualNo;
    }

    public void setManualNo(String manualNo) {
        this.manualNo = manualNo;
    }

    public String getProfileId() {
        return profileId;
    }

    public void setProfileId(String profileId) {
        this.profileId = profileId;
    }

    public String getCreateDateTimeFrom() {
        return createDateTimeFrom;
    }

    public void setCreateDateTimeFrom(String createDateTimeFrom) {
        this.createDateTimeFrom = createDateTimeFrom;
    }

    public String getCreateDateTimeTo() {
        return createDateTimeTo;
    }

    public void setCreateDateTimeTo(String createDateTimeTo) {
        this.createDateTimeTo = createDateTimeTo;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getHotels() {
        return hotels;
    }

    public void setHotels(String hotels) {
        this.hotels = hotels;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
