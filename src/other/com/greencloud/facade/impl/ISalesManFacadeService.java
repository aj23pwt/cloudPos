package com.greencloud.facade.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.aua.util.Container;
import com.greencloud.dto.SalesActivityManDto;
import com.greencloud.dto.SalesActivityPlanDto;
import com.greencloud.dto.SalesFeedbackDto;
import com.greencloud.dto.SalesManCompanyBirthDto;
import com.greencloud.dto.SalesManDto;
import com.greencloud.dto.SalesmanSearchDto;
import com.greencloud.dto.WeightDto;
import com.greencloud.entity.SalesActivity;
import com.greencloud.entity.SalesActivityMan;
import com.greencloud.entity.SalesFeedback;
import com.greencloud.entity.SalesGroup;
import com.greencloud.entity.SalesMan;
import com.greencloud.entity.SalesManBusiness;
import com.greencloud.entity.SalesManMonthlyReport;
import com.greencloud.entity.SalesPlan;
import com.greencloud.entity.SalesPlanRule;

public interface ISalesManFacadeService extends Serializable {
	public SalesActivity findSalesActivityById(Long id)
			throws DataAccessException;

	@SuppressWarnings("rawtypes")
	public Container<Map> findBySearchDto(SalesActivity searchDto,
			Long sysListMetaId, Integer currentPage, String filterSql);
	public String findBySearchDtoSum(SalesActivity searchDto,
	                                      String winName, String filterSql);
	public SalesActivity saveOrUpdateSalesActivity(SalesActivity salesActivity) throws DataAccessException;
	public List<SalesActivityManDto> listSalesActivityManByActivity(
			Long salesActivityId) throws DataAccessException;
	public void deleteSalesActivityMan(SalesActivityMan salesActivityMan);
	public void saveOrUpdateSalesActivityMan(SalesActivityMan salesActivityMan) throws DataAccessException;
	public SalesActivityMan findSalesActivityMan(SalesActivityMan salesActivityMan) throws DataAccessException;
	/**
	 * 更新
	 * 
	 * @param salesman
	 * @return
	 */
	public SalesManDto updateSalesManDto(SalesManDto salesmanDto);

	/**
	 * 删除
	 * 
	 * @param salesman
	 * @return
	 */
	public SalesManDto deleteSalesMan(SalesManDto salesman);

	/**
	 * 挂起
	 * 
	 * @param salesman
	 * @return
	 */
	public SalesManDto updateSalesManSuspend(SalesManDto salesmanDto);

	/**
	 * 停用
	 * 
	 * @param salesman
	 * @return
	 */
	public SalesManDto updateSalesManStop(SalesManDto salesmanDto);

	/**
	 * 保存
	 * 
	 * @param salesman
	 * @return
	 */
	public SalesManDto saveSalesManDto(SalesManDto salesmanDto,Long hotelGroupId,Long hotelId);

	/**
	 * 查找
	 * 
	 * @param code
	 * @return
	 */
	public SalesMan findSalesManByCode(String code);

	/**
	 * 恢复
	 * 
	 * @param salesman
	 * @return
	 */
	public SalesManDto updateSalesManRecovery(SalesManDto salesManDto);

	/**
	 * salesGroup保存
	 * 
	 * @param salesGroup
	 * @return
	 */
	public SalesGroup saveSalesGroup(SalesGroup salesGroup);
	 
	 public SalesGroup saveSalesGroupFromGroup(SalesGroup salesGroup,String hotels);

	/**
	 * salesGroup更新
	 * 
	 * @param salesGroup
	 * @return
	 */
	public SalesGroup updateSalesGroup(SalesGroup salesGroup);

	/**
	 * salesGroup删除
	 * 
	 * @param salesGroup
	 * @return
	 */
	public String deleteSalesGroup(SalesGroup salesGroup);
	 
	public String deleteSalesGroupByCode(String salesGroup,Long hotelGroupId,Long hotelId);

	/**
	 * salesGroupchazh
	 * 
	 * @param salesGroup
	 * @return
	 */
	public SalesGroup findSalesGroupByCode(String code,Long hotelId);

	/**
	 * 查询所有的SalesGroup
	 * 
	 * @param salesGroup
	 *            ==空值
	 * @return
	 */
	public List<SalesGroup> listSalesGroup(SalesGroup salesGroup);

	/**
	 * 通过code查询SalesMan
	 * 
	 * @param s
	 *            =code
	 * @return
	 */
	public List<SalesMan> queryByCode(String s);

	/**
	 * 通过姓名查找Salesman
	 * 
	 * @param s
	 *            =name
	 * @return
	 */
	public List<SalesMan> queryByName(String s);

	/**
	 * 通过code查找SalesmanDto
	 * 
	 * @param code
	 * @return SalesManDto
	 */
	public SalesManDto findSalesManDtoByCode(String code,Long hotelGroupId,Long hotelId);

	/**
	 * 通过ID查找SalesGroup
	 * 
	 * @param id
	 * @return
	 */
	public SalesGroup findSalesGroupById(String id);

	/**
	 * 获得Extra_flag字段
	 * 
	 * @param id
	 * @return
	 */
	public String getExtraInfo(Long id);

	/**
	 * 
	 * @param totelNum
	 * @param id
	 * @param type
	 *            ----"fileUpload""complain""alerts""activity"
	 * @return
	 */
	public String updateExtraFlag(String totalNum, String id, String type);
	
	/**
	 * 修改权重设置
	 * @param list
	 */
	public void updateGrpWeight(List<WeightDto> list);
	
	public void updateReSetGrpWeight(String indexCode,String latiCode);
	
	/**
	 * 重建协议单位业绩(权重)
	 */
	public void updateRebuildValue();
	
	public String listSalesGroupTree(Long hotelGroupId,Long hotelId);
	
	public void resetSalesManBusiness(String salesman,String group,Long hotelGroupId,Long hotelId);
	
	public void deleteSalesManBusiness(String salesman,String group,Long hotelGroupId,Long hotelId);
	
	public void updateSalesGroupRelation(String group,String parentGroup,Integer index,Long hotelGroupId,Long hotelId);
	
	public String listSalesManRelationTree(Long hotelGroupId,Long hotelId);
	
	/**
	 * 查询与指定酒店有业务关系的销售员列表
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	public List<SalesMan> listSalesMan(Long hotelGroupId,Long hotelId);
	
	public String updateSalesmanRelation(String leader,String salesman,Long hotelGroupId,Long hotelId);
	
	/**
	 * 查询非指定销售员手下的组员
	 * @param salesman
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	List<SalesMan> listUnSelectedSalesMan(String salesman,Long hotelGroupId,Long hotelId);
	/**
	 * 查询指定销售员手下的组员
	 * @param salesman
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	List<SalesMan> listSelectedSalesMan(String salesman,Long hotelGroupId,Long hotelId);
	
	List<SalesMan> listSelfAndSelectedSalesMan(String salesman,Long hotelGroupId,Long hotelId);
	
	String saveSalesMember(String salesman,List<SalesMan> list,Long hotelGroupId,Long hotelId);
	/**
	 * 判断当前登录用户是否是销售员
	 * @param salesman
	 * @param hotelGroupId
	 * @param hotelId
	 * @return T:是    F:否
	 */
	String isSalesMan(String salesman);
	
	SalesManBusiness findSalesManBusinessByCode(String salesman,Long hotelGroupId,Long hotelId);
	
	void buildSalesmanPerformaceReport(Long hotelGroupId,Long hotelId,Date dateBegin,Date dateEnd);
	
	SalesManDto updateExpandSalesmanBusiness(Long hotelGroupId, Long hotelId,String code);
	
	/**
     * 根据登录用户查找销售员 wjm添加
     */
    public String findSalesManBusinessByLoginUser(Long hotelGroupId,Long hotelId,String userCode);
    
    public List<SalesManCompanyBirthDto> findCompanyBirth(Long hotelGroupId, Long hotelId, String userCode);
    
    public void updateSalesActiveBatch(List<String> ids, String auditRemark);
    
    public void deleteSalesFeedbackById(Long id);
    
    public void saveSalesFeedback(SalesFeedback salesFeedback);
    
    public List<SalesFeedback> listSalesFeedback(Long activityId);
    public List<SalesFeedbackDto> listSalesFeedbackSalesmanCompany(Long companyId, Long contactId, String salesman);
    
    public void saveSalesPlanRule(SalesPlanRule salesPlanRule);
    public void updateSalesPlanRule(SalesPlanRule salesPlanRule);
    public List<SalesActivity> deleteSalesPlanRule(SalesPlanRule salesPlanRule);
    public List<SalesPlanRule> listSalesPlanRule(Long hotelGroupId, Long hotelId);
    public String findSalesActivityOverview(Long hotelGroupId, Long hotelId, Long salesmanId, String year);
    public List<Map> findRedDay(Long hotelGroupId, Long hotelId, Long salesmanId, String year);
    @SuppressWarnings("rawtypes")
	public List<Map> findEffectActivity(Long hotelGroupId, Long hotelId, Long salesmanId, List<Date> days);
    @SuppressWarnings("rawtypes")
	public List<SalesActivity> findUnsureActivity(Long hotelGroupId, Long hotelId, Long salesmanId, List<Date> days);
    public List<SalesActivity> listSalesActivityByIds(String ids);
    public List<SalesActivity> listSalesActivityByPlanId(String planId);
    public List<SalesActivity> listSalesActivityByRuleId(String ruleId);
    
    public void saveSalesPlan(SalesPlan salesPlan);
    public void updateSalesPlan(SalesPlan salesPlan);
    public List<SalesActivity>  deleteSalesPlan(SalesPlan salesPlan);
    public void updateExecSalesPlanRule(SalesPlanRule salesPlanRule);
    public void updateExecSalesPlanRuleCompany(SalesPlanRule salesPlanRule, String companyId);
    public List<SalesPlan> listSalesPlan(Long hotelGroupId, Long hotelId, String auth);
    public List<SalesActivityPlanDto> findPlanTodo(Long hotelGroupId, Long hotelId, String userCode);
    public Container<Map> findBySalesmanSearchDto(SalesmanSearchDto guestSearchDto, Integer pageSize,Long sysListMetaId, Integer currentPage, String filterSql);
    
    /**
     * 销售员业绩转移
     * @param frSalesmanCode
     * @param toSalesmanCode
     */
    public void updateFrToClearFr(String frSalesmanCode, String toSalesmanCode);
    
    /**
     * 创建或修改销售员月报
     * @param hotelGroupId
     * @param hotelId
     * @param smp
     */
    public void saveOrUpdateSalesmanMonthlyReport(Long hotelGroupId,Long hotelId,SalesManMonthlyReport smp);
    
    public SalesManMonthlyReport findSalesManMonthlyReport(Long hotelGroupId,Long hotelId,SalesManMonthlyReport smp);
    
    /**
     * 统计酒店在year年month月,共多少销售员并查询有多少写了月报
     * </br>map.salesManCount 销售员数
     * </br>map.writedMonthlyReportCount 月报数
     * @param hotelGroupId
     * @param hotelId
     * @param year e.g 2014或者2015
     * @param month e.g 1或者2或者12
     * @return
     */
    public Map countSalesManWritedMonthlyReport(Long hotelGroupId, Long hotelId, String year,String month);
    
    /**
     * 集团下发销售员到门店
     * @param salesManBusiness
     * @param hotelIdArr
     */
    public void issuedSalesManToHotelsFrGroup(SalesManBusiness salesManBusiness, String hotelIdArr);
}
