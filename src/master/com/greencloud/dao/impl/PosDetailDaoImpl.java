package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.List;

import com.greencloud.entity.PosDetail;
import com.greencloud.dao.IPosDetailDao;
import com.greencloud.dto.KaiYuanPosDetailDto;
import com.greencloud.dto.PosPluNoteDto;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;

   /**
   * operate PosDetail into db
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public class PosDetailDaoImpl extends BaseDaoImpl implements IPosDetailDao{

  /**
   *save posDetail object  method
   *@param posDetail PosDetail 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void save(PosDetail posDetail) throws DataAccessException {
       super.save(posDetail);
  }
  
  /**
   *update posDetail method
   *@param posDetail PosDetail
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void update(PosDetail posDetail) throws DataAccessException{
     super.update(posDetail);
  }
  
   /**
   *save or update posDetail object method
   *@param posDetail PosDetail
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void saveOrUpdate(PosDetail posDetail) throws DataAccessException{
     super.saveOrUpdate(posDetail);
  }
  
   /**
   *query posDetail collection method
   *@param posDetail PosDetail send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03  14:36
   */
  public List<PosDetail> list(PosDetail posDetail,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosDetail obj WHERE 1=1 ");
  	 spellSQL(sh,posDetail);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posDetail PosDetail send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public List<PosDetail> list(PosDetail posDetail)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosDetail obj WHERE 1=1 ");
  	 spellSQL(sh,posDetail);
  	 sh.appendSql(" ORDER BY obj.id");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posDetail PosDetail query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-05-03 14:36
   */
  public int count(PosDetail posDetail)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosDetail obj WHERE 1=1 ");
    spellSQL(sh,posDetail);
    return count(sh);
  }
  
   /**
   *query a posDetail by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-05-03 14:36
   */
  public PosDetail load(Long id)throws DataAccessException
  {
    return load(PosDetail.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posDetail query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-05-03 14:36
   */
  private void spellSQL(SQLHelper sh,PosDetail posDetail)
  {
    if(posDetail != null){
    	if(posDetail.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posDetail.getId());
         }
         if(posDetail.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posDetail.getHotelGroupId());
         }
         if(posDetail.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posDetail.getHotelId());
         }
        if(isNotNull(posDetail.getAccnt())){
           sh.appendSql(" AND obj.accnt = ? ");
           sh.insertValue(posDetail.getAccnt().trim());
        }
       if(posDetail.getInumber()!= null){
           sh.appendSql(" AND obj.inumber = ? ");
           sh.insertValue(posDetail.getInumber());
        }
       if(posDetail.getTnumber()!= null){
           sh.appendSql(" AND obj.tnumber = ? ");
           sh.insertValue(posDetail.getTnumber());
        }
       if(posDetail.getAnumber()!= null){
           sh.appendSql(" AND obj.anumber = ? ");
           sh.insertValue(posDetail.getAnumber());
        }
       if(posDetail.getMnumber()!= null){
           sh.appendSql(" AND obj.mnumber = ? ");
           sh.insertValue(posDetail.getMnumber());
        }
        if(isNotNull(posDetail.getType())){
           sh.appendSql(" AND obj.type = ? ");
           sh.insertValue(posDetail.getType().trim());
        }
        if(isNotNull(posDetail.getBillno())){
            sh.appendSql(" AND obj.billno = ? ");
            sh.insertValue(posDetail.getBillno().trim());
         }
        if(isNotNull(posDetail.getOrderno())){
           sh.appendSql(" AND obj.orderno = ? ");
           sh.insertValue(posDetail.getOrderno().trim());
        }
        if(isNotNull(posDetail.getSta())){
           sh.appendSql(" AND obj.sta = ? ");
           sh.insertValue(posDetail.getSta().trim());
        }
        if(isNotNull(posDetail.getShift())){
           sh.appendSql(" AND obj.shift = ? ");
           sh.insertValue(posDetail.getShift().trim());
        }
        if(isNotNull(posDetail.getEmpid())){
           sh.appendSql(" AND obj.empid = ? ");
           sh.insertValue(posDetail.getEmpid().trim());
        }
       if(posDetail.getBizDate()!= null){
           sh.appendSql(" AND obj.bizDate = ? ");
           sh.insertValue(posDetail.getBizDate());
        }
        if(isNotNull(posDetail.getNoteCode())){
           sh.appendSql(" AND obj.noteCode = ? ");
           sh.insertValue(posDetail.getNoteCode().trim());
        }
        if(isNotNull(posDetail.getSortCode())){
           sh.appendSql(" AND obj.sortCode = ? ");
           sh.insertValue(posDetail.getSortCode().trim());
        }
        if(isNotNull(posDetail.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posDetail.getCode().trim());
        }
        if(isNotNull(posDetail.getTocode())){
           sh.appendSql(" AND obj.tocode = ? ");
           sh.insertValue(posDetail.getTocode().trim());
        }
       if(isNotNull(posDetail.getCondCode())){
           sh.appendSql(" AND obj.condCode = ? ");
           sh.insertValue(posDetail.getCondCode());
        }
       if(posDetail.getPrintid()!= null){
           sh.appendSql(" AND obj.printid = ? ");
           sh.insertValue(posDetail.getPrintid());
        }
        if(isNotNull(posDetail.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posDetail.getDescript().trim());
        }
        if(isNotNull(posDetail.getDescriptEn())){
           sh.appendSql(" AND obj.descriptEn = ? ");
           sh.insertValue(posDetail.getDescriptEn().trim());
        }
        if(isNotNull(posDetail.getUnit())){
           sh.appendSql(" AND obj.unit = ? ");
           sh.insertValue(posDetail.getUnit().trim());
        }
       if(posDetail.getNumber()!= null){
           sh.appendSql(" AND obj.number = ? ");
           sh.insertValue(posDetail.getNumber());
        }
       if(posDetail.getPinumber()!= null){
           sh.appendSql(" AND obj.pinumber = ? ");
           sh.insertValue(posDetail.getPinumber());
        }
       if(posDetail.getPrice()!= null){
           sh.appendSql(" AND obj.price = ? ");
           sh.insertValue(posDetail.getPrice());
        }
       if(posDetail.getAmount()!= null){
           sh.appendSql(" AND obj.amount = ? ");
           sh.insertValue(posDetail.getAmount());
        }
       if(posDetail.getAmount1()!= null){
           sh.appendSql(" AND obj.amount1 = ? ");
           sh.insertValue(posDetail.getAmount1());
        }
       if(posDetail.getAmount2()!= null){
           sh.appendSql(" AND obj.amount2 = ? ");
           sh.insertValue(posDetail.getAmount2());
        }
       if(posDetail.getAmount3()!= null){
           sh.appendSql(" AND obj.amount3 = ? ");
           sh.insertValue(posDetail.getAmount3());
        }
       if(posDetail.getAmount4()!= null){
           sh.appendSql(" AND obj.amount4 = ? ");
           sh.insertValue(posDetail.getAmount4());
        }
       if(posDetail.getAmount5()!= null){
           sh.appendSql(" AND obj.amount5 = ? ");
           sh.insertValue(posDetail.getAmount5());
        }
       if(posDetail.getCost()!= null){
           sh.appendSql(" AND obj.cost = ? ");
           sh.insertValue(posDetail.getCost());
        }
        if(isNotNull(posDetail.getFlag())){
           sh.appendSql(" AND obj.flag = ? ");
           sh.insertValue(posDetail.getFlag().trim());
        }
        if(isNotNull(posDetail.getFlag1())){
           sh.appendSql(" AND obj.flag1 = ? ");
           sh.insertValue(posDetail.getFlag1().trim());
        }
        if(isNotNull(posDetail.getReason())){
           sh.appendSql(" AND obj.reason = ? ");
           sh.insertValue(posDetail.getReason().trim());
        }
       if(posDetail.getDsc()!= null){
           sh.appendSql(" AND obj.dsc = ? ");
           sh.insertValue(posDetail.getDsc());
        }
       if(posDetail.getSrv()!= null){
           sh.appendSql(" AND obj.srv = ? ");
           sh.insertValue(posDetail.getSrv());
        }
       if(posDetail.getSrv0()!= null){
           sh.appendSql(" AND obj.srv0 = ? ");
           sh.insertValue(posDetail.getSrv0());
        }
       if(posDetail.getSrvDsc()!= null){
           sh.appendSql(" AND obj.srvDsc = ? ");
           sh.insertValue(posDetail.getSrvDsc());
        }
       if(posDetail.getTax()!= null){
           sh.appendSql(" AND obj.tax = ? ");
           sh.insertValue(posDetail.getTax());
        }
       if(posDetail.getTax0()!= null){
           sh.appendSql(" AND obj.tax0 = ? ");
           sh.insertValue(posDetail.getTax0());
        }
       if(posDetail.getTaxDsc()!= null){
           sh.appendSql(" AND obj.taxDsc = ? ");
           sh.insertValue(posDetail.getTaxDsc());
        }
       if(isNotNull(posDetail.getTableno())){
           sh.appendSql(" AND obj.tableno = ? ");
           sh.insertValue(posDetail.getTableno().trim());
        }
        if(isNotNull(posDetail.getSiteno())){
           sh.appendSql(" AND obj.siteno = ? ");
           sh.insertValue(posDetail.getSiteno().trim());
        }
        if(isNotNull(posDetail.getInfo())){
           sh.appendSql(" AND obj.info = ? ");
           sh.insertValue(posDetail.getInfo().trim());
        }
        if(isNotNull(posDetail.getCardno())){
           sh.appendSql(" AND obj.cardno = ? ");
           sh.insertValue(posDetail.getCardno().trim());
        }
        if(isNotNull(posDetail.getCardinfo())){
           sh.appendSql(" AND obj.cardinfo = ? ");
           sh.insertValue(posDetail.getCardinfo().trim());
        }
        if(isNotNull(posDetail.getKitchen())){
           sh.appendSql(" AND obj.kitchen = ? ");
           sh.insertValue(posDetail.getKitchen().trim());
        }
        if(isNotNull(posDetail.getPcid())){
           sh.appendSql(" AND obj.pcid = ? ");
           sh.insertValue(posDetail.getPcid().trim());
        }
        if(isNotNull(posDetail.getEmpid1())){
           sh.appendSql(" AND obj.empid1 = ? ");
           sh.insertValue(posDetail.getEmpid1().trim());
        }
        if(isNotNull(posDetail.getEmpid2())){
           sh.appendSql(" AND obj.empid2 = ? ");
           sh.insertValue(posDetail.getEmpid2().trim());
        }
        if(isNotNull(posDetail.getEmpid3())){
           sh.appendSql(" AND obj.empid3 = ? ");
           sh.insertValue(posDetail.getEmpid3().trim());
        }
       if(posDetail.getDrawDate()!= null){
           sh.appendSql(" AND obj.drawDate = ? ");
           sh.insertValue(posDetail.getDrawDate());
        }
       if(isNotNull(posDetail.getCreateUser())){
           sh.appendSql(" AND obj.createUser = ? ");
           sh.insertValue(posDetail.getCreateUser().trim());
        }
       if(posDetail.getCreateDatetime()!= null){
           sh.appendSql(" AND obj.createDatetime = ? ");
           sh.insertValue(posDetail.getCreateDatetime());
        }
        if(isNotNull(posDetail.getModifyUser())){
           sh.appendSql(" AND obj.modifyUser = ? ");
           sh.insertValue(posDetail.getModifyUser().trim());
        }
       if(posDetail.getModifyDatetime()!= null){
           sh.appendSql(" AND obj.modifyDatetime = ? ");
           sh.insertValue(posDetail.getModifyDatetime());
        }
    }
  }

@Override
public <T> List<T> getShiftCloseList(String hotelGroupId, String hotelId,String pccode, String empid, String shift,String biz_date,String reportNo) {
	SQLHelper sh = new SQLHelper();
	sh.appendSql(" Call up_pos_shift_report(?,?,?,?,?,?,?) ");
	sh.insertValue(Long.parseLong(hotelGroupId));
	sh.insertValue(Long.parseLong(hotelId));
	sh.insertValue(biz_date);
	sh.insertValue(pccode);
	sh.insertValue(empid);
	sh.insertValue(shift);
	sh.insertValue(reportNo);
	return findByNativeSQL(sh);
}

	@Override
	public String updateKitchenInputDishcard(final String hotelGroupId,final String hotelId,final String accnt,final String id,final String type,final String station) {
		String sql = "{Call up_pos_kitchen_input_dishcard(?,?,?,?,?,?,?,?) }";	
		@SuppressWarnings({ "unchecked", "rawtypes" })
		Object object = getJdbcTemplate().execute(sql,new CallableStatementCallback(){
			public Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException 
			{
			     cs.setLong(1,Long.parseLong(hotelGroupId));
			     cs.setLong(2,Long.parseLong(hotelId));
			     cs.setString(3,accnt);
			     cs.setLong(4,Long.parseLong(id));
			     cs.setString(5,type);
			     cs.setString(6,station);
			     cs.registerOutParameter(7,java.sql.Types.VARCHAR);
			     cs.registerOutParameter(8,java.sql.Types.VARCHAR);
			     cs.execute();
			     return cs.getString(7);
			}
		});	
		return object.toString().trim();
	}
	
	@Override
	public  List<KaiYuanPosDetailDto> getPosDetailByBillNo(long hotelGroupId,long hotelId,String billNo){
//		SELECT a.id AS id,a.accnt AS accnt,a.code AS pluCode,a.tocode AS toCode,a.descript AS pluDescript,a.unit AS unit,a.price AS price,a.number AS number,a.amount AS amount,a.srv AS srv,a.dsc AS dsc,a.tax AS tax,c.code AS toCodeType,c.descript AS toCodeTypeDes,c.descript_en AS toCodeTypeDesEn FROM pos_detail a 
//		LEFT JOIN code_base b 
//		LEFT JOIN code_base c ON c.hotel_group_id = b.hotel_group_id AND c.hotel_id = b.hotel_id AND b.group_code = c.code AND c.parent_code = 'pos_item_type'
//		ON b.hotel_group_id = a.hotel_group_id AND b.hotel_id = a.hotel_id AND b.parent_code = 'pos_rep_item' AND a.tocode = b.code	
//		WHERE a.hotel_group_id = 2 AND a.hotel_id = 23  AND INSTR('P2001607300001,P2001607300002',a.accnt)>0
		
		SQLHelper sh = new SQLHelper("SELECT a.id AS id,a.accnt AS accnt,a.code AS pluCode,a.tocode AS toCode,a.descript AS pluDescript,a.unit AS unit,a.price AS price,a.number AS number,");
		sh.appendSql("a.amount AS amount,a.srv AS srv,a.dsc AS dsc,a.tax AS tax,c.code AS toCodeType,c.descript AS toCodeTypeDes,c.descript_en AS toCodeTypeDesEn ");
		sh.appendSql("	FROM pos_detail a ");
		sh.appendSql("	LEFT JOIN code_base b ");
		sh.appendSql("	LEFT JOIN code_base c ON c.hotel_group_id = b.hotel_group_id AND c.hotel_id = b.hotel_id AND b.group_code = c.code AND c.parent_code = 'pos_item_type' ");
		sh.appendSql("	ON b.hotel_group_id = a.hotel_group_id AND b.hotel_id = a.hotel_id AND b.parent_code = 'pos_rep_item' AND a.tocode = b.code ");
		sh.appendSql("	WHERE a.hotel_group_id = ? AND a.hotel_id = ?  AND a.billno = ?");
		
//		SQLHelper sh = new SQLHelper("SELECT obj FROM PosPluAll obj WHERE 1=1 and hotel_group_id = ? and hotel_id = ? and instr(?,accnt) > 0 and sta = 'I'");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.insertValue(billNo);
		
		return findByNativeSQL(sh, KaiYuanPosDetailDto.class);
	}

	@Override
	public List<KaiYuanPosDetailDto> getPosDetailByAccnt(long hotelGroupId,
			long hotelId, String accnt) {
		
		SQLHelper sh = new SQLHelper("SELECT a.id AS id,a.accnt AS accnt,a.code AS pluCode,a.tocode AS toCode,a.descript AS pluDescript,a.unit AS unit,a.price AS price,a.number AS number,");
		sh.appendSql("a.amount AS amount,a.srv AS srv,a.dsc AS dsc,a.tax AS tax,c.code AS toCodeType,c.descript AS toCodeTypeDes,c.descript_en AS toCodeTypeDesEn ");
		sh.appendSql("	FROM pos_detail a ");
		sh.appendSql("	LEFT JOIN code_base b ");
		sh.appendSql("	LEFT JOIN code_base c ON c.hotel_group_id = b.hotel_group_id AND c.hotel_id = b.hotel_id AND b.group_code = c.code AND c.parent_code = 'pos_item_type' ");
		sh.appendSql("	ON b.hotel_group_id = a.hotel_group_id AND b.hotel_id = a.hotel_id AND b.parent_code = 'pos_rep_item' AND a.tocode = b.code ");
		sh.appendSql("	WHERE a.hotel_group_id = ? AND a.hotel_id = ?  AND a.accnt = ?");
		
//		SQLHelper sh = new SQLHelper("SELECT obj FROM PosPluAll obj WHERE 1=1 and hotel_group_id = ? and hotel_id = ? and instr(?,accnt) > 0 and sta = 'I'");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.insertValue(accnt);
		
		return findByNativeSQL(sh, KaiYuanPosDetailDto.class);
	}
	
}