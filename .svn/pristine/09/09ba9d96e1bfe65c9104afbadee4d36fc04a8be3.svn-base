package com.greencloud.facade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.aua.util.Container;
import com.greencloud.controller.CardInfoResult;
import com.greencloud.dto.CardAliDto;
import com.greencloud.dto.CardBalanceDto;
import com.greencloud.dto.CardInfoDto;
import com.greencloud.dto.CardPayDto;
import com.greencloud.dto.CardRepDto;
import com.greencloud.dto.CardSearchDto;
import com.greencloud.dto.GcMemberCardInfoDto;
import com.greencloud.dto.MemberCardWebDto;
import com.greencloud.dto.MemberChargeDto;
import com.greencloud.dto.MemberChargeDtoFB;
import com.greencloud.dto.MemberInfoDto;
import com.greencloud.dto.MemberProDto;
import com.greencloud.dto.MemberSimpleInfoDto;
import com.greencloud.dto.MemberWeixinDto;
import com.greencloud.dto.MemberWithCardDto;
import com.greencloud.dto.POSDiscountMode;
import com.greencloud.dto.PointCalcDto;
import com.greencloud.dto.PosInterfaceSearchDto;
import com.greencloud.dto.PromotionParameterDto;
import com.greencloud.dto.SmartMasterBase;
import com.greencloud.entity.Account;
import com.greencloud.entity.ArDetail;
import com.greencloud.entity.CardAccount;
import com.greencloud.entity.CardAccountFreeze;
import com.greencloud.entity.CardAccountMaster;
import com.greencloud.entity.CardAccountType;
import com.greencloud.entity.CardBase;
import com.greencloud.entity.CardExchange;
import com.greencloud.entity.CardExchangeItem;
import com.greencloud.entity.CardGoldPassport;
import com.greencloud.entity.CardLevel;
import com.greencloud.entity.CardLevelExtra;
import com.greencloud.entity.CardOperationRecord;
import com.greencloud.entity.CardPoint;
import com.greencloud.entity.CardPointDetail;
import com.greencloud.entity.CardPointRule;
import com.greencloud.entity.CardPointRuleDe;
import com.greencloud.entity.CardPreproduce;
import com.greencloud.entity.CardPromotion;
import com.greencloud.entity.CardType;
import com.greencloud.entity.MasterBase;
import com.greencloud.entity.MasterGuest;
import com.greencloud.entity.MemberApply;
import com.greencloud.entity.MemberParttime;
import com.greencloud.entity.MemberProduction;
import com.greencloud.entity.MemberProductionDetail;

/**
 * @author zlf
 */
public interface ICardFacadeService extends Serializable {

    List<CardType> listCardType();

    /**
     * 保存会员卡类型的方法
     * 
     * @param cardType
     */
    public CardType saveCardType(CardType cardType);

    /**
     * 修改会员卡类型的方法
     * 
     * @param cardType
     */
    public void updateCardType(CardType cardType);

    /**
     * 删除会员卡类型的方法
     * 
     * @param cardType
     */
    public void deleteCardType(CardType cardType);

    public int findCardByCardType(String cardType);

    public CardType findCardTypeById(Long id);

    public CardType findCardTypeByCode(long hotelGroupId , String cardType );

    /**
     * 根据条件查询会员卡类型集合
     * 
     * @param cardType 查询对象
     * @param page 请求页数
     * @param sysListMetaId 列表头配制
     * @return 查询到的结果集
     */
    @SuppressWarnings("rawtypes")
    public Container<Map> findCardTypesByCardTypeQuery(CardType cardType, int page, Long sysListMetaId);

    public int countCardType(CardType cardType);

    /**
     * @return 当前操作酒店 设置过的许用的会员卡类型
     */
    public String findCardTypeByHotelAllow();

    /**
     * 保存会员卡等级的方法
     * 
     * @param cardLevel
     */
    public void saveCardLevel(CardLevel cardLevel);

    /**
     * 修改会员卡等级的方法
     * 
     * @param cardLevel
     */
    public void updateCardLevel(CardLevel cardLevel);

    /**
     * 删除会员卡等级的方法
     * 
     * @param cardLevel
     */
    public void deleteCardLevel(CardLevel cardLevel);

    public CardLevel findCardLevelById(Long id);
    
    /**快捷版企图的同步到本地缓存，后来发现有问题，可能没有再设置了
     * @param modifyDatetime
     * @return
     */
    //public List<CardLevel> findCardLevelByModify(long hotelGroupId,long hotelId,Date modifyDatetime);

    /**
     * 根据条件查询会员卡类型集合
     * 
     * @param cardLevel 查询对象
     * @param page 请求页数
     * @param sysListMetaId 列表头配制
     * @return 查询到的结果集
     */
    @SuppressWarnings("rawtypes")
    public Container<Map> findCardLevelByCardLevelQuery(CardLevel cardLevel, int page, Long sysListMetaId);

    public int countCardLevel(CardLevel cardLevel);

    public int changePassword(String cardNo, String oldPwd, String newPwd);

    public String resetPassword(String cardNo,String newPW,String oldPW,Boolean isUser);
//    /**
//     * 保存会员卡站点的方法
//     * 
//     * @param cardStation
//     */
//    public void saveCardStation(CardStation cardStation);
//
//    /**
//     * 修改会员卡站点的方法
//     * 
//     * @param cardStation
//     */
//    public void updateCardStation(CardStation cardStation);
//
//    /**
//     * 删除会员卡站点的方法
//     * 
//     * @param cardStation
//     */
//    public void deleteCardStation(CardStation cardStation);
//
//    public CardStation findCardStationById(Long id);
//
//    /**
//     * 根据条件查询会员卡站点集合
//     * 
//     * @param cardStation 查询对象
//     * @param page 请求页数
//     * @param sysListMetaId 列表头配制
//     * @return 查询到的结果集
//     */
//    @SuppressWarnings("rawtypes")
//    public Container<Map> findCardStationsByCardStationQuery(CardStation cardStation, int page, Long sysListMetaId);
//
//    public int countCardStation(CardStation cardStation);

    /**
     * 保存会员卡类型的方法
     * 
     * @param cardStation
     */
    public void saveCardBase(CardBase cardBase);

    /**
     * 修改会员卡类型的方法
     * 
     * @param cardBase
     */
    public void updateCardBase(CardBase cardBase);

    /**
     * 删除会员卡类型的方法
     * 
     * @param cardBase
     */
    public void deleteCardBase(CardBase cardBase);

    public CardBase findCardBaseById(Long id);

    /**
     * 根据条件查询会员卡类型集合
     * 
     * @param cardBase 查询对象
     * @param page 请求页数
     * @param sysListMetaId 列表头配制
     * @return 查询到的结果集
     */
    @SuppressWarnings("rawtypes")
    public Container<Map> findCardBasesByCardBaseQuery(CardBase cardBase, int page, Long sysListMetaId);

    public int countCardBase(CardBase cardBase);

    /**
     * 根据查询条件的Dto查询会员卡列表
     * 
     * @param cardSearchDto
     * @param pageSize
     * @param sysListMetaId
     * @param currentPage
     * @param filterSql
     * @return
     */
    @SuppressWarnings("rawtypes")
    public Container<Map> findByCardSearchDto(CardSearchDto cardSearchDto, Long sysListMetaId, Integer pageSize, Integer currentPage, String filterSql);

    /**
     * 注册新会员卡
     * 
     * @param cardBase
     * @param memberInfoDto
     */
    public Map<String, Object> frontRegisterMemeberCard(CardBase cardBase, MemberInfoDto memberInfoDto,CardPayDto cardPayDto);

    /**
     * 无验证注册会员方法
     * 
     * @param name
     * @param sex
     * @param idCode
     * @param idNo
     * @param mobile
     * @param email
     * @param password
     * @return
     */
    public Long netRegisterMemberCardNoVerify(
    		String name,String sex,String idCode,String idNo,String mobile,String email,String password,String openIdType,String openIdUserId,
    		String webCardType,String webCardLevel,String webCardSrc,String webCardSales,Long referrerId, Long companyId,String passwordC,Boolean isWechatMem
    		);  

    /** 网站注册新会员卡申请
     * @param name 姓名
     * @param sex  性别
     * @param idCode 证件类型
     * @param idNo 证件号码
     * @param mobile 手机
     * @param email 邮箱
     * @param verifyType 验证方式0：手机，1：邮箱
     * @return 申请编号
     */
    public Long netRegisterMemberCardApply(String name, String sex, String idCode, String idNo, String mobile, String email, Integer verifyType, String verifyHost,
                                           String webCardType);

    /**
     * 网站注册新会员卡
     * 
     * @param applyId 申请编号
     * @param emailOrMobile 验证对象：手机或邮箱
     * @param verifyCode
     * @return
     */
    public Long netRegisterMemberCard(
    		Long applyId ,String mobileOrEmail ,String verifyCode,String openIdType,String openIdUserId,String webCardType,String webCardLevel,String webCardSrc,String webCardSales,Long referrerId, Long companyId,String passwordC
    		);
    /**
     * 注册会员公共代码
     * 
     * @param memberApply
     * @return
     */
    public Map<String, Object> netRegisterCommon(MemberApply memberApply,String openIdType,String openIdUserId,String webCardType,String webCardLevel,String webCardSrc,String webCardSales,Long referrerId,Long companyId,String passwordC);
    
	public Map<String, Object> registerNewMemeberCard(CardBase cardBase, MemberInfoDto memberInfoDto, CardPayDto cardPayDto);
    /**会员登录
     * @param loginType 登录方式1:卡号，2：手机号，3：邮箱号，4：证件号,0:由有程序来猜，5：第三方账户
     * @param loginId  登录号码
     * @param loginPassword 登录密码
     * @return 返回整个MemberInfoDto
     */
    public Long memberLogin(int loginType, String loginId, String loginPassword);
    public Long memberLoginOpen(Long hotelGroupId, String openType, String openId);
    /**
     * 布丁专用登录方法 返回memberId集合
     * @param hotelGroupId
     * @param loginType
     * @param loginId
     * @param loginPassword
     * @param memberType 0表示个人 1表示公司 默认个人登录
     * @param companyCardType 公司卡对应会员计划
     * @return
     */
    public List<Long> memberLogin_BD(Long hotelGroupId,int loginType, String loginId, String loginPassword,String memberType,String companyCardType);

    /**
     * @param memberId 会员编号
     * @return
     */
    public List<CardBase> listCardByMemberId(Long memberId);
    /**
     * @param memberId
     * @return
     */
    public String listCardIdByMemberId(Long memberId);
    /**
     * 供网站调用，通过会员ID获取会员及其默认卡的信息
     * 
     * @param memberId 会员ID
     * @return
     */
    public MemberCardWebDto getMemberCard(Long memberId,String cardNoInput);
    
    /**
     * @param cardBase
     * @param args 其他参数
     * <p>
     * @param startNo 开始卡号
     * @param endNO 结束卡号 这里的参数顺序必需为： 前缀prefix 后缀suffix
     */
    // public void batRegisterNewMemeberCard(CardBase cardBase,String startNo,String endNo,String prefix,String suffix);
    /**
     * 激活
     * @param cardId
     * @return
     */
    public String active(Long cardId);

    /**
     * 休眠
     * 
     * @param cardId
     * @return
     */
    public String sleep(Long cardId) throws Exception;

    /**
     * 停用
     * 
     * @param cardId
     * @return
     */
    public String halt(Long cardId);

    /**
     * 注销
     * 
     * @param cardId
     * @return
     */
    public String destory(Long cardId);

    /**
     * 挂失
     * 
     * @param cardId
     * @return
     */
    public String loss(Long cardId);

    /**
     * 续期
     * 
     * @param cardId
     * @return
     */
    public String renewal(List<String> selectedArray, Date time);

    /**
     * @param cardId
     * @param cardNo
     * @param type
     * @return
     */
//    String upgradeAndDegrade(Long cardId, String cardNo, String type, String level, String reason);

    public String upgrade(List<Object> cardsId, String type, String level, String reason);

    /**
     * 关联到主卡
     * 
     * @param cardId
     * @return
     */
    public String linkToMasterCard(Long cardId, String masterCardNo);

    /**
     * 从停用恢复到有效状态
     * 
     * @param cardId
     * @return
     */
    public String resumeHalt(Long cardId);

    /**
     * 恢复挂失,这里可能要更换卡号,所以单独处理
     * 
     * @param cardId
     * @return
     */
    public String resumeLoss(Long cardId, String newCardNo, String remark ,CardPayDto cardPayDto);

    /**
     * 恢复挂失，不更换卡号
     */
    public String resumeLossNoChange(Long cardId);

    /**
     * 恢复休眠,需要将记录从CardSleep中转移至CardBase,所以需要单独处理
     * 
     * @param cardId
     * @return
     */
    public String resumeSleep(Long cardId);

    /**
     * @param cardId
     * @return
     */
    public MemberWithCardDto findPersonWithCardByCardNo(String cardNo);

    /**
     * 保存或修改会员卡等级扩展项目
     * 
     * @param cardLevelExtra
     * @return
     */
    public String saveOrUpdateCardLevelExtra(CardLevelExtra cardLevelExtra);

    public CardLevelExtra findCardExtraById(Long id);
    public String deleteCardExtraById(Long cardLevelExtraId);

    /**
     * 卡号检测
     * 
     * @param cardNo
     * @return
     */
    public CardPreproduce checkCardNo(String cardNo, String cardTypeCode, String CardLevelCode);

    public String inputCardNo(String cardType, String cardLevel, String startNo, String endNo, String prefix, String suffix, String cardSrc, String scope);

    /**
     * 查询会员积分规则的方法
     * 
     * @return
     */
    public List<CardPointRule> listCardPointRule();

    /**
     * 根据卡类型和等级查询会员积分规则的方法
     * 
     * @return
     */
    public List<CardPointRule> listCardPointRulesByTypeAndLevel(String cardType, String cardLevel);

    /**
     * 查询会员看积分规则详细的方法
     * 
     * @return
     */
    public List<CardPointRuleDe> listCardPointRuleDetail();

    /**
     * 更新指定卡类和等级的积分规则
     * 
     * @param cardType
     * @param cardLevel
     * @param cprd
     * @return
     */
    public String updateSpecifiedCardPointRule(String cardType, String cardLevel, CardPointRuleDe cprd);

    /**
     * 更新或保存会员卡积分时间规则的方法
     * 
     * @param cpr
     * @return
     */
    public String saveOrUpdateCardPointRule(CardPointRule cpr);

    /**
     * 根据id删除积分规则
     * 
     * @param id
     * @return
     */
    public String deleteCardPointRuleById(Long id);

    /**
     * 根据id删除积分规则详细
     * 
     * @param
     * @return
     */
    public String deleteCardPointRuleDetail(String cardType, String cardLevel, String code);

    /**
     * 计算积分详细
     * 
     * @param pcdto
     * @return
     */
    public long calcPointDetail(PointCalcDto pcdto);

    /**
     * @param cprdlist
     * @return
     */
    public String saveOrUpdateAllCardPointRuleDetail(List<CardPointRuleDe> cprdlist);

    /**
     * @param linkId
     * @return
     */
    public List<CardPointDetail> listCardPointDetailByLinkId(Long linkId);

    /**
     * @param id
     * @return
     */
    public String deleteCardPointDetailById(Long id);

    /**
     * 计算积分汇总
     * 
     * @param id
     * @return
     */
    // public String calcPoint(List<CardPointDetail> listCardPointDetail);
    public String calcPoint(Long linkId);

    /**
     * 积分失效检查(这个在每天夜审的时候做)
     * 
     * @param hotelGroupId
     * @param hotelId
     * @param bizDate
     * @param userCode
     * @param cashierId
     * @param workStation
     */
    public void checkInvalidPoint(Long hotelGroupId, Long hotelId, Date bizDate, String userCode, Long cashierId, String workStation);

    /**
     * 会员卡积分转移
     * 
     * @param sourceCard 原卡号
     * @param desCard 目标卡号
     * @param point 转入金额
     * @return -1.积分金额不够 0.正常
     */
    public int transferPoint(String sourceCard, String desCard, Integer point, String remark);

    /**
     * 会员卡积分调整
     * 
     * @param cardNo
     * @param operator
     * @param point
     * @param remark
     * @return
     */
    public int adjustPoint(String cardNo, String operator, BigDecimal point, String remark,Date invalidate);

    /**
     * 根据会员ID查找他所持有的卡
     * 
     * @param memberId
     * @return
     */
    public List<CardInfoDto> listCardsByMemberId(Long memberId);

    /**
     * @param itemCode 物品代码
     * @return
     */
    public CardExchangeItem getCardExhangeItemByCode(Long hotelId,String itemCode);

    /**
     * @param 积分兑换
     * @return 该卡的积分余额
     */
    public String pointExchange(CardExchange pointExchange,String source);
    /**
     * @param 通过内部卡号获得积分列表
     * @return
     */
    public List<CardPoint> listPointByCard(Long innerCardNo);

    public List<CardPoint> listPointByCard(Long innerCardNo, Date beginDate, Date endDate, int firstResult, int pageSize);

    public int countPointByCard(Long innerCardNo, Date beginDate, Date endDate);

    public CardInfoDto saveOrUpdateCardInfoDto(CardInfoDto cif);

	public CardInfoDto findCardInfoDtoByCardNoByInterface(String cardNo);
    public CardInfoDto findCardInfoDtoByCardNo(String cardNo);
    /**
     * 根据内部卡号查cardInfoDto
     * @param innerCardNo
     * @return
     */
    public CardInfoDto findCardInfoDtoByCardId(Long innerCardNo);
	public CardBase findCardByCardId(Long hotelGroupId, Long innerCardNo);
	public CardBase findCardByCardNo(Long hotelGroupId, String cardNo);
	/**
	 * 根据外部卡号查是否此卡是否存在，会同时判断有外部接口的会员系统中是否有这个的卡。
	 * @param hotelGroupId
	 * @param cardNo
	 * @return 是否存在
	 */
	CardBase findCardExistByCardNo(Long hotelGroupId, String cardNo);
    
    public String listCardTypeLevelTree();

    /**
     * 更新会员卡时间积分规则
     * 
     * @param typeAndLevelString
     * @param ruleDetails
     * @return
     */
    public String updateCardPointRules(String typeAndLevelString, String ruleDetails);

    /**
     * 给指定的卡增加积分规则
     * 
     * @param typeAndLevel
     * @param cprd
     * @return
     */
    public String addPointRuleToSpecifiedCard(String typeAndLevel, CardPointRuleDe cprd);

    public String copyCardPointRuleDetailToCard(String cardType, String cardLevel, CardPointRuleDe cprd);

    public String updateResetPassword(String loginId, String memberName, String sendType);

    /**
     * @param cardno
     * @param name
     * @param mobileOrEmail
     */
    void reactiveCard(String cardNo, String name, String mobileOrEmail);

    public void reactiveCardWithOutCardNo(String name, String mobileOrEmail, String password, String oldPassword);

    /**
     * 获取储值卡基本帐户信息
     * 
     * @param cardId
     * @return
     */
    public CardAccountMaster findCardAccountMasterBaseByCardId(Long cardId);

    /**
     * @param cardId
     * @return
     */
    List<CardAccountMaster> findCardAccountMasterTimesByCardId(Long cardId);

    /**
     * @param cardId
     * @return
     */
    List<CardAccountMaster> findCardAccountMasterMoneyByCardId(Long cardId);

    /**
     * @param cardId
     * @param accountId
     * @param pay
     * @param payCode
     * @param bank
     * @param source
     * @return
     */
    public CardAccount saveAccountPay(Long cardId, Long accountId, BigDecimal pay, String payCode, String transNo, String bank, String source, String ismanual, String remark);

    /**
     * @param cardBase
     * @return
     */
    public CardOperationRecord updateCardBasePublish(Long cardId,String crcStr);

    /**
     * @param source
     * @param cardId
     * @param accountId
     * @param amount
     * @param billNo
     * @return
     */
    public Long saveAccountFreeze(String source, String sourceAccnt, String cardNo, Long accountId, BigDecimal amount, String billNo, Date expiryDate, String remark);

    /**
     * @param freezeId
     * @param amountUse
     * @return
     */
    public void saveAccountUnfreeze(Long freezeId, String cardNo, BigDecimal amount, BigDecimal amountUse);

    /**
     * @param freezeId
     * @return
     */
    CardAccountFreeze findAccountFreeze(Long freezeId);

    /**
     * @param sourceCard
     * @param desCard
     * @param money
     * @param remark
     * @return
     */
    public int transferAccount(String sourceCard, String desCard, Long sourceAccount, Long DesAccount, String taCode, BigDecimal money, String remark);

    /**
     * @param cardId
     * @param accountId
     * @param recordId
     */
    public void strikeAccount(Long cardId, Long accountId, String source, Long recordId, String ismanual, String remark);

    /**
     * @param cardId
     * @param accountId
     * @param operator
     * @param amount
     * @param reason
     */
    public void adjustAccount(Long cardId, Long accountId, String operator, BigDecimal amount, Long feeHotelId, String feeCode, String reason);

    /**
     * @param cardAccountMaster
     */
    public void updateCardAccountMaster(CardAccountMaster cardAccountMaster);

    /**
     * @param memberId
     * @param memberName
     */
    public void updateCardName(Long memberId, String memberName);

    /**
     * @param code
     * @return
     */
    public CardLevel findCardLevelByCode(long hotelGroupId,String code);

    // public BigDecimal saveAccountChargeFb(
    // String cardNo,String password, BigDecimal money, String feeCode, String accnt1, String accnt2, String accntId,
    // String roomno,
    // Date genDate,String remark);
    /**
     * @param cardLevel
     * @param ratecode
     * @return
     */
    String transRateCodeCrs(String cardLevel, String ratecode);

    /**
     * @param code
     * @return
     */
//    CardPromotion findCardPromotionByCode(String code);

    /**
     * @param cardPromotion
     * @return
     */
    CardPromotion saveOrUpdateCardPromotion(CardPromotion cardPromotion);

    /**
     * @param code
     * @param promotionTrigger
     * @return
     */
    List<PromotionParameterDto> getPromotionParameters(String promotionTrigger, String parameter);

    /**
     * @param code
     */
    void delCardPromotion(String code);

    /**
     * @param cardId
     * @return
     */
    public float getPromotionTanSum(Long cardId);

    /**
     * @param cardId
     * @param typeId
     * @param accountName
     */
    public CardAccountMaster addAccountByType(Long cardId, Long typeId, String accountName, String remark);

    /**
     * @param accountTypeId
     * @return
     */
    public CardAccountType findCardAccountType(Long accountTypeId);

    /**
     * @param accountMasterId
     * @return
     */
    public CardAccountMaster findCardAccountMasterById(Long accountMasterId);

    /**
     * @param cardId
     * @param accountId
     * @param pay
     * @param payCode
     * @param bank
     * @param source
     * @param remark
     * @return
     */
    Integer saveAccountPayTimes(Long cardId, Long accountId, BigDecimal pay, String payCode, String bank, String source, String ismanual, String remark);

    /**
     * @param cardId
     * @param accountMasterId
     * @param source
     * @return
     */
    Integer saveAccountChargeTimes(Long cardId, Long accountMasterId, String source, int times, String ismanual, String remark);

    /**
     * @param accountTypeId
     */
    void delCardAccountType(Long accountTypeId);

    /**
     * @param cat
     * @return
     */
    CardAccountType saveOrUpdateCardAccountType(CardAccountType cat);

    /**
     * @param cardBase
     * @param memberInfoDto
     * @param sendSMS
     * @param sendEmail
     * @return
     */
    public Map<String, Object> importNewMemeberCard(CardBase cardBase, MemberInfoDto memberInfoDto, String sendSMS,
            String sendEmail,String feeCode);
    /**
     * 获取指定时间段内指定卡的储值记录数
     * 
     * @param cardId
     * @param beginDate
     * @param endDate
     * @param tag 主帐户 BASE 返现帐户:TREAT
     * @return
     */
    public int countAccountByCard(Long cardId, Date beginDate, Date endDate,String tag);

    /**
     * 获取指定时间，指定页，指定卡的储值明细记录列表
     * 
     * @param cardId
     * @param beginDate
     * @param endDate
     * @param firstResult
     * @param pageSize
     * @param accountTag 主帐户 BASE 返现帐户:TREAT 现金帐户 MONEY
     * @return
     */
    public List<CardAccount> listAccountByCard(Long cardId, Date beginDate, Date endDate, int firstResult, int pageSize,String accountTag);

    /**
     * @param cardType
     * @param cardlevel
     * @param cardSta
     * @return
     */
    List<Map> listMemberCardForSms(String cardType, String cardlevel, String cardSta);

    /**
     * 网站储值卡支付验证密码和金额
     * 
     * @param cardBase
     * @param password
     * @param money
     */
    public void verifyPasswordAndBalance(CardBase cardBase, String password, Double money);

    /**
     * 根据key查找会员信息，key需要等于邮箱或身份证号或卡号或手机号
     * 
     * @param key
     * @return 返回快登需要的会员信息
     */
    @SuppressWarnings("rawtypes")
    public Map findCardBaseInfoForQuickCheckin(String key, Boolean isRead);

    /**
     * 读卡方法
     * 
     * @param cardString
     * @return
     */
    public String readCard(String cardString);

    /**
     * 储值管理界面主账户和现金账户消费方法
     * 
     * @param cardId
     * @param accntMasterId
     * @param password
     * @param money
     * @param feeCode
     * @param accnt1
     * @param accnt2
     * @param accntId
     * @param roomno
     * @param genDate
     * @param remark
     * @return
     */
    public CardAccount saveAccountChargeOwn(Long cardId,String password, BigDecimal money, String feeCode, String accnt1, String accnt2, String accntId, String roomno,
                                            Date genDate, String ismanual, String remark);

    /**
     * 会员消费导入
     * 
     * @param mcList
     * @return
     */
    public List<List<Integer>> saveImportCharge(List<MemberChargeDto> mcList);

    /**
     * 积分消费录入
     */

    public String saveConsumptionDetailForPoint(MemberChargeDto mcd, Long linkId);

    public String saveImportChargeForPoint(MemberChargeDto mcd, Long linkId);

    /**
     * 根据卡类型代码查找卡等级
     * 
     * @param cardTypeCode
     * @return
     */
    public List<CardLevel> findCardLevelByCardTypeCode(CardType cardType);

    
    /**
     * 修改积分兑换物品
     */
    public void updateCardExchangeItem(CardExchangeItem cardExchangeItem);

    /**
     * 删除新增的积分消费明细
     * 
     * @param id
     * @return
     */
    public String deleteConsumtionDetailForPoint(Long id, Long mPDId, Long mPCId);

    /**
     * 写卡成功，更新cardOperationRecord
     */
    public void updateSuccessCardPublish(CardOperationRecord cor);

    /**
     * 网站奖励积分方法
     * 
     * @param hotelGroupId
     * @param hotelId
     * @param cardId
     */
    public CardPromotion saveGiftPoint(Long hotelGroupId, Long hotelId, Long cardId, String triggerWay);

    /**
     * @param hotelId
     * @param cardId
     * @param cardNo
     * @return
     */
    int getPublishCount(Long cardId, String cardNo);

    /**
     * @param cardString
     * @param cardPassword
     * @return
     */
    CardInfoResult findCardInterfaceResult(String readWay, String cardString, String cardPassword);

    /**
     * @param cardId
     * @param money
     * @param feeCode
     * @param accnt2
     * @param roomno
     * @param remark
     * @return
     */
    CardAccount saveAccountChargeInt(Long cardId, String feeCode, BigDecimal money, String accnt2, String roomno, String readWay, String remark);

	/**指定帐户消费 
	 * * @param cardId
	 * @param accntId
	 * @param password
	 * @param money
	 * @param feeCode
	 * @param accnt1
	 * @param accnt2
	 * @param accntId2
	 * @param roomno
	 * @param genDate
	 * @param ismanual
	 * @param remark
	 * @return
	 */
	CardAccount saveAccountChargeMoney(Long cardId, Long accountMasterId,
			String password, BigDecimal money, String feeCode, String accnt1,
			String accnt2, String accntId2, String roomno, Date genDate,
			String ismanual, String remark);
    /**
     * @param user
     * @param cardId
     * @param amount
     * @param orgAmount
     * @param remark
     */
    void saveReceipt(Long cardId,String title,String receiptNo, BigDecimal amount, BigDecimal orgAmount, String remark);
    /**
     * @param cardId
     * @return
     */
    BigDecimal getAccountMasterBaseBalance(Long cardId);

    /**
     * @param cardId
     * @param cardNo
     * @return
     */
    void checkLossResume(Long cardId, String cardNo);

    /**
     * @param cardId
     * @return
     */
    CardBalanceDto getCardBalance(Long cardId);

    /**
     * @param beMergedCardList
     * @param mergeToMemberId
     * @param DeleteMemberIds
     */
    void updateMergeMember(List<Object> beMergedCardList, Long mergeToMemberId, List<Object> deleteMemberIds);

    /**
     * @param accntId
     */
    void closeCardAccountMaster(Long accntId);

    public void saveOrUpdateCardGoldPassport(CardGoldPassport cardGoldPassport);

    public void listCardGoldPassport();

    public void deleteCardGoldPassport(Long id);

    public CardGoldPassport findCardGoldPassportById(Long id);

    /**
     * @param cardId
     */
    void removeMaster(Long cardId);

    /**
     * 修改账务备注
     */
    public void updateCardAccountRemark(Long id, String remark);

	public CardInfoDto cardRenewal(Long cardId, Date toDate,String remark,CardPayDto cardPayDto);




    /**
     * 买卡付款方法
     * 
     * @param hotelGroupId
     * @param hotelId
     * @param cardNo 卡号
     * @param money 金额
     * @param payCode 付款方式
     * @param rmno 转房间账的房号
     * @param accnt 转房间账的账号
     * @param accntType 0:入消费账；1：转房帐
     * @param remark 备注
     */
	public void saveCardPayAccount(Long hotelGroupId,Long hotelId,String cardNo,String remark ,Account account);

    /**
     * 取消买卡账务
     * 
     * @param hotelGroupId
     * @param hotelId
     * @param cardId
     */
    public void updateCancelCardPayAccount(Long hotelGroupId, Long hotelId, Long cardId, String remark);

    /**
     * 根据卡id获取存储过程中定义的卡信息显示在卡查询界面上
     * 
     * @param hotelGroupId
     * @param hotelId
     * @param cardId
     * @return
     */
    public String updateCardInfoByCardIdProc(Long hotelGroupId, Long hotelId, Long cardId);

    /**
     * 次卡账户调整方法
     * 
     * @param hotelGroupId
     * @param hotelId
     * @param cardId 卡ID
     * @param accountId 储值账户id
     * @param times 调整次数
     * @param remark 备注
     */
	public void adjustAccountTimes(Long cardId,Long accountId,String operator,Long feeHotelId ,String feeCode,BigDecimal amount,int times,String reason);

    public List<SmartMasterBase> findCardBaseByName(String str, Long hotelId, Long hotelGroupId,String userCode);

    boolean checkAccountChargeAr(Long hotelGroupId, Long hotelId, Date bizDate, byte byteValue, String cardNo, BigDecimal Money);

    void saveAccountChargeAr(Long hotelGroupId, Long hotelId, Date bizDate, byte byteValue, ArDetail arDetail);

    void saveCalcPoint(Long hotelGroupId,Long hotelId,List<Account> listAccount,Account payAccount,Date bizDate,MasterBase masterBase,MasterGuest masterGuest);

    void deletePointByAccount(long closeId, Long hotelGroupId, Long hotelId,	Date bizDate);
//    List<CardPoint> listCardPoint(CardPoint cardPointTest);
    public List<CardPoint> listCardPointByCloseId(long hotelGroupId,long hotelId,long closeId);

    CardPromotion findCardPromotionByCode(Long hotelGroupId, String promotion);

//    List<CardBase> listCardBase(CardBase cb);

//    List<CardLevel> listCardLevel(CardLevel cl);

    

    /**
     * 艳阳天SAP专用,未经许可不得使用
     */
    public List<CardAccount> listCardAccount(CardAccount cardAccount);
    
    public List<CardRepDto>  getCardSnapshotValue(long hotelId, long hotelGroupId,Date bizDate,String value);

    void saveAccountChargeFront(Long hotelGroupId, Long hotelId, Date bizDate, byte byteValue, Account account);

    void savePointToMoney(Account account,MasterBase mb);

    /**
     * @param hotelGroupId 集团编号
     * @param hotelId 酒店编号
     * @param bizDate 营业日期
     * @param sourceFront 前台还是预定等。。
     * @param masterId  masterId
     * @param roomNo  房间号码
     * @param accreditId 前台信用记录ID
     * @param cardNo 卡号
     * @param cardAccountId  储值卡帐户号，不考虑多账户情况下，直接填0L
     * @param amount  金额
     * @param curExchgNo 前台信用的单据号码
     * @param expiryDate 失效日期
     * @param remark 备注
     * @return
     */
    String saveAccountFreezeFront(Long hotelGroupId, Long hotelId, Date bizDate, String sourceFront, String masterId, String roomNo, Long accreditId, String cardNo, long cardAccountId, BigDecimal amount,
                             String curExchgNo, Date expiryDate, String remark);

//    CardAccountFreeze findCardAccountFreezeById(long FreezeId);

//    void updateCardAccountFreeze(CardAccountFreeze caf);
    public void changeCardAccountFeezeSoureToFront(long freezeId,Long masterId);

    Long findCardIdByCardNo(Long hotelGroupId, String cardNo);

    List<CardType> findCardType(long hotelGroupId, long hotelId);

    /**
     * 艳阳天接口专用，未经许可不得使用
     * @param hotelGroupId
     * @param modifyDate
     * @return
     */
    List<CardBase> listcardBaseUpdate(Long hotelGroupId, Date modifyDate);

//    YytResrvDto findCardBase(Long hotelGroupId, Long cardId);

    Long saveAccountChargeFb(Long hotelGroupId, Long hotelId,Date bizDate, byte cashier, String userCode, String cardNo,
			String passwd, BigDecimal money, BigDecimal receipt, String feeCode,String payCode, String menuNo, String menuNo2, String menuNo3,
			String roomno, Date genDate, String remark);

    Long savePointToMoneyFB(Long hotelGroupId, Long hotelId, String cardNo, BigDecimal pay, Date bizDate, String accntId, String remark);

    void saveImportChargeFB(List<MemberChargeDtoFB> lfb, Long hotelGroupId, Long hotelId, Date bizDate, String user);

    List<POSDiscountMode> listCardPos(PosInterfaceSearchDto posInterfaceSearchDto, int max);

    boolean CheckPassword(Long hotelGroupId, String cardNo, String passwd);

//    List<CardAccount> list(CardAccount ca);

    /**艳阳天接口专用，未经许可不得使用
     * @param hotelGroupId
     * @param hotelId
     * @param bizDate
     * @return
     */
    public List<CardAccount> listPayRecord(Long hotelGroupId, Long hotelId, Date bizDate);

//    List<CardBase> findCardBase(Object object, Object object2, String cardNo, Object object3, Object object4, Date dateGet, Date dateEnd, Long hotelGroupId, Object object5);

    /**
     * 根据主单证件信息判断是否本人本卡
     * 
     * @param hotelGroupId
     * @param guestId
     * @param cardNo
     * @param idCode
     * @param idNo
     * @return
     * @date 2014年4月9日
     */
    public CardBase checkCardGuest(Long hotelGroupId, Long guestId, String cardNo, String idCode, String idNo);

	public String findCardCharge(Long hotelGroupId, Long hotelId, List<Long> accountIds);

    void validCardNo(Long hotelGroupId, Long hotelId, String memberNo);
    /**
     * 新增积分兑换物品
     * @param cardExchangeItem
     * @date 2014年7月1日
     */
    public void saveCardExchangeItem(CardExchangeItem cardExchangeItem);
    /**
     * 删除积分兑换物品
     * @param itemCode
     * @date 2014年7月1日
     */
    public void deleteCardExchangeItem(String itemCode);
    /**
     * 集团新增兑换物品并下发酒店
     * @param cardExchangeItem
     * @param hotels
     * @date 2014年7月1日
     */
    public void saveCardExchangeItemGroup(CardExchangeItem cardExchangeItem,String hotels);
    /**
     * 集团更新物品
     * @param cardExchangeItem
     * @param hotels
     * @date 2014年7月1日
     */
    public void updateCardExchangeItemGroup(CardExchangeItem cardExchangeItem,String hotels);

    public int getCardSupplementCount(Long cardId);

	/**
	 * 根据证件类型与证件号码查询会员卡
	 * @param hotelGroupId
	 * @param idCode
	 * @param idNo
	 * @return
	 */
	public List<CardBase> findCardBaseByIdInfo(Long hotelGroupId,String idCode,String idNo);
	/**
	 * 根据会员计划，卡等级，礼遇类型获取会员礼遇设置值
	 * @param hotelGroupId
	 * @param cardType 会员计划
	 * @param cardLevel 卡等级
	 * @param item 礼遇类型 (退房时间(item="CheckOutTime")、预定保留时间(item="KeepReserveTime")、客房布置(item="Amenity")
	 *                      特殊要求(item="Special")、免查房(item="FreeRounds" 用T or F来判断)、快速入住(item="FastCheckIn" 用T or F来判断)、免费升级次数(item="FreeUpgradeTimes")等)
	 * @param isSelf 是否本人
	 * @return
	 */
	public String getExtraItemByCardId(Long cardId,String item,String isSelf);
	public String findCardExtraByTypeAndLevel(Long hotelGroupId,String cardType,String cardLevel, String item,String isSelf);
	public String findCardExtraByTypeAndLevelByCardId(Long hotelGroupId, Long cardId,	String item,String isSelf);
	
	/**
	 * 储值卡退款平赠送账
	 * @param cardId
	 * @param accntId
	 * @param amount
	 */
	public void updateCardAccountTreatToZero(Long cardId,Long accntId,BigDecimal amount);
	
	  /**
	   * 尚宾卡换蓝鲸卡
	   * @param cardNo
	   * @return
	   */
	public MemberInfoDto HuanHCard(String oldCardNo, String cardNo,boolean newCardAct);
	/**
	 * 接口使用积分 
	 * @param hotelGroupId
	 * @param hotelId
	 * @param bizDate
	 * @param cardNo
	 * @param point 可负可正 
	 * @param remark
	 */
	public void savePointUseByInterface(Long hotelGroupId,Long hotelId,Date bizDate,String cardNo,BigDecimal point,String strPpromotion,String remark);
    /**
     * @param cardId
     * @param guestId
     */
    public void weixinToMember(Long cardId, Long guestId,String weixinId);

	List<MemberProductionDetail> listMemberProductionDetail(Long hotelGroupId,
			Long memberId, String sta);

    CardLevel findCardLevelByTypeAndCode(String membershipCategoryCode, String levelCode, Long hotelGroupId);

    List<CardLevelExtra> listCardLevelExtraByTypeAndLevel(String code, String cardLevel, Long hotelGroupId);
    
	public String getUpgradePayinfo(Long hotelGroupId, Long hotelId,String cardTypeOld,String cardLevelOld,String cardTypeNew,String cardLevelNew);
	public CardLevel findCardLevelPayinfo(Long hotelGroupId, Long hotelId,String cardLevel);
	
    void saveOrUpdateCardBase(CardBase cardBase);

    void deletePromotionAccntByCloseId(Long hotelGroupId, Long hotelId, Long parseLong, Date bizDate);

    List<CardBase> list(CardBase cb);

	List<CardBase> findCardBase(Long id,Long memberId,String cardNo,String sta,String cardType,
    		Date dateBegin,Date dateEnd,Long hotelGroupId,Long hotelId);
	
    /**
     * 建发：上传会员业绩数据到西软会员系统
     * @param hotelGroupId
     * @param hotelId
     * @param bizDate
     */
    public void saveCardProduToXRGuestIncome(Long hotelGroupId, Long hotelId, Date bizDate,
			String userCode, Long cashierId, String workStation);
    /**
     * 积分兑换撤销
     * @param hotelGroupId
     * @param hotelId
     * @param exchangeId 需要撤销的积分兑换记录的id(cardPoint.id)
     */
    public void saveCancelPointExchange(Long hotelGroupId,Long hotelId,Long pointId,String remark);
    /**
     * 判断厦门建发双重积分
     * @param listAccount
     * @param payAccount
     * @param bizDate
     * @param hotelGroupId
     * @param hotelId
     * @param resrvMasterBase
     * @param resrvMasterGuest
     * @param masterBase
     * @return
     */
    public Boolean doublePointJudge(List<Account> listAccount,Account payAccount,Date bizDate,Long hotelGroupId,Long hotelId,MasterBase resrvMasterBase,MasterGuest resrvMasterGuest,MasterBase masterBase);

	public void jjApplySliverCard(MasterGuest mg);
 
	public void updateCardAccountMasterToHistory(Long cardId, Long accntId, Date historyDate);

    /**
     * 增加积分接口方法
     * @param hotelGroupId
     * @param hotelId
     * @param bizDate
     * @param cardNo
     * @param point
     * @param remark
     */
    public void savePointAddByInterface(Long hotelGroupId,Long hotelId,Date bizDate,Long cardId,BigDecimal point,String remark);

	public void updateCardSnapthot(Long hotelGroupId, Long hotelId, Date bizDate,String userCode, Long cashiered, String workStation);

	public Container<Map> listCardAccountInt(Long hotelGroupId, Long hotelId, String cardNo);

	public Container<Map> listCardPointInt(Long hotelGroupId, Long hotelId,String cardNo);

	public Container<Map> listCardPointMingren(Long hotelGroupId, Long hotelId, String cardNo,String startDate, String endDate);
	/**
	 * 因事务回滚导致储值卡账务多扣的问题 将多扣的账务删掉 将card_base,card_account_master记录回复； 
	 * 但只能将charge回滚 不能修改帐次 因为有可能已经有其他账务插入进来  还要修改这条账务之后插入的该卡账务的余额
	 * @param accntId
	 */
	public void updateInvalidCardAccountById(Long accntId);
	
    /**
     * 修改预发卡信息 用于预发错或者想要修改预发酒店、发展来源时
     * @param hotelGroupId 集团id
     * @param hotelId 酒店id
     * @param cardType 卡类型
     * @param cardLevel 卡等级
     * @param startNo 开始卡号
     * @param endNo 截止卡号
     * @param prefix 前缀
     * @param suffix 后缀
     * @param cardSrc 发展来源
     * @param scope 适用酒店
     */
    public void updateCardPreproduceInfo(String cardType,String cardLevel,String startNo, String endNo,String prefix, String suffix,String cardSrc,String scope);


    public List<CardAccount> updateListByDate(long hotelGroupId, long hotelId,String taCodes, Date start, Date end);
    
    public List<CardAccount> updateListCardAccountForOut(CardAccount cardAccount);
    public Long netRegisterForInterface(String cardNo, String name, String sex, String idCode, String idNo, String mobile, String email, String password,
			String openIdType, String openIdUserId, String interfaceCardType, String interfaceCardLevel, String webCardSrc, String webCardSales,
			Long referrerId, Long companyId);
    /**
     * 修改会员档案信息绑定 判断cardId有效性，无效则根据cardNo查找 
     * @param cardId
     * @param cardNo
     * @param guestId
     */
    public void updateMemberGuestIdByCondi(Long hotelGroupId,Long cardId,String cardNo,Long guestId);
    
    public Container<Map> findByCardSearchDtoCW(String cardOrMobile);

    public void saveMemberParttimeByCardNo(Long hotelGroupId, Long hotelId,
			String cardNo, int times,Long masterId,String crsNo);

	public int findMemberParttimeTotal(Long hotelGroupId, Long hotelId, String cardNo);

	public void saveMemberParttimeDecrease(Long hotelGroupId, Long hotelId,String cardNo,Long masterId,String crsNo);

//	void updateCardPayAccount_upgrade(Long hotelGroupId, Long hotelId,String cardNo, String remark, Account account);

	public String minshanWeixinGame(Long hotelGroupId,Long hotelId,String cardNo ,String name,int number);
	

	CardAliDto aliRegister(Long hotelGroupId, Long hotelId, Long partnersId, String suggestLevel, Date applyDate, String name, String phone,
			String idcard, String email, String secureKey, String logId);
	/**
	 * 根据内部卡号、帐户类型获取当前卡的各项余额
	 * @param hotelGroupId
	 * @param cardId
	 * @param accountTag
	 * @return
	 */
	public Map<String, BigDecimal>  findCardBalanceByCardId(Long hotelGroupId,Long cardId,String cardNo,String accountTag);
	/**
	 * 卡升降级
	 * @param cardId
	 * @param cardNo
	 * @param type
	 * @param level
	 * @param reason
	 * @return
	 */
    public String upgradeAndDegrade(Long cardId,String cardNo,String type, String level,String reason,CardPayDto cardPayDto);
    /**
     * 布丁专用 根据memberId集合 获取登录对象
     * @param listMemberId
     * @param cardNoInput
     * @param memberType 登录对象 0表示个人会员 1 表示公司会员 默认为个人会员
     * @param companyType 公司卡会员计划
     * @return
     */
	public MemberCardWebDto getMemberCardForBD(List<Long> listMemberId,String cardNoInput,String memberType,String companyType);
	/**
	 * 根据内部卡号、帐户类型获取相关帐户
	 * @param hotelGroupId
	 * @param cardId
	 * @param tag
	 * @return
	 */
	public CardAccountMaster findCardAccountMasterByCardId(Long hotelGroupId,Long cardId,String tag);
	/**
	 *  将pms库的productionDetail记录移植到member库中
	 * @param hotelGroupId
	 * @param hotelId
	 * @param bizDate
	 */
	public void saveProductionDetailToMember(Long hotelGroupId,Long hotelId,Date bizDate,String userCode,List<Map> listDetail ,List<Map> listCharge);

	public void updateFanxian(List<Map> lstResult,Long hotelGroupId, Long hotelId, Date bizDate, String userCode,Long cashierId,String workStation);
	MemberProduction findMemberProductionBymemberId(Long hotelGroupId,
			Long hotelId, Long memberId);

	public void saveJiamengPingtiao(Long hotelGroupId, Long hotelId, Date bizDate,
			String userCode);

	public void updateBizDate(Long hotelGroupId, Long hotelId, Date bizDate);

	public String findMrAccountByCardNo(String accnt);
	Integer findFreeEdit(Long hotelGroupId, Long memberId, Long cardId);
    /**
     * 充值券充值
     * @param hotelGroupId
     * @param hotelId
     * @param cardId
     * @param money
     * @param payCode
     * @param taNo
     * @param remark
     */
    public void saveAccountPayByCoupon(Long hotelGroupId,Long hotelId,Long cardId,BigDecimal money,String payCode,String taNo,String remark);
//    /**
//     * 获取近段时间内（暂定半小时）的微信关注记录
//     * @return
//     */
//    public List<MemberWeixinDto> listMemberWeixinDtoRecent(Long hotelGroupId);
//    /**
//     * 根据卡号 或 证件信息 或 手机 或 邮箱 获取会员信息列表
//     * @param hotelGroupId
//     * @param cardNo
//     * @param idCode
//     * @param idNo
//     * @param mobile
//     * @param email
//     * @return
//     */
//    public List<MemberSimpleInfoDto> listMemberSimpleInfo(Long hotelGroupId,String cardNo,String idCode,String idNo,String mobile,String email);

	List<MemberProDto> listMemberProductionDetailByCondi(Long hotelGroupId,
			Long hotelId, String name, Date beginDate, Date endDate,
			Long memberId, String cardNo, int pageSize, int firstResult,
			String model) throws DataAccessException;

	List<MemberParttime> listMemberParttime(Long hotelGroupId, Long hotelId,
			Long memberId, Long cardId, int firstResult, int pageSize);

    /**
     * 完善微会员资料 自动升级为网站会员
     * @param hotelGroupId 集团编号
     * @param memberId 会员号
     * @param name 姓名
     * @param sex 性别
     * @param idCode 证件类型
     * @param idNo 证件号码
     * @param birth 生日
     * @param mobile 手机
     * @param email 邮箱
     * @param password 储值卡密码
     * @param loginPwd 网站登录密码
     */
    public void updateMemberInfoForWeixinMem(Long hotelGroupId,Long memberId,String name,String sex,String idCode,String idNo,Date birth,String mobile,String email,String password,String loginPwd);
    /**
     * 合并微会员与实际会员信息
     * @param hotelGroupId 集团编号
     * @param sourceMemberId 微会员memberId
     * @param memberId 目标会员memberId
     * @param remark 备注
     * @return memberId 返回合并后的memberId
     */
    public Long updateMemberMergeWithWeiMem(Long hotelGroupId,Long sourceMemberId,Long memberId,String remark);
    /**
	 * 根据给定条件，查询半小时内关注微信会员列表
	 * @param hotelGroupId		集团Id
	 * @param hotelId			酒店Id(可选)
	 * @return List<MemberWeixinDto>
	 * @author wjm
	 * @date 2015-11-26
	 * @modify Cairo
	 * @modifyDate 2015-11-30 
	 */
	public List<MemberWeixinDto> listMemberWeixinDtoRecent(Long hotelGroupId,Long hotelId);
	/**
	 * 根据给定条件，查询符合条件的会员信息列表
	 * @param hotelGroupId		集团id
	 * @param cardNo
	 * @param idCode
	 * @param idNo
	 * @param mobile
	 * @param email
	 * @return List<MemberSimpleInfoDto>
	 * @author wjm
	 * @date 2015-11-26
	 * @modify Cairo
	 * @modifyDate 2015-11-30 
	 */
    public List<MemberSimpleInfoDto> listMemberSimpleInfo(Long hotelGroupId,String cardNo,String idCode,String idNo,String mobile,String email);
    /**
     * 积分以及业绩转移 将sourceMemberId名下的所有积分总额以及积分记录、业绩信息转至targetMemberId名下
     * @param hotelGroupId
     * @param sourceMemberId
     * @param targetMemberId
     * @param remark
     */
    public void updateMemberPointProTransfer(Long hotelGroupId,Long sourceMemberId,Long targetMemberId,String remark);
    /**
     * 根据memberId获取该会员名下持有的所有状态的会员卡
     * @param hotelGroupId
     * @param memberId
     * @return
     */
    public List<CardBase> listAllStaCardsByMemberId(Long hotelGroupId,Long memberId);
    /**
     * 根据传入查询条件查找满足条件的卡列表
     * @param hotelGroupId
     * @param condition 查询条件 姓名/会员编号/会员卡号/手机/证件号码
     * @param idType 证件类型 不指定为''
     * @param isFuzzy 仅控制姓名是否模糊查询 而且只允许后模糊 例如：张%
     * @param firstResults 起始记录数 0为第一条
     * @param pageSize 每页记录数
     * @return map：其中listCardSimpleDtos 为卡列表信息 countMem为满足条件的卡总数
     */
    public Map<String, Object> findMemberList(Long hotelGroupId,String condition,String idType,String isFuzzy,int firstResults,int pageSize);
    /**
     * 根据传入卡编号或者卡号查询卡详细信息
     * @param hotelGroupId
     * @param cardId 卡编号
     * @param cardNo 卡号
     * @return
     */
    public List<GcMemberCardInfoDto> findMemberInfo(Long hotelGroupId,Long cardId,String cardNo);

	/**
	 * 网站付款成功后激活会员卡
	 * @param cardId 卡id
	 * @param taNo 付款交易号
	 * @return
	 */
	public String onlineActive(Long hotelGroupId,Long hotelId,Long cardId,String userCode,String taNo);
	/**
	 * 会员信息清理 
	 * @param memberId
	 * @param mobile
	 * @param remark
	 */
	public void updateMemberClear(Long hotelGroupId,Long memberId,String mobile,String remark);

}