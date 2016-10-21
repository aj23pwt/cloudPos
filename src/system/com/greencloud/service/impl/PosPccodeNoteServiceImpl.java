package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosPccodeNote;
import com.greencloud.dao.IPosPccodeNoteDao;
import com.greencloud.service.IPosPccodeNoteService;

import org.springframework.dao.DataAccessException;
public class PosPccodeNoteServiceImpl extends BaseServiceImpl implements IPosPccodeNoteService
{
   //dao 
   private IPosPccodeNoteDao posPccodeNoteDao;
   
  /**
   *save posPccodeNote object  method
   *@param posPccodeNote PosPccodeNote 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void savePosPccodeNote(PosPccodeNote posPccodeNote) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPccodeNote method");
		}
         posPccodeNoteDao.save(posPccodeNote);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPccodeNote method");
		}
  }//end save method
  
   /**
   *update posPccodeNote method
   *@param posPccodeNote PosPccodeNote
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void updatePosPccodeNote(PosPccodeNote posPccodeNote) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPccodeNote method");
		}
        posPccodeNoteDao.update(posPccodeNote);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPccodeNote method");
		}
  }//end update method
  
   /**
   *save or update posPccodeNote object method
   *@param posPccodeNote PosPccodeNote
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdatePosPccodeNote(PosPccodeNote posPccodeNote) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPccodeNote method");
		}
		
        posPccodeNoteDao.saveOrUpdate(posPccodeNote);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPccodeNote method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPccodeNote PosPccodeNote query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  public Container<PosPccodeNote> findPosPccodeNote(PosPccodeNote posPccodeNote,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPccodeNote method");
		}
        Container<PosPccodeNote> container = new Container<PosPccodeNote>();
        List<PosPccodeNote> list = posPccodeNoteDao.list(posPccodeNote, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPccodeNoteDao.count(posPccodeNote));
        if(log.isDebugEnabled()){
			log.debug("end findPosPccodeNote method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPccodeNote PosPccodeNote query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int countPosPccodeNote(PosPccodeNote posPccodeNote)throws DataAccessException{
    return posPccodeNoteDao.count(posPccodeNote);
  }//end count method
  
   /**
   *query a posPccodeNote by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeNote findPosPccodeNoteById(Long id)throws DataAccessException{
    PosPccodeNote  posPccodeNote = posPccodeNoteDao.load(id);
    return posPccodeNote;
  }//end findPosPccodeNoteById method
  
    /**
   *query posPccodeNote collection method
   *@param posPccodeNote PosPccodeNote send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeNote> listPosPccodeNote(PosPccodeNote  posPccodeNote)
		throws DataAccessException {
	  List<PosPccodeNote> list = posPccodeNoteDao.list(posPccodeNote);
      return list;
  }//end list method
  
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
  public List<PosPccodeNote> listPosPccodeNote(PosPccodeNote posPccodeNote,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPccodeNote> list = posPccodeNoteDao.list(posPccodeNote, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPccodeNoteDao 
   * @author weihuawon
   * @date 2015年M3月d24�?09:33
   */
  public void setPosPccodeNoteDao(IPosPccodeNoteDao posPccodeNoteDao){ 
     this.posPccodeNoteDao = posPccodeNoteDao;
  }//end setPosPccodeNoteDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPccodeNoteDao;
  }//end getDao method

@Override
public List<PosPccodeNote> findPosPccodeNote(Long hotelGroupId, Long hotelId,Date modifyDatetime) {
	return posPccodeNoteDao.findPosPccodeNote(hotelGroupId, hotelId, modifyDatetime);
}
}//end class PosPccodeNoteServiceImpl