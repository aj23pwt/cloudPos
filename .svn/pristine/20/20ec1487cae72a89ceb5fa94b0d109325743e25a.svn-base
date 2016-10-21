package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosStation;
import com.greencloud.dao.IPosStationDao;
import com.greencloud.dto.PosTableDto;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosStation into db
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public class PosStationDaoImpl extends BaseDaoImpl implements IPosStationDao{

  /**
   *save posStation object  method
   *@param posStation PosStation 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void save(PosStation posStation) throws DataAccessException {
       super.save(posStation);
  }
  
  /**
   *update posStation method
   *@param posStation PosStation
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void update(PosStation posStation) throws DataAccessException{
     super.update(posStation);
  }
  
   /**
   *save or update posStation object method
   *@param posStation PosStation
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdate(PosStation posStation) throws DataAccessException{
     super.saveOrUpdate(posStation);
  }
  
   /**
   *query posStation collection method
   *@param posStation PosStation send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosStation> list(PosStation posStation,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStation obj WHERE 1=1 ");
  	 spellSQL(sh,posStation);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posStation PosStation send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public List<PosStation> list(PosStation posStation)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStation obj WHERE 1=1 ");
  	 spellSQL(sh,posStation);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posStation PosStation query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int count(PosStation posStation)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosStation obj WHERE 1=1 ");
    spellSQL(sh,posStation);
    return count(sh);
  }
  
   /**
   *query a posStation by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosStation load(Long id)throws DataAccessException
  {
    return load(PosStation.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posStation query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  private void spellSQL(SQLHelper sh,PosStation posStation)
  {
    if(posStation != null){
    	if(posStation.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posStation.getId());
         }
         if(posStation.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posStation.getHotelGroupId());
         }
         if(posStation.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posStation.getHotelId());
         }
        if(isNotNull(posStation.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posStation.getCode().trim());
        }
        if(isNotNull(posStation.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posStation.getDescript().trim());
        }
        if(isNotNull(posStation.getDescriptEn())){
           sh.appendSql(" AND obj.descriptEn = ? ");
           sh.insertValue(posStation.getDescriptEn().trim());
        }
        if(isNotNull(posStation.getPccodes())){
           sh.appendSql(" AND obj.pccodes = ? ");
           sh.insertValue(posStation.getPccodes().trim());
        }
        if(isNotNull(posStation.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posStation.getPccode().trim());
        }
        if(isNotNull(posStation.getPrinters())){
           sh.appendSql(" AND obj.printers = ? ");
           sh.insertValue(posStation.getPrinters().trim());
        }
        if(isNotNull(posStation.getTag())){
           sh.appendSql(" AND obj.tag = ? ");
           sh.insertValue(posStation.getTag().trim());
        }
        if(isNotNull(posStation.getTag1())){
           sh.appendSql(" AND obj.tag1 = ? ");
           sh.insertValue(posStation.getTag1().trim());
        }
        if(isNotNull(posStation.getTag2())){
           sh.appendSql(" AND obj.tag2 = ? ");
           sh.insertValue(posStation.getTag2().trim());
        }
        if(isNotNull(posStation.getTag3())){
           sh.appendSql(" AND obj.tag3 = ? ");
           sh.insertValue(posStation.getTag3().trim());
        }
        if(isNotNull(posStation.getTag4())){
           sh.appendSql(" AND obj.tag4 = ? ");
           sh.insertValue(posStation.getTag4().trim());
        }
        if(isNotNull(posStation.getTag5())){
           sh.appendSql(" AND obj.tag5 = ? ");
           sh.insertValue(posStation.getTag5().trim());
        }
        if(isNotNull(posStation.getBillprinter())){
           sh.appendSql(" AND obj.billprinter = ? ");
           sh.insertValue(posStation.getBillprinter().trim());
        }
        if(isNotNull(posStation.getLocalprinter())){
           sh.appendSql(" AND obj.localprinter = ? ");
           sh.insertValue(posStation.getLocalprinter().trim());
        }
        if(isNotNull(posStation.getPrinter1())){
           sh.appendSql(" AND obj.printer1 = ? ");
           sh.insertValue(posStation.getPrinter1().trim());
        }
        if(isNotNull(posStation.getPrinter2())){
           sh.appendSql(" AND obj.printer2 = ? ");
           sh.insertValue(posStation.getPrinter2().trim());
        }
        if(isNotNull(posStation.getPrinter3())){
           sh.appendSql(" AND obj.printer3 = ? ");
           sh.insertValue(posStation.getPrinter3().trim());
        }
        if(isNotNull(posStation.getPrinter4())){
           sh.appendSql(" AND obj.printer4 = ? ");
           sh.insertValue(posStation.getPrinter4().trim());
        }
        if(isNotNull(posStation.getPrinter5())){
           sh.appendSql(" AND obj.printer5 = ? ");
           sh.insertValue(posStation.getPrinter5().trim());
        }
       if(posStation.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posStation.getListOrder());
        }
        if(isNotNull(posStation.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posStation.getIsHalt().trim());
        }
        if(isNotNull(posStation.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posStation.getIsGroup().trim());
        }
        if(isNotNull(posStation.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posStation.getGroupCode().trim());
        }
        if(isNotNull(posStation.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posStation.getCodeType().trim());
        }
        if(isNotNull(posStation.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posStation.getCreateUser().trim());
         }
        if(posStation.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posStation.getCreateDatetime());
         }
         if(isNotNull(posStation.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posStation.getModifyUser().trim());
         }
        if(posStation.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posStation.getModifyDatetime());
         }
    }
  }

	@Override
	public List<PosTableDto> getPosTable() {
		return null;
	}
}