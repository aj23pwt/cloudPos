package com.greencloud.facade.impl;
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
import com.greencloud.facade.ICardFacadeService;
import com.greencloud.service.IPosMasterService;
import com.greencloud.util.UserManager;

public class CardFacadeServiceImpl implements ICardFacadeService {

	private IPosMasterService posMasterService ;
	public void setPosMasterService(IPosMasterService posMasterService) {
		this.posMasterService = posMasterService;
	}
	@Override
	public List<CardType> listCardType()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardType saveCardType(CardType cardType)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCardType(CardType cardType)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCardType(CardType cardType)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public int findCardByCardType(String cardType)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CardType findCardTypeById(Long id)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardType findCardTypeByCode(long hotelGroupId, String cardType)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Container<Map> findCardTypesByCardTypeQuery(CardType cardType,
			int page, Long sysListMetaId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countCardType(CardType cardType)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String findCardTypeByHotelAllow()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveCardLevel(CardLevel cardLevel)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCardLevel(CardLevel cardLevel)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCardLevel(CardLevel cardLevel)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public CardLevel findCardLevelById(Long id)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Container<Map> findCardLevelByCardLevelQuery(CardLevel cardLevel,
			int page, Long sysListMetaId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countCardLevel(CardLevel cardLevel)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int changePassword(String cardNo, String oldPwd, String newPwd)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String resetPassword(String cardNo, String newPW, String oldPW,
			Boolean isUser)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveCardBase(CardBase cardBase)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCardBase(CardBase cardBase)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCardBase(CardBase cardBase)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public CardBase findCardBaseById(Long id)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Container<Map> findCardBasesByCardBaseQuery(CardBase cardBase,
			int page, Long sysListMetaId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countCardBase(CardBase cardBase)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Container<Map> findByCardSearchDto(CardSearchDto cardSearchDto,
			Long sysListMetaId, Integer pageSize, Integer currentPage,
			String filterSql)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> frontRegisterMemeberCard(CardBase cardBase,
			MemberInfoDto memberInfoDto, CardPayDto cardPayDto)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long netRegisterMemberCardNoVerify(String name, String sex,
			String idCode, String idNo, String mobile, String email,
			String password, String openIdType, String openIdUserId,
			String webCardType, String webCardLevel, String webCardSrc,
			String webCardSales, Long referrerId, Long companyId,
			String passwordC, Boolean isWechatMem)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long netRegisterMemberCardApply(String name, String sex,
			String idCode, String idNo, String mobile, String email,
			Integer verifyType, String verifyHost, String webCardType)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long netRegisterMemberCard(Long applyId, String mobileOrEmail,
			String verifyCode, String openIdType, String openIdUserId,
			String webCardType, String webCardLevel, String webCardSrc,
			String webCardSales, Long referrerId, Long companyId,
			String passwordC)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> netRegisterCommon(MemberApply memberApply,
			String openIdType, String openIdUserId, String webCardType,
			String webCardLevel, String webCardSrc, String webCardSales,
			Long referrerId, Long companyId, String passwordC)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> registerNewMemeberCard(CardBase cardBase,
			MemberInfoDto memberInfoDto, CardPayDto cardPayDto)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long memberLogin(int loginType, String loginId, String loginPassword)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long memberLoginOpen(Long hotelGroupId, String openType,
			String openId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Long> memberLogin_BD(Long hotelGroupId, int loginType,
			String loginId, String loginPassword, String memberType,
			String companyCardType)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardBase> listCardByMemberId(Long memberId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String listCardIdByMemberId(Long memberId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberCardWebDto getMemberCard(Long memberId, String cardNoInput)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String active(Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String sleep(Long cardId) throws Exception
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String halt(Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String destory(Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String loss(Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String renewal(List<String> selectedArray, Date time)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String upgrade(List<Object> cardsId, String type, String level,
			String reason)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String linkToMasterCard(Long cardId, String masterCardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String resumeHalt(Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String resumeLoss(Long cardId, String newCardNo, String remark,
			CardPayDto cardPayDto)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String resumeLossNoChange(Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String resumeSleep(Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberWithCardDto findPersonWithCardByCardNo(String cardNo)
	{
		return posMasterService.findPersonWithCardByCardNo(UserManager.getHotelGroupId(), UserManager.getHotelId(), cardNo) ;
	}

	@Override
	public String saveOrUpdateCardLevelExtra(CardLevelExtra cardLevelExtra)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardLevelExtra findCardExtraById(Long id)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteCardExtraById(Long cardLevelExtraId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardPreproduce checkCardNo(String cardNo, String cardTypeCode,
			String CardLevelCode)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String inputCardNo(String cardType, String cardLevel,
			String startNo, String endNo, String prefix, String suffix,
			String cardSrc, String scope)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardPointRule> listCardPointRule()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardPointRule> listCardPointRulesByTypeAndLevel(
			String cardType, String cardLevel)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardPointRuleDe> listCardPointRuleDetail()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateSpecifiedCardPointRule(String cardType,
			String cardLevel, CardPointRuleDe cprd)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String saveOrUpdateCardPointRule(CardPointRule cpr)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteCardPointRuleById(Long id)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteCardPointRuleDetail(String cardType, String cardLevel,
			String code)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long calcPointDetail(PointCalcDto pcdto)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String saveOrUpdateAllCardPointRuleDetail(
			List<CardPointRuleDe> cprdlist)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardPointDetail> listCardPointDetailByLinkId(Long linkId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteCardPointDetailById(Long id)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String calcPoint(Long linkId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void checkInvalidPoint(Long hotelGroupId, Long hotelId,
			Date bizDate, String userCode, Long cashierId, String workStation)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public int transferPoint(String sourceCard, String desCard, Integer point,
			String remark)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adjustPoint(String cardNo, String operator, BigDecimal point,
			String remark, Date invalidate)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CardInfoDto> listCardsByMemberId(Long memberId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardExchangeItem getCardExhangeItemByCode(Long hotelId,
			String itemCode)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String pointExchange(CardExchange pointExchange, String source)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardPoint> listPointByCard(Long innerCardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardPoint> listPointByCard(Long innerCardNo, Date beginDate,
			Date endDate, int firstResult, int pageSize)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countPointByCard(Long innerCardNo, Date beginDate, Date endDate)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CardInfoDto saveOrUpdateCardInfoDto(CardInfoDto cif)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardInfoDto findCardInfoDtoByCardNoByInterface(String cardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardInfoDto findCardInfoDtoByCardNo(String cardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardInfoDto findCardInfoDtoByCardId(Long innerCardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardBase findCardByCardId(Long hotelGroupId, Long innerCardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardBase findCardByCardNo(Long hotelGroupId, String cardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardBase findCardExistByCardNo(Long hotelGroupId, String cardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String listCardTypeLevelTree()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateCardPointRules(String typeAndLevelString,
			String ruleDetails)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String addPointRuleToSpecifiedCard(String typeAndLevel,
			CardPointRuleDe cprd)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String copyCardPointRuleDetailToCard(String cardType,
			String cardLevel, CardPointRuleDe cprd)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updateResetPassword(String loginId, String memberName,
			String sendType)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void reactiveCard(String cardNo, String name, String mobileOrEmail)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reactiveCardWithOutCardNo(String name, String mobileOrEmail,
			String password, String oldPassword)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public CardAccountMaster findCardAccountMasterBaseByCardId(Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardAccountMaster> findCardAccountMasterTimesByCardId(
			Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardAccountMaster> findCardAccountMasterMoneyByCardId(
			Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardAccount saveAccountPay(Long cardId, Long accountId,
			BigDecimal pay, String payCode, String transNo, String bank,
			String source, String ismanual, String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardOperationRecord updateCardBasePublish(Long cardId, String crcStr)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long saveAccountFreeze(String source, String sourceAccnt,
			String cardNo, Long accountId, BigDecimal amount, String billNo,
			Date expiryDate, String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveAccountUnfreeze(Long freezeId, String cardNo,
			BigDecimal amount, BigDecimal amountUse)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public CardAccountFreeze findAccountFreeze(Long freezeId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int transferAccount(String sourceCard, String desCard,
			Long sourceAccount, Long DesAccount, String taCode,
			BigDecimal money, String remark)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void strikeAccount(Long cardId, Long accountId, String source,
			Long recordId, String ismanual, String remark)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void adjustAccount(Long cardId, Long accountId, String operator,
			BigDecimal amount, Long feeHotelId, String feeCode, String reason)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCardAccountMaster(CardAccountMaster cardAccountMaster)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCardName(Long memberId, String memberName)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public CardLevel findCardLevelByCode(long hotelGroupId, String code)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String transRateCodeCrs(String cardLevel, String ratecode)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardPromotion saveOrUpdateCardPromotion(CardPromotion cardPromotion)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PromotionParameterDto> getPromotionParameters(
			String promotionTrigger, String parameter)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delCardPromotion(String code)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public float getPromotionTanSum(Long cardId)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CardAccountMaster addAccountByType(Long cardId, Long typeId,
			String accountName, String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardAccountType findCardAccountType(Long accountTypeId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardAccountMaster findCardAccountMasterById(Long accountMasterId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer saveAccountPayTimes(Long cardId, Long accountId,
			BigDecimal pay, String payCode, String bank, String source,
			String ismanual, String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer saveAccountChargeTimes(Long cardId, Long accountMasterId,
			String source, int times, String ismanual, String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delCardAccountType(Long accountTypeId)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public CardAccountType saveOrUpdateCardAccountType(CardAccountType cat)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> importNewMemeberCard(CardBase cardBase,
			MemberInfoDto memberInfoDto, String sendSMS, String sendEmail,
			String feeCode)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countAccountByCard(Long cardId, Date beginDate, Date endDate,
			String tag)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CardAccount> listAccountByCard(Long cardId, Date beginDate,
			Date endDate, int firstResult, int pageSize, String accountTag)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map> listMemberCardForSms(String cardType, String cardlevel,
			String cardSta)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void verifyPasswordAndBalance(CardBase cardBase, String password,
			Double money)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map findCardBaseInfoForQuickCheckin(String key, Boolean isRead)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String readCard(String cardString)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardAccount saveAccountChargeOwn(Long cardId, String password,
			BigDecimal money, String feeCode, String accnt1, String accnt2,
			String accntId, String roomno, Date genDate, String ismanual,
			String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<List<Integer>> saveImportCharge(List<MemberChargeDto> mcList)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String saveConsumptionDetailForPoint(MemberChargeDto mcd, Long linkId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String saveImportChargeForPoint(MemberChargeDto mcd, Long linkId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardLevel> findCardLevelByCardTypeCode(CardType cardType)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCardExchangeItem(CardExchangeItem cardExchangeItem)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public String deleteConsumtionDetailForPoint(Long id, Long mPDId, Long mPCId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateSuccessCardPublish(CardOperationRecord cor)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public CardPromotion saveGiftPoint(Long hotelGroupId, Long hotelId,
			Long cardId, String triggerWay)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getPublishCount(Long cardId, String cardNo)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CardInfoResult findCardInterfaceResult(String readWay,
			String cardString, String cardPassword)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardAccount saveAccountChargeInt(Long cardId, String feeCode,
			BigDecimal money, String accnt2, String roomno, String readWay,
			String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardAccount saveAccountChargeMoney(Long cardId,
			Long accountMasterId, String password, BigDecimal money,
			String feeCode, String accnt1, String accnt2, String accntId2,
			String roomno, Date genDate, String ismanual, String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveReceipt(Long cardId, String title, String receiptNo,
			BigDecimal amount, BigDecimal orgAmount, String remark)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public BigDecimal getAccountMasterBaseBalance(Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void checkLossResume(Long cardId, String cardNo)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public CardBalanceDto getCardBalance(Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMergeMember(List<Object> beMergedCardList,
			Long mergeToMemberId, List<Object> deleteMemberIds)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void closeCardAccountMaster(Long accntId)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveOrUpdateCardGoldPassport(CardGoldPassport cardGoldPassport)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void listCardGoldPassport()
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCardGoldPassport(Long id)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public CardGoldPassport findCardGoldPassportById(Long id)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeMaster(Long cardId)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCardAccountRemark(Long id, String remark)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public CardInfoDto cardRenewal(Long cardId, Date toDate, String remark,
			CardPayDto cardPayDto)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveCardPayAccount(Long hotelGroupId, Long hotelId,
			String cardNo, String remark, Account account)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCancelCardPayAccount(Long hotelGroupId, Long hotelId,
			Long cardId, String remark)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public String updateCardInfoByCardIdProc(Long hotelGroupId, Long hotelId,
			Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void adjustAccountTimes(Long cardId, Long accountId,
			String operator, Long feeHotelId, String feeCode,
			BigDecimal amount, int times, String reason)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<SmartMasterBase> findCardBaseByName(String str, Long hotelId,
			Long hotelGroupId, String userCode)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkAccountChargeAr(Long hotelGroupId, Long hotelId,
			Date bizDate, byte byteValue, String cardNo, BigDecimal Money)
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void saveAccountChargeAr(Long hotelGroupId, Long hotelId,
			Date bizDate, byte byteValue, ArDetail arDetail)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveCalcPoint(Long hotelGroupId, Long hotelId,
			List<Account> listAccount, Account payAccount, Date bizDate,
			MasterBase masterBase, MasterGuest masterGuest)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePointByAccount(long closeId, Long hotelGroupId,
			Long hotelId, Date bizDate)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CardPoint> listCardPointByCloseId(long hotelGroupId,
			long hotelId, long closeId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardPromotion findCardPromotionByCode(Long hotelGroupId,
			String promotion)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardAccount> listCardAccount(CardAccount cardAccount)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardRepDto> getCardSnapshotValue(long hotelId,
			long hotelGroupId, Date bizDate, String value)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveAccountChargeFront(Long hotelGroupId, Long hotelId,
			Date bizDate, byte byteValue, Account account)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void savePointToMoney(Account account, MasterBase mb)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public String saveAccountFreezeFront(Long hotelGroupId, Long hotelId,
			Date bizDate, String sourceFront, String masterId, String roomNo,
			Long accreditId, String cardNo, long cardAccountId,
			BigDecimal amount, String curExchgNo, Date expiryDate, String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void changeCardAccountFeezeSoureToFront(long freezeId, Long masterId)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public Long findCardIdByCardNo(Long hotelGroupId, String cardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardType> findCardType(long hotelGroupId, long hotelId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardBase> listcardBaseUpdate(Long hotelGroupId, Date modifyDate)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long saveAccountChargeFb(Long hotelGroupId, Long hotelId,
			Date bizDate, byte cashier, String userCode, String cardNo,
			String passwd, BigDecimal money, BigDecimal receipt,
			String feeCode, String payCode, String menuNo, String menuNo2,
			String menuNo3, String roomno, Date genDate, String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long savePointToMoneyFB(Long hotelGroupId, Long hotelId,
			String cardNo, BigDecimal pay, Date bizDate, String accntId,
			String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveImportChargeFB(List<MemberChargeDtoFB> lfb,
			Long hotelGroupId, Long hotelId, Date bizDate, String user)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<POSDiscountMode> listCardPos(
			PosInterfaceSearchDto posInterfaceSearchDto, int max)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean CheckPassword(Long hotelGroupId, String cardNo, String passwd)
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<CardAccount> listPayRecord(Long hotelGroupId, Long hotelId,
			Date bizDate)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardBase checkCardGuest(Long hotelGroupId, Long guestId,
			String cardNo, String idCode, String idNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findCardCharge(Long hotelGroupId, Long hotelId,
			List<Long> accountIds)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void validCardNo(Long hotelGroupId, Long hotelId, String memberNo)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveCardExchangeItem(CardExchangeItem cardExchangeItem)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCardExchangeItem(String itemCode)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveCardExchangeItemGroup(CardExchangeItem cardExchangeItem,
			String hotels)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCardExchangeItemGroup(CardExchangeItem cardExchangeItem,
			String hotels)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getCardSupplementCount(Long cardId)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CardBase> findCardBaseByIdInfo(Long hotelGroupId,
			String idCode, String idNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getExtraItemByCardId(Long cardId, String item, String isSelf)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findCardExtraByTypeAndLevel(Long hotelGroupId,
			String cardType, String cardLevel, String item, String isSelf)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findCardExtraByTypeAndLevelByCardId(Long hotelGroupId,
			Long cardId, String item, String isSelf)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCardAccountTreatToZero(Long cardId, Long accntId,
			BigDecimal amount)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberInfoDto HuanHCard(String oldCardNo, String cardNo,
			boolean newCardAct)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void savePointUseByInterface(Long hotelGroupId, Long hotelId,
			Date bizDate, String cardNo, BigDecimal point,
			String strPpromotion, String remark)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void weixinToMember(Long cardId, Long guestId, String weixinId)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemberProductionDetail> listMemberProductionDetail(
			Long hotelGroupId, Long memberId, String sta)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardLevel findCardLevelByTypeAndCode(String membershipCategoryCode,
			String levelCode, Long hotelGroupId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardLevelExtra> listCardLevelExtraByTypeAndLevel(String code,
			String cardLevel, Long hotelGroupId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUpgradePayinfo(Long hotelGroupId, Long hotelId,
			String cardTypeOld, String cardLevelOld, String cardTypeNew,
			String cardLevelNew)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardLevel findCardLevelPayinfo(Long hotelGroupId, Long hotelId,
			String cardLevel)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveOrUpdateCardBase(CardBase cardBase)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePromotionAccntByCloseId(Long hotelGroupId, Long hotelId,
			Long parseLong, Date bizDate)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CardBase> list(CardBase cb)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardBase> findCardBase(Long id, Long memberId, String cardNo,
			String sta, String cardType, Date dateBegin, Date dateEnd,
			Long hotelGroupId, Long hotelId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveCardProduToXRGuestIncome(Long hotelGroupId, Long hotelId,
			Date bizDate, String userCode, Long cashierId, String workStation)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveCancelPointExchange(Long hotelGroupId, Long hotelId,
			Long pointId, String remark)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public Boolean doublePointJudge(List<Account> listAccount,
			Account payAccount, Date bizDate, Long hotelGroupId, Long hotelId,
			MasterBase resrvMasterBase, MasterGuest resrvMasterGuest,
			MasterBase masterBase)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void jjApplySliverCard(MasterGuest mg)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCardAccountMasterToHistory(Long cardId, Long accntId,
			Date historyDate)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void savePointAddByInterface(Long hotelGroupId, Long hotelId,
			Date bizDate, Long cardId, BigDecimal point, String remark)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCardSnapthot(Long hotelGroupId, Long hotelId,
			Date bizDate, String userCode, Long cashiered, String workStation)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public Container<Map> listCardAccountInt(Long hotelGroupId, Long hotelId,
			String cardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Container<Map> listCardPointInt(Long hotelGroupId, Long hotelId,
			String cardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Container<Map> listCardPointMingren(Long hotelGroupId, Long hotelId,
			String cardNo, String startDate, String endDate)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateInvalidCardAccountById(Long accntId)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCardPreproduceInfo(String cardType, String cardLevel,
			String startNo, String endNo, String prefix, String suffix,
			String cardSrc, String scope)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CardAccount> updateListByDate(long hotelGroupId, long hotelId,
			String taCodes, Date start, Date end)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CardAccount> updateListCardAccountForOut(CardAccount cardAccount)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long netRegisterForInterface(String cardNo, String name, String sex,
			String idCode, String idNo, String mobile, String email,
			String password, String openIdType, String openIdUserId,
			String interfaceCardType, String interfaceCardLevel,
			String webCardSrc, String webCardSales, Long referrerId,
			Long companyId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMemberGuestIdByCondi(Long hotelGroupId, Long cardId,
			String cardNo, Long guestId)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public Container<Map> findByCardSearchDtoCW(String cardOrMobile)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveMemberParttimeByCardNo(Long hotelGroupId, Long hotelId,
			String cardNo, int times, Long masterId, String crsNo)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public int findMemberParttimeTotal(Long hotelGroupId, Long hotelId,
			String cardNo)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void saveMemberParttimeDecrease(Long hotelGroupId, Long hotelId,
			String cardNo, Long masterId, String crsNo)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public String minshanWeixinGame(Long hotelGroupId, Long hotelId,
			String cardNo, String name, int number)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardAliDto aliRegister(Long hotelGroupId, Long hotelId,
			Long partnersId, String suggestLevel, Date applyDate, String name,
			String phone, String idcard, String email, String secureKey,
			String logId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, BigDecimal> findCardBalanceByCardId(Long hotelGroupId,
			Long cardId, String cardNo, String accountTag)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String upgradeAndDegrade(Long cardId, String cardNo, String type,
			String level, String reason, CardPayDto cardPayDto)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberCardWebDto getMemberCardForBD(List<Long> listMemberId,
			String cardNoInput, String memberType, String companyType)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardAccountMaster findCardAccountMasterByCardId(Long hotelGroupId,
			Long cardId, String tag)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveProductionDetailToMember(Long hotelGroupId, Long hotelId,
			Date bizDate, String userCode, List<Map> listDetail,
			List<Map> listCharge)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFanxian(List<Map> lstResult, Long hotelGroupId,
			Long hotelId, Date bizDate, String userCode, Long cashierId,
			String workStation)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberProduction findMemberProductionBymemberId(Long hotelGroupId,
			Long hotelId, Long memberId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveJiamengPingtiao(Long hotelGroupId, Long hotelId,
			Date bizDate, String userCode)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBizDate(Long hotelGroupId, Long hotelId, Date bizDate)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public String findMrAccountByCardNo(String accnt)
	{
		// TODO Auto-generated method stub
		return posMasterService.findMrAccountByCardNo(UserManager.getHotelGroupId(), UserManager.getHotelId(), accnt) ;
	}

	@Override
	public Integer findFreeEdit(Long hotelGroupId, Long memberId, Long cardId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveAccountPayByCoupon(Long hotelGroupId, Long hotelId,
			Long cardId, BigDecimal money, String payCode, String taNo,
			String remark)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MemberProDto> listMemberProductionDetailByCondi(
			Long hotelGroupId, Long hotelId, String name, Date beginDate,
			Date endDate, Long memberId, String cardNo, int pageSize,
			int firstResult, String model) throws DataAccessException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberParttime> listMemberParttime(Long hotelGroupId,
			Long hotelId, Long memberId, Long cardId, int firstResult,
			int pageSize)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMemberInfoForWeixinMem(Long hotelGroupId, Long memberId,
			String name, String sex, String idCode, String idNo, Date birth,
			String mobile, String email, String password, String loginPwd)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public Long updateMemberMergeWithWeiMem(Long hotelGroupId,
			Long sourceMemberId, Long memberId, String remark)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberWeixinDto> listMemberWeixinDtoRecent(Long hotelGroupId,
			Long hotelId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberSimpleInfoDto> listMemberSimpleInfo(Long hotelGroupId,
			String cardNo, String idCode, String idNo, String mobile,
			String email)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMemberPointProTransfer(Long hotelGroupId,
			Long sourceMemberId, Long targetMemberId, String remark)
	{
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CardBase> listAllStaCardsByMemberId(Long hotelGroupId,
			Long memberId)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> findMemberList(Long hotelGroupId,
			String condition, String idType, String isFuzzy, int firstResults,
			int pageSize)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GcMemberCardInfoDto> findMemberInfo(Long hotelGroupId,
			Long cardId, String cardNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String onlineActive(Long hotelGroupId, Long hotelId, Long cardId,
			String userCode, String taNo)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMemberClear(Long hotelGroupId, Long memberId,
			String mobile, String remark)
	{
		// TODO Auto-generated method stub
		
	}
	
}