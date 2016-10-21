package com.greencloud.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.aua.dao.IBaseDao;
import com.aua.util.Container;
import com.aua.util.SQLHelper;
import com.greencloud.dto.CRSQueryDto;
import com.greencloud.dto.CRSSyncObj;
import com.greencloud.dto.CrsResrvDto;
import com.greencloud.dto.CrsResrvSimpleDto;
import com.greencloud.dto.DoorcardMakeDto;
import com.greencloud.dto.DoorcardReadedDto;
import com.greencloud.dto.MasterBaseIdAndRoomDto;
import com.greencloud.dto.MasterChannelDto;
import com.greencloud.dto.MasterContinueStayDto;
import com.greencloud.dto.MasterGuestSimpleDto;
import com.greencloud.dto.MasterInterfaceSimpleDto;
import com.greencloud.dto.MasterLinkDto;
import com.greencloud.dto.MasterLinkOwnerSiteDot;
import com.greencloud.dto.MasterPoliceDto;
import com.greencloud.dto.MasterRoomClassDto;
import com.greencloud.dto.MasterSimpleInfoDto;
import com.greencloud.dto.MasterTaobaoDto;
import com.greencloud.dto.MasterWeChatDto;
import com.greencloud.dto.POSInterfaceFoDto;
import com.greencloud.dto.POSMasterEnquiryDto;
import com.greencloud.dto.PointRoomObj;
import com.greencloud.dto.PosInterfaceSearchDto;
import com.greencloud.dto.RoomInfoDto;
import com.greencloud.dto.RoomStaClassDto;
import com.greencloud.dto.SmartMasterBase;
import com.greencloud.dto.VolumeMasterDto;
import com.greencloud.dto.VolumnMasterLinkDto;
import com.greencloud.dto.YYMasterGuestDto;
import com.greencloud.dto.ZeroRateDto;
import com.greencloud.entity.CrsResrvSync;
import com.greencloud.entity.InterfaceCmd;
import com.greencloud.entity.MasterBase;
import com.greencloud.entity.RoomDayuseDefine;
import com.greencloud.entity.WebRmtypeAvailSync;

/**
 * operate Master into db
 * 
 * @author
 *@version 1.0
 *@date 2010-11-29 08:39
 */
public interface IMasterBaseDao extends IBaseDao {

	/**
	 *save master object method
	 * 
	 * @param master
	 *            Master
	 *@throws DataAccessException
	 *@author
	 *@version 1.0
	 *@date 2010-11-29 08:39
	 */
	public void save(MasterBase masterBase) throws DataAccessException;

	/**
	 *update master method
	 * 
	 * @param master
	 *            Master
	 *@throws DataAccessException
	 *@author
	 *@version 1.0
	 *@date 2010-11-29 08:39
	 */
	public void update(MasterBase master) throws DataAccessException;

	/**
	 *save or update master object method
	 * 
	 * @param master
	 *            Master
	 *@throws DataAccessException
	 *@author
	 *@version 1.0
	 *@date 2010-11-29 08:39
	 */
	public void saveOrUpdate(MasterBase masterBase) throws DataAccessException;

	/**
	 *query master collection method
	 * 
	 * @param master
	 *            Master send query vo
	 *@param firstResult
	 *@param maxResults
	 *@throws DataAccessException
	 *@author
	 *@version 1.0
	 *@date 2010-11-29 08:39
	 */
	public List<MasterBase> list(MasterBase masterBase, int firstResult,
			int maxResults) throws DataAccessException;

	/**
	 *query collection method
	 * 
	 * @param master
	 *            Master send query vo
	 *@throws DataAccessException
	 *@author
	 *@version 1.0
	 *@date 2010-11-29 08:3MasterBase
	 */
	public List<MasterBase> list(MasterBase masterBase)
			throws DataAccessException;

	/**
	 *query collection method
	 * 
	 * @param master
	 *            Master send query vo
	 *@throws DataAccessException
	 *@author
	 *@version 1.0
	 *@date 2010-11-29 08:3MasterBase
	 */
	public List<MasterBase> listGrp(MasterBase masterBase)
			throws DataAccessException;

	/**
	 * 根据给定的订单ID查询联房记录列表方法 这里是需要显示所有跟这个订单相关的订单。 
	 * 次序如下： 1、自己 id = masterId 
	 *           2、同住关系的 房号相同 
	 *           3、同一个预订号的 预订号相同 
	 *           4、联房的 linkId与pkgLinkId相同 
	 *           5、同一个团队的 团队Id相同
	 * @param hotelId			酒店ID
	 * @param hotelGroupId		集团ID
	 * @param masterId  		主单ID
	 * @param liveId 			同住ID
	 * @param linkId			 联房ID 相同则表示联房
	 * @param pkgLinkId			包价联房Id 相同则表示包价联房
	 * @param grpAccnt			团队号 相同则表示同一团队
	 * @param stas				状态列表(多个状态请使用','分隔)
	 * @param hasSelf			是否包含自己
	 * @param linkHasLive		联房列表是否包含同住(仅针对联房列表有效)
	 * @param linkHasGrp		联房列表是否包含同团队(需要查询团队列表时，请传true)
	 * @param hasResrv			是否检索预订单
	 * @param hasHistory		是否检索历史主单
	 * @return List<MasterLinkDto>
	 * @author Cairo
	 * @modify Cairo
	 * @modifyDate 2014-08-14
	 */
	public List<MasterLinkDto> listMasterBaseLink(Long hotelId,Long hotelGroupId,Long masterId,
			  Long liveId,Long linkId,Long pkgLinkId,Long grpAccnt,String stas,
			  boolean hasSelf,boolean linkHasLive,boolean linkHasGrp,boolean hasResrv,boolean hasHistory);

	/**
	 * 根据给定信息查询登记单联房信息列表
	 * 
	 * @param hotelGroupId      集团ID
	 * @param hotelId			酒店ID
	 * @param masterId			登记单ID
	 * @param liveId			同住ID
	 * @param linkId 			联房ID
	 * @param pkgLinkId         包价联房ID
	 * @param stas				状态列表(多个状态请使用','分隔)
	 * @param hasSelf			是否包含自己
	 * @param hasLive			是否包含同住人
	 * @param hasResrv			是否检索预订单
	 * @param hasHistory		是否检索历史主单
	 * @return List<MasterLinkDto>
	 * @modify Cairo
	 * @modifyDate 2014-08-19
	 */
	public List<MasterLinkDto> listMasterBaseLink(Long hotelGroupId,Long hotelId, Long masterId,Long liveId,
			Long linkId, Long pkgLinkId,String stas, Boolean hasSelf, Boolean hasLive,Boolean hasResrv,Boolean hasHistory);

	/**
	 * 根据给定登记单Id查询关系登记单数量
	 * 
	 * @param hotelGroupId
	 *            集团ID
	 * @param hotelId
	 *            酒店ID
	 * @param masterBaseId
	 *            登记单ID
	 * @param liveId
	 *            同住ID(MasterBase.masterId)
	 * @param linkId
	 *            联房ID
	 * @param pkgLinkId
	 *            包价联房ID
	 * @param grpAccnt
	 *            团队ID
	 * @return Integer
	 * @author Cairo
	 * @serialData 2011-03-31
	 */
	public Integer countMasterBaseList(Long hotelGroupId, Long hotelId,
			Long masterBaseId, Long liveId, Long linkId, Long pkgLinkId,
			Long grpAccnt);

	/**
	 * 根据给定条件查询订单列表 （综合排房界面使用）
	 * 
	 * @param startDate
	 *            到达时间
	 * @param rmType
	 *            房类
	 * @param rsvNo
	 *            房号
	 * @param name
	 *            姓名
	 * @param companyId
	 *            公司Id
	 * @param isOlnyVip
	 *            是否只查询VIP记录
	 * @param hasAmenities
	 *            是否只查询有客房布置要求的记录
	 * @param hasPointsRoom
	 *            是否包含已分房记录
	 * @param hasCheckIn
	 *            是否包含已入住记录
	 * @param hotelGroupId
	 *            集团Id
	 * @param hotelId
	 *            酒店Id
	 * @return List<MasterListDot> 符合条件记录
	 * @author Cairo
	 * @serialData 2011-03-04
	 */
	public List<MasterLinkDto> findMasterList(Date startDate, String rmType,
			String rsvNo, String name, String companyId, Boolean isOlnyVip,
			Boolean hasAmenities, Boolean hasPointsRoom, Boolean hasCheckIn,
			Long hotelGroupId, Long hotelId);

	/**
	 *count obj amount
	 * 
	 * @param master
	 *            Master query vo
	 *@throws DataAccessException
	 *@author
	 *@date 2010-11-29 0MasterBase
	 */
	public int count(MasterBase masterBase) throws DataAccessException;

	/**
	 *query a master by id
	 * 
	 * @param id
	 *@throws DataAccessException
	 *@author
	 *@datMasterBase-11-29 08:39
	 */
	public MasterBase load(Long id) throws DataAccessException;

	/**
	 * 
	 * @param roomNo
	 * @param hotelGroupId
	 * @param hotelId
	 * @param date
	 * @param days
	 * @return
	 */
	public List<MasterSimpleInfoDto> findMastSimpleInfoDtos(String roomNo,
			Long hotelGroupId, Long hotelId, Date date, Integer days);

	/**
	   * 查询订单同住人集合 
	   * @param masterId			订单Id
	   * @param liveId				同住ID
	   * @param hotelGroupId		集团Id
	   * @param hotelId				酒店Id
	   * @param rmno				房号
	   * @param hasSelf				是否包含自己信息(T/F)
	   * @param stas				登记单状态（可选，没有请传null，多个状态使用','分隔）
	   * @param hasHistory			是否历史记录
	   * @return List<MasterLinkDto>
	   * @modifa Cairo
	   * @modifyDate 2014-08-12
	   * @modifyRemark 此处修改，为了优化sql检索效率
	   */
	  public List<MasterLinkDto> findMasterLiveList(Long masterId,Long liveId,String rmno,
			  Long hotelGroupId,Long hotelId,Boolean hasSelf,String stas,Boolean hasHistory);

	/**
	 * 批量更新订单表占用资源ID
	 * 
	 * @param rsvOccIds
	 *            要被更改的占用资源ID
	 * @param id
	 *            新的占用资源ID
	 */
	public void updateOccIds(List<Long> rsvOccIds, Long id);

	/**
	 * 查询市场码来源码缺失主单数量
	 * @param hotelGroupId	集团Id
	 * @param hotelId		酒店Id
	 * @author Cairo 
	 * @serialData 2011-03-02
	 */
	public Integer findInfoMissingMasterList(Long hotelGroupId, Long hotelId);

	/**
	 * 根据时间与姓名查询Wait-List订单列表
	 * 
	 * @param date
	 *            时间
	 * @param name
	 *            姓名
	 * @param hotelGroupId
	 *            集团Id
	 * @param hotelId
	 *            酒店Id
	 * @return list<Map> object结果列表
	 * @author Cairo
	 * @serialData 2011-03-03
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> findWaitListMaster(Date date, String name,
			Long hotelGroupId, Long hotelId);

	public String getIsSureRate(Long masterId, Long hotelId, Long hotelGroupId);

	public void setSureRate(Long masterId, String isSureRate, Long hotelId,
			Long hotelGroupId);

	/**
	 * 夜审更新所有定单状态
	 * 
	 * @param hotelGroupId
	 *            酒店集团ID
	 * @param hotelId
	 *            酒店ID
	 * @return 影响的行数
	 */
	public int updateAllTmSta(Long hotelGroupId, Long hotelId);

	/**
	 * 资源重建
	 * 
	 * @param hotelGroupId
	 *            酒店集团ID
	 * @param hotelId
	 *            酒店ID
	 * @return 资源
	 */
	public List<MasterBase> findMasterBase(Long hotelGroupId, Long hotelId);

	/**
	 * 根据房号查找相应的钟点房
	 * 
	 * @param roomno
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	public List<MasterBase> findPartTimeRoomByRoomNo(String roomno,
			Long hotelGroupId, Long hotelId);

	/**
	 * 根据预订单Id或团队主单Id查询成员登记单列表
	 * @param resrvId				预订单Id(可选，没有请传null)
	 * @param grpAccnt				团队主单Id(可选，没有请传null)
	 * @param hotelGroupId			集团ID
	 * @param hotelId				酒店Id
	 * @param stas					状态集合(可选，多个状态请使用逗号","分隔)
	 * @return Integer				
	 * @author Cairo
	 * @date 2011-03-28
	 * @modify Cairo
	 * @modifyDate 2013-06-08
	 */
	public Integer findMasterBaseSizeByResrvIdOrGrpAccnt(Long resrvId,
			Long grpAccnt,Long hotelGroupId,Long hotelId,String stas);

	/**
	 * 根据登记单Id查询同住人数
	 * @param liveId				登记单同住ID
	 * @param rmNo					房号
	 * @param excludeMasterIds		需要排除的登记单ID
	 * @param hotelGroupId			集团Id
	 * @param hotelId				酒店ID
	 * @return Integer
	 * @author Cairo
	 * @serialData 2011-04-01
	 */
	public Integer findMasterBaseLivePeopleSize(Long liveId,String rmNo,List<Long> excludeMasterIds,Long hotelGroupId,Long hotelId);

	/**
	 * 根据房号查询相关登记单信息列表
	 * @param arrDate			到日
	 * @param depDate			离日
	 * @param rmNo				房号
	 * @param rsvClass 			登记单类型
	 * @param stas				登记单状态(多个状态使用','分隔)
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return	List<MasterRoomDto>
	 * @author Cairo
	 * @serialData 2011-10-25
	 */
	public List<MasterLinkDto> findMasterByRoomNo(Date arrDate,Date depDate,String rmNo,
			String rsvClass,String sta,Long hotelGroupId,Long hotelId);

	/**
	 * 根据给定房号，查询是否该房号未来有预定
	 * 
	 * @param roomNo
	 *            房号
	 * @param hotelGroupId
	 *            集团ID
	 * @param hotelId
	 *            酒店ID
	 * @return Boolean
	 * @author Cairo
	 * @serialData 2011-04-14
	 */
	public Boolean findRoomNoIsFuture(String roomNo, Long hotelGroupId,
			Long hotelId);

	/**
	 * 根据给定营业日期，查询登记单列表
	 * 
	 * @param masterBase
	 *            登记对象
	 * @return List<MasterBase>
	 * @author Cairo
	 * @serialData 2011-04-18
	 */
	public List<MasterBase> findMasterByBizDate(MasterBase masterBase);

	/**
	 * 查找所有主登记单
	 * 
	 * @param hotelGroupId
	 *            酒店集团ID
	 * @param hotelId
	 *            酒店ID
	 * @return 查找到列表
	 */
	public List<MasterBase> findAllMasterBase(Long hotelGroupId, Long hotelId);

	/**
	 * 根据团队登记Id查询成员登记单列表
	 * @param masterGroupId			团队登记Id
	 * @param condition				查询条件（姓名，房号，预订人，预订号）
	 * @param hasResrv				是否包含预定成员
	 * @param hotelGroupId			集团Id
	 * @param hotelId				酒店Id
	 * @param firstResult			记录开始序号
	 * @param maxResults			结果集大小
	 * @return List<MasterLinkDto>
	 * @author Cairo
	 * @serialData 2011-03-14
	 */
	public List<MasterLinkDto> findMasterByMasterGroupId(Long masterGroupId, String condition, Boolean hasResrv, 
			Long hotelGroupId, Long hotelId, int firstResult, int maxResults);

	/**
	 * 根据团队ID查询
	 * 
	 * @param masterGroupId
	 *            团队登记单ID
	 * @param condition
	 *            条件
	 * @param stas
	 *            状态列表（多个状态间用“-”分隔，忽略请传""）
	 * @param hotelGroupId
	 *            酒店ID
	 * @param hotelId
	 *            团队ID
	 * @return Integer
	 * @author Cairo
	 * @serialData 2011-04-25
	 */
	public Integer findMasterCountByGroupId(Long masterGroupId,
			String condition, String stas, Long hotelGroupId, Long hotelId);

	public void updateMasterCreitById(Long id, String payCode, String limitAmt,
			String creditNo,String type);

	public List<MasterRoomClassDto> findMasterBaseByrmno(String rmno,
			Long hotelGroupId, Long hotelId);

	public List<RoomDayuseDefine> findRoomDayuseDefine(Long hotelGroupId,
			Long hotelId);

	/**
	 * 更新登记单房数及人数
	 * 
	 * @param masterBaseId
	 *            登记单ID
	 * @param resrvBaseId
	 *            预订单Id
	 * @param rsvClass
	 *            预订单类型
	 * @param hotelGroupId
	 *            集团ID
	 * @param hotelId
	 *            酒店ID
	 * @return void
	 * @author Cairo
	 * @serialData 2011-05-12
	 */
	public void updateMasterBaseRmNumAndAdult(Long masterBaseId,
			Long resrvBaseId, String rsvClass, Long hotelGroupId, Long hotelId);

	/**
	 * 根据房号,返回帐号
	 * 
	 * @param roomNo
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	public MasterBase findMasterAccntByRoomNo(String roomNo, Long hotelGroupId,
			Long hotelId);

	/**
	 * 根据房号，查找当前在住的帐户I集合
	 * 
	 * @param hotelGroupId
	 *            酒店集团ID
	 * @param hotelId
	 *            酒店ID
	 * @param rmno
	 *            房号
	 * @return 帐户Ids集合
	 */
	public List<Long> findMasterBase(Long hotelGroupId, Long hotelId,
			String rmno);

	public List<RoomStaClassDto> findRoomStaClassDtoByRoomNo(String roomNo,
			Long hotelGroupId, Long hotelId);
	
	/**
	 * 根据给定的大房号及子房号记录查询在住宾客信息
	 * @param parentCode		大房号
	 * @param rmnoSon			子房号
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return List<RoomStaClassDto>
	 * @author Cairo
	 * @date 2013-10-15
	 */
	public List<RoomStaClassDto> findRoomStaClassDtoByParentRmnoAndRmnoSon(String parentCode,String rmnoSon,Long hotelGroupId, Long hotelId);

	// =====================================================================================
	// ======================================王文华=======================================
	// ====================================================================================
	public MasterBase findGrpAccnt(Long resrvBaseId, Long hotelGroupId,
			Long hotelId);
	void updateGrpAccntAuditNum(Long resrvBaseId, Long hotelGroupId,
			Long hotelId);

	public List<MasterBase> findSampeMasterId(Long masterId, Long rmoccId,
			Long hotelGroupId, Long hotelId);

	public MasterBase findMasterBaseByResrvBaseId(Long resrvBaseId,
			Long hotelGroupId, Long hotelId);

	@SuppressWarnings("rawtypes")
	public List<Map> findShareByMasterBaseId(Long id, Long masterBaseId,
			Long hotelGroupId, Long hotelId);

	public List<MasterBase> findMasterBaseByRsvSrc(Long rsvsrcId,
			Long hotelGroupId, Long hotelId);

	public MasterContinueStayDto findMasterContinueStaySelf(Long masterBaseId,
			Long hotelGroupId, Long hotelId);

	public List<MasterContinueStayDto> findMasterContinueStayShare(
			Long masterBaseId, Long masterId, Long hotelGroupId, Long hotelId);

	public List<MasterContinueStayDto> findMasterContinueStayShare(
			Long masterBaseId, Long masterId, Long linkId, Long hotelGroupId,
			Long hotelId);

	public void updateRoomStautsDep(String type, String rmno,
			Long hotelGroupId, Long hotelId);
	
	/**
	 * 查询符合条件的R状态成员登记单记录
	 * 注意：此方法用于R状态成员登记单夜审转储过程，其他位置请慎用！
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return List<MasterBase>
	 * @author Cairo
	 * @date 2013-06-25
	 */
	public List<MasterBase> findMasterBaseByBizDate(Date bizDate,Long hotelGroupId,Long hotelId);

	/**
	 * 夜审时当前夜审主单数据需要移到临时表
	 * @param type			转储类型 (RESRV:预订;MASTER:登记)
	 * @param bizDate		营业日期
	 * @param hotelId		酒店ID
	 * @param hotelGroupId	集团ID
	 * @author Cairo
	 */
	public void saveMasterBaseToAuditData(String type,Date bizDate, Long hotelId,Long hotelGroupId);
	/**
	 * 生成master_Base_history数据
	 * @param hotelId
	 * @param hotelGroupId
	 */
	public void saveMasterBaseHistory(Long hotelId, Long hotelGroupId);
	/**
	 * 清理masterAudit夜审临时表数据 
	 * @param hotelId		酒店ID
	 * @param hotelGroupId	集团ID
	 */
	public void deleteMasterAudit(Long hotelId, Long hotelGroupId);

	/**
	 * 删除masterBase表中的已移向临时表的数据
	 * @param hotelId
	 * @param hotelGroupId
	 */
	public void deleteMasterBaseOnHistory(Date bizDate, Long hotelId,
			Long hotelGroupId);
	
	/**
	 * 自动NoShow预订单记录
	 * @param type				NoShow类型（1：按天，0：全部）
	 * @param bizDate			营业日期
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return void
	 * @author Cairo
	 * @date 2012-06-06
	 */
	public void updateMasterNoShow(String type,Date bizDate,Long hotelGroupId,Long hotelId);
	/**
	 * NoShow失效的(抵离日期为同一天)预订单资源记录
	 * @param type				NoShow类型（1：按天，0：全部）
	 * @param bizDate			营业日期
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return void
	 * @author Cairo
	 * @date 2012-06-06 
	 */
	public void updateNoShowInvalidMasterBase(String type,Date bizDate,Long hotelGroupId,Long hotelId);
	/**
	 * 夜审时当前夜审主单数据需要移到临时表
	 * @param bizDate			营业日期
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return void
	 * @author Cairo
	 * @date 2012-06-06
	 */
	public void saveMasterBaseToHistory(Date bizDate,Long hotelId,Long hotelGroupId);

	public int getRmbDone(List<Long> ids, Long hotelId, Long hotelGroupId);

	/**
	 * 根据快捷条件查询当前登记单列表
	 * 
	 * @param subSql
	 *            过滤条件（房号、姓名、预定号）
	 * @param hotelGroupId
	 *            集团ID
	 * @param hotelId
	 *            酒店ID
	 * @return
	 */
	public List<MasterLinkDto> findMasterByQuickConditions(String subSql,
			Long hotelGroupId, Long hotelId);

	/**
	 * @Title: findresrvMasterSize
	 * @Description:查找预订单对应的登记单数
	 * @param resrvId
	 * @return
	 * @author CZ
	 * @date 2011-7-18 下午02:14:47
	 */
	public Integer findresrvMasterSize(Long resrvId);

	/**
	 * 返回零房价的主单
	 * 
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	public List<ZeroRateDto> findZeroRate(Long hotelGroupId, Long hotelId,
			Date bizDate);

	/**
	 * 根据resrvid和状态查找masterBase ，stas用逗号分开
	 * @param rsvId				预订主单ID
	 * @param stas				状态集合（可选，多个状态请使用','分隔）
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @param hasSelf			是否保护自己
	 * @return List<MasterBase>
	 * @author Cairo
	 * @Date 2013-06-17
	 */
	public List<MasterBase> findMasterBaseByResrvId(Long rsvId, String stas,Long hotelGroupId,Long hotelId,boolean hasSelf);
	/**
	 * @Title: findMasterBaseByResrvId
	 * @Description:根据resrvid和状态查找resrvbase ，stas用逗号分开
	 * @param resrvId
	 * @param stas
	 * @return
	 * @author CZ
	 * @date 2011-7-28 上午10:15:16
	 */
	public int countMasterBaseByGrpAccnt(Long hotelGroupId,Long hotelId,Long resrvId, String stas);

	/**
	 * @Title: findMaserByLiveIdRmno
	 * @Description:查找同住主单 看今天有没有人住
	 * @param resrvId
	 * @param arrDate
	 * @param rmno
	 * @return
	 * @author CZ
	 * @date 2011-8-16 上午10:54:46
	 */
	public MasterBase findMaserByLiveIdRmno(Long liveId, String rmno,Long hotelGroupId,Long hotelId);

	/**
	 * 更新联房用户ExtraFlag标识方法
	 * 
	 * @param subExtraFlag
	 *            需要更新的某一位ExtraFlag
	 * @param subExtraFlagIndex
	 *            需要更新的位数(1-30)
	 * @param linkId
	 *            联房ID
	 * @param pkgLinkId
	 *            包价联房ID
	 * @param hotelGroupId
	 *            是否同步更新联房用户
	 * @param hotelId
	 *            是否同步更新同团队用户
	 * @return Booblen
	 * @author Cairo
	 * @serialData 2011-08-12
	 */
	public Boolean updateLinkExtraFlag(String subExtraFlag,
			int subExtraFlagIndex, Long linkId, Long pkgLinkId,
			Long hotelGroupId, Long hotelId);

	/**
	 * 更新联房用户ExtraFlag标识方法
	 * 
	 * @param subExtraFlag
	 *            需要更新的某一位ExtraFlag
	 * @param subExtraFlagIndex
	 *            需要更新的位数(1-30)
	 * @param grpAccnt
	 *            团队ID
	 * @param hotelGroupId
	 *            是否同步更新联房用户
	 * @param hotelId
	 *            是否同步更新同团队用户
	 * @return Booblen
	 * @author Cairo
	 * @serialData 2011-08-12
	 */
	public Boolean updateGrpExtraFlag(String subExtraFlag,
			int subExtraFlagIndex, Long grpAccnt, Long hotelGroupId,
			Long hotelId);
	
	/**
	 * 更新给定登记单ExtraFlag标识方法
	 * @param subExtraFlag			需要更新的某一位ExtraFlag
	 * @param subExtraFlagIndex		需要更新的位数(1-30)
	 * @param masterBaseId			登记单ID
	 * @param hotelGroupId			集团ID
	 * @param hotelId				酒店ID
	 * @return Booblen
	 * @author Cairo
	 * @serialData 2011-08-12
	 */
	public void updateMasterExtraFlag(String subExtraFlag,int subExtraFlagIndex,
			Long masterBaseId,Long hotelGroupId,Long hotelId);

	/**
	 * 每日房价查询同住ID专用
	 * 
	 * @param masterId
	 * @param beginDate
	 * @param endDate
	 * @param hotelId
	 * @param hotelGroupId
	 * @return
	 */
	public List<BigInteger> findLiveIdForDailyRate(Long masterId,
			Date beginDate, Date endDate, Long hotelId, Long hotelGroupId);

	/**
	 * 根据id查询masterBase
	 * 
	 * @param masterId
	 * @param hotelId
	 * @param hotelGroupId
	 * @return
	 */
	public MasterBase findMasterBaseById(Long masterId);

	/**
	 * 根据房号组查询相关联房
	 * 
	 * @param rmNo
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	public List<VolumnMasterLinkDto> findLinkIdByRoomNo(String rmNo,
			Long hotelGroupId, Long hotelId);
	/**
	 * 根据id查联房房间发卡信息
	 * 
	 * @param id
	 * @author zjw ----这个不用加Long hotelGroupId, Long hotelId,但加了会快点么
	 */
	public List<DoorcardMakeDto> findDoorcardInfo(Long hotelGroupId, Long hotelId,Long linkId,Long resrvId);
	/**
	 * 根据id查联房房间发卡信息
	 * 
	 * @param id
	 * @author zjw ----这个不用加Long hotelGroupId, Long hotelId,但加了会快点么
	 */
	public List<DoorcardMakeDto> findDoorcardInfoOfCheckINByResrv(Long hotelGroupId, Long hotelId,Long resrvId,String sta);

	/****
	 * 根据姓名查询单号，时间等信息，智能搜索中用
	 * @return
	 */
	public List<SmartMasterBase> findMasterByName(String sysStr,String str,
			boolean isResrv,Long hotelId,Long hotelGroupId);

	/****
	 * 根据协议单位名字 查询智能搜索中登记单
	 * @return
	 */
	public List<SmartMasterBase> findMasterByCompanyName(String companyName,Long hotelId,
			Long hotelGroupId);
	/****
	 * 根据传入字符串模糊搜索 名字，账号 或者 房号
	 *  
	 *   @author zjw----
	 */
	public List<POSMasterEnquiryDto> findPosInfo(PosInterfaceSearchDto dto,String isOSearch,String isLinkSearch,Date bizDate);
	/****
	 * 根据传入字符串查询账号
	 *  
	 *   @author zjw----
	 */
	public List<POSMasterEnquiryDto> findPosInfoGroup(PosInterfaceSearchDto dto);
	
	/**
	 * 查询预订单联房信息集合大小
	 * @param resrvBaseId			预订单ID
	 * @param linkId				联房ID
	 * @param pkgLinkId				包价联房ID
	 * @param hasSelf				是否统计包含自己
	 * @param hasMaster				是否统计包含登记
	 * @param hasResrv              是否统计预订单
	 * @param hasHistory			是否统计历史
	 * @param stas					状态列表(多个状态使用','分隔)
	 * @param hotelGroupId			集团ID
	 * @param hotelId				酒店ID
	 * @return Integer
	 * @author Cairo
	 * @serialData 2012-01-05
	 * @modify Cairo
	 * @modifyDatetime 2014-08-20
	 */
	public Integer findResrvBaseLinkSize(Long resrvBaseId,Long linkId,Long pkgLinkId,Boolean hasSelf,
			Boolean hasMaster,Boolean hasResrv,Boolean hasHistory,String stas,Long hotelGroupId,Long hotelId);
	
	/**
	 * 更新其他同住人同住ID
	 * @param liveId				同住ID
	 * @param shareMasterBaseIds	需要排除的同住人Id列表
	 * @param hotelGroupId			集团ID
	 * @param hotelId				酒店ID
	 */
	public void updateMasterLiveId(Long liveId,List<Long> shareMasterBaseIds,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据登记单号查询相关子团体成员，或者相关连房
	 * @param id		登记单ID
	 * @param rsvClass	登记单类型
	 * @author yangduo
	 * @serialData 2012-3-22
	 */
	public List<MasterBaseIdAndRoomDto> findMasterBaseIdAndRoomDtoById(Long id,String rsvClass,Long grpAccnt,Long linkId,Long hotelGroupId,Long hotelId);

	/**
	 * 根据给定条件，输出批量处理查询sql
	 * @param masterIds		登记单ID列表，多个ID之间使用","分隔
	 * @param stas		          状态列表，默认一般是("R,I")
	 * @param type			查询模式（R:预订单查询；G:团队查询；F:ID列表查询）
	 * @param hotelGroupId	集团ID
	 * @param hotelId		酒店ID
	 */
	public List<VolumeMasterDto> findVolumeMasterDtoByMasterIds(String masterIds,
			String rsvClasses,String stas,String type,Long hotelGorupId,Long hotelId);
	
	/**
	 * 根据给定团队ID查询指定状态成员数量
	 * @param groupId				预订单ID
	 * @param stas					登记单状态
	 * @param hotelGroupId			集团ID
	 * @param hotelId				酒店ID
	 * @return Integer
	 * @author Cairo
	 * @date 2012-05-28
	 */
	public Integer findMasterBaseNumGroupId(Long groupId,String stas,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定条件，查询符合条件的在住同住主登记单记录
	 * @param rsvClass			登记单类型
	 * @param sta				登记单状态
	 * @param masterId			同住ID
	 * @param rmNo				房号
	 * @param occId				资源占用ID
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return MasterBase
	 * @author Cairo
	 * @date 2012-04-23
	 */
	public MasterBase findLiveMainMasterBase(String rsvClass,String sta,Long masterId,
			String rmNo,Long occId,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定条件更新同住ID
	 * @param oldMasterId		原有同住ID
	 * @param masterId			新的同住ID
	 * @param rmno				房号
	 * @param occId				资源占用ID(没有请传NULL)
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return void
	 * @author Cairo
	 * @date 2012-04-24
	 */
	public void updateMasterIdByOldMasterId(Long oldMasterId,Long masterId,
			String rmno,Long occId,Long hotelGroupId,Long hotelId);
	
	public List<MasterBase> listOrderBySta(MasterBase masterBase)throws DataAccessException;
	
	public List<MasterBase> listCreditGuestNameIdno(MasterBase tmp);
	
	/**
	 * 根据给定房号及同住ID，查询同住人列表
	 * @param masterId
	 * @param rmno
	 * @param sta
	 * @param filterId
	 * @param hotelGroupId
	 * @param hotelId
	 * @return List<MasterBase>
	 * @author Cairo
	 * @param filterId 
	 * @date 2012-08-07
	 */
	public List<MasterBase> findMasterBaseByLiveIdAndRmno(Long masterId, String rmno, String sta, Long filterId, Long hotelGroupId, Long hotelId);
	
	/**
	 * 根据给定房号及同住ID，查询同住人列表
	 * @param rmno				房号
	 * @param rRmno				需要排除的房号
	 * @param liveId			同住ID
	 * @param rLiveId			需要排除的同住ID
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return List<MasterBase>
	 * @author Cairo
	 * @date 2012-08-07
	 */
	public List<MasterBase> findMasterBaseByLiveIdAndRmno(String rmno,String rRmno,Long liveId,Long rLiveId,Long hotelGroupId,Long hotelId);
	/**
	 * zhaojw  查找在住客人
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	public List<MasterBase> listMasterBaseStaI(Long hotelGroupId,Long hotelId);
	public List<MasterBase> listMasterBaseStaIForPos(Long hotelGroupId,Long hotelId,Date date);
	/**
	 * 获得同住人信息
	 * @param hotelGroupId
	 * @param hotelId
	 * @param rmno
	 * @return
	 */
	public List<Long> listSameRoomId(Long hotelGroupId,Long hotelId,String rmno);
	/**
	 * 获得本酒店所有在住账号
	 * @param hotelGroupId
	 * @param hotelId
	 * @param rmno
	 * @return
	 */
	public List<Long> listroomAccntStaI(Long hotelGroupId,Long hotelId);
	/**
	 * 
	 * @param hotelGroupId
	 * @param hotelId
	 * @param rmno
	 * @return
	 */
	public List<DoorcardReadedDto> findCheckInGuest(Long hotelGroupId,Long hotelId,String rmno);
	
	/**
	 * 根据给定连房ID及包价连房ID，查询连房列表
	 * @param linkId			连房ID
	 * @param pkgLinkId			包价连房ID
	 * @param masterId			同住人ID
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return List<MasterBase>
	 * @author Cairo
	 * @date 2012-10-26
	 */
	public List<MasterBase> findLinkMasterByLinkIdAndPkgLinkId(Long linkId,Long pkgLinkId,Long masterId,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定登记单id查询登记单记录
	 * @param id		登记单记录ID
	 * @return MasterBase
	 * @author Cairo
	 * @date 2012-12-17
	 */
	public MasterBase findMasterById(Long id);
	public List<InterfaceCmd> findMasterByDate(Long hotelGroupId,Long hotelId,Date date);
	public List<MasterBase> findByRomnStaI(String rmno,Long hotelGroupId,Long hotelId,Long filterId);
	public String getExterFlag(MasterBase mb,String num);
	
	
	/**
	 * 根据预订单Id查询成员登记单列表
	 * @param masterBaseId 	预订单Id
	 * @param stas 			状态(可选，多个状态间请使用','分隔)
	 * @param condition 	查询条件（姓名，房号，预订人，预订号）
	 * @param inHistory 	是否查历史
	 * @param hotelGroupId 	集团Id
	 * @param hotelId 		酒店Id
	 * @param firstResult	 记录开始序号
	 * @param maxResults 	结果集大小
	 * @return List<MasterLinkDto>
	 * @author Cairo
	 * @serialData 2013-05-07
	 */
	public List<MasterLinkDto> findMasterByResrvBaseId(Long masterBaseId,String stas,
			String condition, boolean inHistory, Long hotelGroupId, Long hotelId, int firstResult, int maxResults);
	
	/**
	 * 根据给定条件，查询预订单成员记录列表
	 * （已分房未入住，且不能为假房，用于预订单门卡发卡功能）
	 * @param masterBaseId					预订主单ID
	 * @param doorcardResrvTodayOnly		预订只能发本日的卡
	 * @param hotelGroupId					集团ID
	 * @param hotelId						酒店ID
	 * @param firstResult 					记录开始序号
	 * @param maxResults 					结果集大小
	 * @return List<DoorcardMakeDto>
	 * @author Cairo
	 * @date 2013-05-16
	 */
	public List<DoorcardMakeDto> findDoorcardInfoByMasterId(Long masterBaseId,String doorcardResrvTodayOnly,
			Long hotelGroupId,Long hotelId, int firstResult, int maxResults);

	/**
	 * 根据登记单ID集合查找登记单列表
	 * @param masterBaseIds
	 * @return
	 */
	public List<MasterBase> listMasterBaseById(List<Long> masterBaseIds);
	
	/**
	 * 根据给定预订单ID及资源标记查询纯预留记录数量
	 * @param masterBaseId			预订单ID
	 * @param occFlag				资源标记(RsvSrc.OccFlag)
	 * @param hotelGroupId			集团ID
	 * @param hotelId				酒店ID
	 * @return Integer
	 * @author Cairo
	 * @date 2013-06-20
	 */
	public Integer findRsvSrcNumByMasterBaseId(Long masterBaseId,String occFlag,Long hotelGroupId,Long hotelId);
	/**
	 * 根据给定预订单ID及状态查询对应状态成员数量
	 * @param masterBaseId			预订单ID
	 * @param stas					状态列表(可选,没有请传null,多个状态请使用","分隔)(MasterBase.Sta)
	 * @param hotelGroupId			集团ID
	 * @param hotelId				酒店ID
	 * @return Integer
	 * @author Cairo
	 * @date 2013-06-20
	 */
	public Integer findMemberNumMasterBaseId(Long masterBaseId,String stas,Long hotelGroupId,Long hotelId);

	/**
	 * 根据中央预订单，查询预定主单记录
	 * @param rsvClass 		主单类型（F/G）
	 * @param crsNo			中央预定号
	 * @param hotelGroupId  集团ID
	 * @param hotelId		酒店ID
	 * @return MasterBase
	 * @author Cairo
	 * @date 2014-03-12
	 */
	public MasterBase findResrvBaseByCrsNo(String rsvClass,String crsNo,Long hotelGroupId,Long hotelId);

	/**
	 * 根据给定预订单号，更新其所有预定成员信息预订单号为新预订单号
	 * @param oldRsvId
	 * @param oldRsvNo
	 * @param newRsvId
	 * @param newRsvNo
	 * @param hotelGroupId
	 * @param hotelId
	 */
	public void updateRsvIdAndRsvNoByOldRsvIdAndRsvNo(Long oldRsvId, String oldRsvNo, Long newRsvId, String newRsvNo, Long hotelGroupId, Long hotelId);
	
	/**
	 * 房态图快速入住操作，查询给定房号预抵登记单记录
	 * 如没有或有多条记录，直接返回null
	 * @param rmno				预订号
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return List<PointRoomObj>
	 * @author cairo
	 * @date 2013-08-03
	 */
	public List<PointRoomObj> findPointRoomDtoByRmno(String rmno,Long hotelGroupId,Long hotelId);
	public List<BigInteger> findPrePareToNoshowId(Date bizDate, Long hotelGroupId,
			Long hotelId);
	
	/**
	 * 根据给定房号、类型、状态及日期信息，查询符合条件的登记单记录
	 * @param rmno			房号
	 * @param rsvClass		类型
	 * @param sta			状态
	 * @param arrDate		到日
	 * @param depDate		离日
	 * @param hotelGroupId	集团ID
	 * @param hotelId		酒店ID
	 * @return MasterBase
	 * @author cairo
	 * @date 2013-08-21
	 */
	public MasterBase findMasterBaseByRmnoAndDate(String rmno,String rsvClass,String sta,
			Date arrDate,Date depDate,Long hotelGroupId,Long hotelId);

	/**
	 * 查询登记单关联的预定成员,联房或团队成员
	 * @param rsvId			预订单ID
	 * @param grpAccnt		团队ID
	 * @param linkId		联房ID
	 * @param hotelGroupId	集团ID
	 * @param hotelId		酒店ID
	 * @return
	 */
	public List<MasterBase> listMasterBaseByResrvOrGrpOrLink(Long rsvId,
			Long grpAccnt, Long linkId, Long hotelGroupId, Long hotelId);
	
	/**
	 * 根据给定房号在住宾客信息列表
	 * @param rmno				房号
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return List<RoomInfoDto>
	 * @author Cairo
	 * @date 2013-09-18
	 */
	public List<RoomInfoDto> findMasterInfoByRmno(String rmno,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定大房号及子房号在住宾客信息列表
	 * @param parentCode		大房号
	 * @param rmnoSon				子房号
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return List<RoomInfoDto>
	 * @author Cairo
	 * @date 2013-09-18
	 */
	public List<RoomInfoDto> findMasterInfoByParentRmnoAndRmnoSon(String parencCode,String rmnoSon,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定房号及LinkId查询连房房号列表
	 * @param rmno			房号
	 * @param linkId		连房ID
	 * @param pkgLinkId		包价连房ID
	 * @param hotelGroupId	集团ID
	 * @param hotelId		酒店ID
	 * @return String
	 * @author Cairo
	 * @date 2013-09-18
	 */
	public String findLinkRmnoByRmnoAndLinkId(String rmno,Long linkId,Long pkgLinkId,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定条件，查询预订单及其成员登记单记录集合
	 * 用于Block Pick模块
	 * @param masterBaseId			预订主单ID
	 * @param hotelGroupId			集团ID
	 * @param hotelId				酒店ID
	 * @return List<MasterLinkDto>
	 * @author Cairo
	 * @date 2013-10-22
	 */
	public List<MasterLinkDto> findResrvLinkListByResrvId(Long masterBaseId,Long hotelGroupId,Long hotelId);
	
	public String updateMasterInfoStrByProc(Long hotelGroupId, Long hotelId,
			Long accnt);
	
	
	/**
	 * 根据给定条件，查询存在有效信用记录的主单记录
	 * 用于无效信用记录清理夜审过程
	 * @param stas				主单状态集合，多个状态中使用','分隔
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return List<MasterBase>
	 * @author Cairo
	 * @date 2013-11-25
	 */
	public List<MasterBase> findInvalidCreditMasterList(String stas,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定房号，查询房号住客详细信息
	 * @param rmno
	 * @param hotelGroupId
	 * @param hotelId
	 * @return String
	 * @author Cairo
	 * @date 2013-11-27
	 */
	public String updateMasterInfoByProc(final String rmno,final Long hotelGroupId,final Long hotelId);

	/**
	 * 统计预订单房间占用数量
	 * @param accnt
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	public List<MasterBase> findByRmno(Long hotelGroupId,Long hotelId,String rmno,Date bizDate);
	public int findResrvRoomNoByResrvBaseId(Long accnt, Long hotelGroupId, Long hotelId);


	/**
	 * 统计预定单占用房数、人数
	 * @param accnt
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	public void updateRmnumAndAudltByResrvBaseId(Long accnt, Long hotelGroupId, Long hotelId);
	
	/**
	 * 验证给定房号在指定时间段内是否存在预排情况
	 * @param rmno			房号
	 * @param arrDate		开始时间
	 * @param depDate		离开时间
	 * @param masterId		需要过滤的同住ID
	 * @param hotelGroupId	集团ID
	 * @param hotelId		酒店ID
	 * @return boolean
	 * @author chenwu
	 * @date 2012-10-16
	 */
	public boolean checkResrvRmnoOcc(String rmno,Date arrDate,Date depDate,Long masterId,Long hotelGroupId,Long hotelId);
	/**
	 * 
	 */
	public List<MasterBase> findBreakFastRmno(String rmno,Date bizDate,Long hotelGroupId,Long hotelId);

	/**
	 * 根据预定号查预订单
	 * @param rsvNo
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	public MasterBase findMasterBaseByRsvNo(String rsvNo, Long hotelGroupId,
			Long hotelId);
	
	/**
	 * 根据给定条件查询当前在住登记单列表
	 * 注意：此方法暂时仅适用于夜审每日房价变更过程，其他位置请慎用
	 * @param rsvClass		主单类型(F：散客/成员;D：钟点房)
	 * @param stas			状态集合(多选，多个状态请使用','分隔)
	 * @param rsvDate		业务日期
	 * @param hotelGroupId	集团ID
	 * @param hotelId		酒店ID
	 * @return List<MasterBase>
	 * @author Cairo
	 * @date 2014-01-14
	 */
	public List<MasterBase> findCurrentLivingInMasterBases(String rsvClass,String stas,Date rsvDate,Long hotelGroupId,Long hotelId);

	/**
	 * 将登记单数据同步到同住人
	 * 同步项:市场码、来源码、优惠理由
	 * 后续如有需要继续添加
	 * @param masterBase
	 */
	public void updateSycnLiveData(MasterBase masterBase);
	
	/**某些条件下，1张会员卡只能登记一个房间
     * @param masterBase
     * @return 返回空表示正常通过，返回值表示不允许入住，并给出提示
     */
    public MasterBase ListOneMemeberOneRoom(MasterBase masterBase);
	
	/**
	 * 根据给定集团ID及酒店ID,获取对应需要同步的中央预订单列表
	 * 用于集团端夜审过程 -- 订单同步 
	 * 其他位置请慎用
	 * @param hotelGroupId	集团ID
	 * @param hotelId		酒店ID
	 * @return List<CrsSyncObj>
	 * @author Cairo
	 * @date 2014-03-26
	 */
	public List<CRSSyncObj> findCrsResrvSyncList(Long hotelGroupId,Long hotelId);

	/**
	 * 根据手机/电话号码查主单
	 * @param mobile
	 * @param hotelGroupId
	 * @param hotelId
	 * @return
	 */
	public List<MasterLinkDto> findMasterByMobile(String mobile, Long hotelGroupId, Long hotelId);
	
	/**
	 * 查询本日夜审自动NoShow预订单集合
	 * 注意：此方法暂时仅适用于Taobao接口
	 * @param sourceId 			订房中心ID
	 * @param hotelGroupId		集团ID
	 * @param hotelId 			酒店ID
	 * @return MasterTaobaoDto
	 * @author cairo
	 * @date 2014-08-13
	 */
	public List<MasterTaobaoDto> findResrvListNoShowAudit(String sourceId,Long hotelGroupId,Long hotelId);
	
	/**
	 * 夜审补录whereFrom信息方法
	 * 注意：此方法是用于夜审过程 - 主要表备份
	 * @param cnIdCode			身份证类型代码
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @author Cairo
	 * @date 2014-09-04
	 */
	public void updateMasterBaseWhereFromByAudit(String cnIdCode,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定主单记录ID，查询主单公安接口信息数据
	 * @param masterId		登记单ID
	 * @return MasterPoliceDto
	 * @author Cairo
	 * @date 2014-09-12
	 */
	public MasterPoliceDto findMasterPoliceDtoByMasterId(Long masterId);
	
	/**
	 * 根据给定纯预留记录ID及房号，查询主单公安接口信息数据(用于综合排房界面，纯预留直接入住功能)
	 * @param rsvSrcParentId
	 * @param rmnos
	 * @return
	 */
	public List<MasterPoliceDto> findMasterPoliceDtoByParentRsvSrcId(Long rsvSrcParentId, String rmnos, Long hotelGroupId, Long hotelId);
	
	/**
	 * 根据给定条件，查询符合条件的登记单列表
	 * 注意：此方法仅适用于WeChat接口
	 * @param cardNos			会员卡列表(多个会员卡号，请使用','分隔)
	 * @param innerCardIds		会员卡内部卡号(多个内部卡号，请使用','分隔)
	 * @param stas				主单状态列表(多个主单状态，请使用','分隔)
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return List<MasterWeChatDto>
	 * @author Cairo
	 * @date 2014-09-15
	 */
	public List<MasterWeChatDto> findWeChatListByCardNo(String cardNos,String innerCardIds,String stas,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定条件，查询对应会员卡本日将到主单数量
	 * 注意：此方法仅适用于WeChat接口
	 * @param cardNos			会员卡列表(多个会员卡号，请使用','分隔)
	 * @param innerCardIds		会员卡内部卡号(多个内部卡号，请使用','分隔)
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return Integer
	 * @author Cairo
	 * @date 2014-09-15
	 */
	public Integer findWeChatArrNumByCardNo(String cardNos,String innerCardIds,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定条件，查询对应会员卡本日将离主单数量
	 * 注意：此方法仅适用于WeChat接口
	 * @param cardNos			会员卡列表(多个会员卡号，请使用','分隔)
	 * @param innerCardIds		会员卡内部卡号(多个内部卡号，请使用','分隔)
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return Integer
	 * @author Cairo
	 * @date 2014-09-15
	 */
	public Integer findWeChatDepNumByCardNo(String cardNos,String innerCardIds,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定酒店预订号，查询预订主单记录
	 * @param rsvNo				酒店预订号
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return MasterBase
	 * @author Cairo
	 * @date 2014-09-18
	 */
	public MasterBase findResrvBaseByRsvNo(String rsvNo,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据预订主单号，获取成员主单房费总计
	 * @param rsvId				预订id
	 * @param stas				登记单状态(可选,多个状态使用','分隔)
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return BigDecimal
	 * @author Cairo
	 * @date 2014-09-19
	 */
	public BigDecimal findMemberRateSum(Long rsvId,String stas,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定预订单号，获取预订单当前房费总计
	 * 注意：此方法仅计算预留及成员当前房价而不是全部房价总计
	 * @param rsvId				预订主单ID
	 * @param stas				登记单状态(可选,多个状态使用','分隔)
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return BigDecimal
	 * @author Cairo
	 * @date 2014-09-19
	 */
	public BigDecimal findResrvCurrentRateSum(Long rsvId,String stas,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定预订单号，获取预订单取消NoShow当前房费总计
	 * 注意：此方法仅计算预留及成员当前房价而不是全部房价总计
	 * @param rsvId				预订主单ID
	 * @param stas				登记单状态(可选,多个状态使用','分隔,X/N)
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return BigDecimal
	 * @author Cairo
	 * @date 2014-09-19
	 */
	public BigDecimal findResrvCurrentCxlNoShowRateSum(Long rsvId,String stas,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定预订单号，查询预订有效成原来及成员列表
	 * @param resrvId			预订单ID
	 * @param stas				状态集合(可选,多个状态码使用','分隔)
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return List<MasterChannelDto>
	 * @author Cairo
	 * @date 2014-09-23
	 */
	public List<MasterChannelDto> findMasterChannelDtoByResrvId(Long resrvId,String stas,Long hotelGroupId,Long hotelId);
	
	
	
	
	/**
	 * 根据给定条件，查询同住人MasterBase集合
	 * 适用于手机接口
	 * @param hotelGroupId
	 * @param hotelId
	 * @param baseId
	 * @param masterId
	 * @param rmno
	 * @return List<T>
	 * @author Cairo
	 * @date 2014-11-17
	 */
	public <T> List<T> listMasterLiveWithoutSelf(Long hotelGroupId, Long hotelId, Long baseId, Long masterId, String rmno) ;
	
	/**
	 * 根据给定条件，查询同住人MasterBase集合
	 * 适用于手机接口
	 * @param hotelGroupId
	 * @param hotelId
	 * @param baseId
	 * @param masterId
	 * @param rmno
	 * @return List<T>
	 * @author Cairo
	 * @date 2014-11-17
	 */
	public <T> List<T> listMasterLinkWithoutSelf(Long hotelGroupId, Long hotelId, Long baseId, Long linkId, String rmno);
	
    public Container<Map> listReserve(Long hotelGroupId, Long hotelId, SQLHelper sh, Integer currentPage, Integer pageSize);

    /**
     * 统计主单联房数（请注意：此方法不通过消息拦截，无法使用UserManager的部分属性）
     * @param masterId
     * @param stas
     * @param showResrv
     * @return 
     */
    public int countMasterLink(Long masterId, String stas, boolean showResrv);
    
    /**
	 * 根据给定条件，查询指定实体对应属性最后一此修改原值
	 * @param entityId			实体Id	
	 * @param entityName		实体名称(eg:MASTER_BASE)
	 * @param columnName		属性/列名称(eg:ratecode)
	 * @param hotelGroupId		集团Id
	 * @param hotelId			酒店Id
	 * @return String
	 * @author Cairo
	 * @date 2014-11-28
	 */
	public String findLastEntityLogInfoByCode(Long entityId,String entityName,String columnName,Long hotelGroupId,Long hotelId);

	/**
	 * 统计预定主单房数
	 * @param masterId
	 * @param hotelGroupId
	 * @param hotelId
	 * @return 
	 */
	public int countResrvRmnum(Long masterId, Long hotelGroupId, Long hotelId);
	
	/**
	 * 自动NoShow候补预订单记录
	 * @param type				NoShow类型（1：按天，0：全部）
	 * @param bizDate			营业日期
	 * @param hotelGroupId		集团ID
	 * @param hotelId			酒店ID
	 * @return void
	 * @author Cairo
	 * @date 2012-06-06
	 */
	public void updateWaitListNoShow(String type,Date bizDate,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定条件查询简单中央预订列表
	 * 注意：此方法用于pad自助接口
	 * @param rsvClass		订单类型(可选，F/G)
	 * @param stas			状态列表(可选，多个状态使用','分隔)
	 * @param crsNo			中央预订号
	 * @param hotelGroupId	集团Id
	 * @param hotelId		酒店id
	 * @return List<CrsResrvSimpleDto>
	 * @author Cairo
	 * @date 2015-03-27
	 */
	public List<CrsResrvSimpleDto> findMasterPadDtoByCrsNo(String rsvClass,String stas,String crsNo,Long hotelGroupId,Long hotelId);
	
	public void vlidateLiveMaster(Long masterId, Long hotelGroupId, Long hotelId);
	
	/**
	 * 根据宾客手机或证件号码后缀，查询登记单记录集合
	 * 注意：此方法暂使用与高晶钟 - 杭州悦因接口
	 * @param mobile			宾客手机号码或证件号码后缀
	 * @param hotelGroupId		集团id
	 * @param hotelId			酒店Id
	 * @return List<YYMasterGuestDto>
	 * @author Cairo
	 * @date 2015-05-13
	 */
	public List<YYMasterGuestDto> findMasterInfoByMobileOrIdno(String mobile,Long hotelGroupId,Long hotelId);
	
	/**
	 * 根据给定条件，查询登记单简单信息集合
	 * 注意：此方法暂仅用于Caich前台接口
	 * @param masterId		登记单Id
	 * @param rmno			房号
	 * @param stas			状态
	 * @param filterIds		过滤主单Id
	 * @param hotelGroupId	集团Id
	 * @param hotelId		酒店Id
	 * @return List<MasterInterfaceSimpleDto>
	 * @author Cairo
	 * @date 2015-05-18
	 */
	public List<MasterInterfaceSimpleDto> findMasterByRmno(Long masterId,String rmno,String stas,
			String filterIds,Long hotelGroupId,Long hotelId);
	
	/**
  	 * 根据给定参数，获取通用Crs订单同步集合
  	 * @param crsNoPrefix		中央预订号前缀
  	 * @param hotelGroupId		集团Id
  	 * @param hotelId			酒店Id
  	 * @return List<CrsResrvSync>
  	 * @author Cairo
  	 * @date 2015-05-12
  	 */
  	public List<CrsResrvSync> findCrsResrvSyncListByProc(String crsNoPrefix,
  			Long hotelGroupId,Long hotelId);
  	
  	public List<POSInterfaceFoDto> getPosFoDto(long hotelGroupId, long hotelId,String key, String rsvClass);
  	
  	/**
  	 * 根据给定条件，查询简单宾客信息
  	 * 注意：此方法适用与绿云标准PMS接口
  	 * @param subFilterSql	过滤sql
  	 * @param hotelGroupId	集团Id
  	 * @param hotelId		酒店Id
  	 * @return List<MasterGuestSimpleDto>
  	 * @author Cairo
  	 * @date 2015-04-20
  	 */
  	public List<MasterGuestSimpleDto> findMasterGuestSimpleList(String subFilterSql,Long hotelGroupId,Long hotelId);
  	
  	public <T> List<T> listMasterInHotel(Long hotelGroupId, Long hotelId, CRSQueryDto crsQueryDto, Class<T> clazz);

    public List<WebRmtypeAvailSync> listRoomAvail(Long hotelGroupId, Long hotelId, CRSQueryDto crsQueryDto);

	List<MasterLinkDto> listMasterWithAllotment(Long hotelGroupId,
			Long hotelId, Long companyId);
	
	/**
     * 根据给定条件，查询预订单集合
     * 注意：此方法暂用于微信接口
     * @param crsQueryDto		预订单查询条件
     * @param hotelGroupId		集团Id
     * @param hotelId			酒店Id
     * @return List<CrsResrvDto>
     * @author Cairo
     * @date 2015-11-16
     */
    public List<CrsResrvDto> findResrvByCrsQueryDto(CRSQueryDto crsQueryDto,Long hotelGroupId,Long hotelId);
    
    /**
     * 根据给定条件，查询预订单集合记录总数
     * 注意：此方法暂用于微信接口
     * @param crsQueryDto		预订单查询条件
     * @param hotelGroupId		集团Id
     * @param hotelId			酒店Id
     * @return Integer
     * @author Cairo
     * @date 2015-11-16
     */
    public Integer countResrvSizeByCrsQueryDto(CRSQueryDto crsQueryDto,Long hotelGroupId,Long hotelId);
    
    /**
     * 根据给定条件，查询登记单集合
     * 注意：此方法暂用于微信接口
     * @param crsQueryDto		登记单查询条件
     * @param hotelGroupId		集团Id
     * @param hotelId			酒店Id
     * @return List<CrsResrvDto>
     * @author Cairo
     * @date 2015-11-16
     */
    public List<CrsResrvDto> findMasterByCrsQueryDto(CRSQueryDto crsQueryDto,Long hotelGroupId,Long hotelId);
    
    /**
     * 根据给定条件，查询预订单集合记录总数
     * 注意：此方法暂用于微信接口
     * @param crsQueryDto		预订单查询条件
     * @param hotelGroupId		集团Id
     * @param hotelId			酒店Id
     * @return Integer
     * @author Cairo
     * @date 2015-11-16
     */
    public Integer countMasterSizeByCrsQueryDto(CRSQueryDto crsQueryDto,Long hotelGroupId,Long hotelId);

	public List<MasterLinkDto> findResrvLinkListByMasterBaseId(MasterBase masterBase);
	
	/**
     * 给定条件，分页查询
     * 暂时用于业主网站接口
     * @param masterBase
     * @param firstResult
     * @param maxResults
     * @return
     * @throws DataAccessException
     * @author lsl
     * @date 2015-12-16
     */
	public List<MasterLinkOwnerSiteDot> findMasterLinkOwnerSiteDot(MasterLinkDto masterBase, int firstResult, int maxResults);
	/**
     * 给定条件，分页查询--返回总条数
     * 暂时用于业主网站接口
     * @param masterBase
     * @param firstResult
     * @param maxResults
     * @return
     * @throws DataAccessException
     * @author lsl
     * @date 2015-12-16
     */
	public Integer countMasterLinkOwnerSiteDot(MasterLinkDto masterBase);
}