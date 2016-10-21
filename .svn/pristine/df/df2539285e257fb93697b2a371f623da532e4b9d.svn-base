package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosPccodeNote;
import com.greencloud.dao.IPosPccodeNoteDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosPccodeNote into db
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public class PosPccodeNoteDaoImpl extends BaseDaoImpl implements IPosPccodeNoteDao{

  /**
   *save posPccodeNote object  method
   *@param posPccodeNote PosPccodeNote 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void save(PosPccodeNote posPccodeNote) throws DataAccessException {
       super.save(posPccodeNote);
  }
  
  /**
   *update posPccodeNote method
   *@param posPccodeNote PosPccodeNote
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void update(PosPccodeNote posPccodeNote) throws DataAccessException{
     super.update(posPccodeNote);
  }
  
   /**
   *save or update posPccodeNote object method
   *@param posPccodeNote PosPccodeNote
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdate(PosPccodeNote posPccodeNote) throws DataAccessException{
     super.saveOrUpdate(posPccodeNote);
  }
  
   /**
   *query posPccodeNote collection method
   *@param posPccodeNote PosPccodeNote send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeNote> list(PosPccodeNote posPccodeNote,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPccodeNote obj WHERE 1=1 ");
  	 spellSQL(sh,posPccodeNote);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posPccodeNote PosPccodeNote send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public List<PosPccodeNote> list(PosPccodeNote posPccodeNote)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPccodeNote obj WHERE 1=1 ");
  	 spellSQL(sh,posPccodeNote);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posPccodeNote PosPccodeNote query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int count(PosPccodeNote posPccodeNote)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosPccodeNote obj WHERE 1=1 ");
    spellSQL(sh,posPccodeNote);
    return count(sh);
  }
  
   /**
   *query a posPccodeNote by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeNote load(Long id)throws DataAccessException
  {
    return load(PosPccodeNote.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posPccodeNote query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  private void spellSQL(SQLHelper sh,PosPccodeNote posPccodeNote)
  {
    if(posPccodeNote != null){
    	if(posPccodeNote.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posPccodeNote.getId());
         }
         if(posPccodeNote.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posPccodeNote.getHotelGroupId());
         }
         if(posPccodeNote.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posPccodeNote.getHotelId());
         }
        if(isNotNull(posPccodeNote.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posPccodeNote.getPccode().trim());
        }
        if(isNotNull(posPccodeNote.getNoteCode())){
           sh.appendSql(" AND obj.noteCode = ? ");
           sh.insertValue(posPccodeNote.getNoteCode().trim());
        }
        if(isNotNull(posPccodeNote.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posPccodeNote.getIsHalt().trim());
        }
       if(posPccodeNote.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posPccodeNote.getListOrder());
        }
        if(isNotNull(posPccodeNote.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posPccodeNote.getIsGroup().trim());
        }
        if(isNotNull(posPccodeNote.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posPccodeNote.getGroupCode().trim());
        }
        if(isNotNull(posPccodeNote.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posPccodeNote.getCodeType().trim());
        }
        if(isNotNull(posPccodeNote.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posPccodeNote.getCreateUser().trim());
         }
        if(posPccodeNote.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posPccodeNote.getCreateDatetime());
         }
         if(isNotNull(posPccodeNote.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posPccodeNote.getModifyUser().trim());
         }
        if(posPccodeNote.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posPccodeNote.getModifyDatetime());
         }
    }
  }

@Override
public List<PosPccodeNote> findPosPccodeNote(Long hotelGroupId, Long hotelId,
		Date modifyDatetime) {
	SQLHelper sh = new SQLHelper("SELECT obj FROM PosPccodeNote obj WHERE 1=1 ");
	sh.appendSql(" AND obj.hotelGroupId=? ");
	sh.insertValue(hotelGroupId);
	sh.appendSql(" AND obj.hotelId =?  ");
	sh.insertValue(hotelId);
	if (modifyDatetime != null) {
		sh.appendSql(" AND obj.modifyDatetime>? ");
		sh.insertValue(modifyDatetime);
	}
	return find(sh);
}




}