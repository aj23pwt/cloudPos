package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;
import static com.aua.util.StringHelper.*;
import java.util.List;
import com.greencloud.entity.PosStoreSubclass;
import com.greencloud.dao.IPosStoreSubclassDao;
import org.springframework.dao.DataAccessException;

   /**
   * operate PosStoreSubclass into db
   *@author 
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public class PosStoreSubclassDaoImpl extends BaseDaoImpl implements IPosStoreSubclassDao{

  /**
   *save posStoreSubclass object  method
   *@param posStoreSubclass PosStoreSubclass 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void save(PosStoreSubclass posStoreSubclass) throws DataAccessException {
       super.save(posStoreSubclass);
  }
  
  /**
   *update posStoreSubclass method
   *@param posStoreSubclass PosStoreSubclass
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void update(PosStoreSubclass posStoreSubclass) throws DataAccessException{
     super.update(posStoreSubclass);
  }
  
   /**
   *save or update posStoreSubclass object method
   *@param posStoreSubclass PosStoreSubclass
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void saveOrUpdate(PosStoreSubclass posStoreSubclass) throws DataAccessException{
     super.saveOrUpdate(posStoreSubclass);
  }
  
   /**
   *query posStoreSubclass collection method
   *@param posStoreSubclass PosStoreSubclass send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  14:20
   */
  public List<PosStoreSubclass> list(PosStoreSubclass posStoreSubclass,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreSubclass obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreSubclass);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posStoreSubclass PosStoreSubclass send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public List<PosStoreSubclass> list(PosStoreSubclass posStoreSubclass)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreSubclass obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreSubclass);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posStoreSubclass PosStoreSubclass query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 14:20
   */
  public int count(PosStoreSubclass posStoreSubclass)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosStoreSubclass obj WHERE 1=1 ");
    spellSQL(sh,posStoreSubclass);
    return count(sh);
  }
  
   /**
   *query a posStoreSubclass by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 14:20
   */
  public PosStoreSubclass load(Long id)throws DataAccessException
  {
    return load(PosStoreSubclass.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posStoreSubclass query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-02 14:20
   */
  private void spellSQL(SQLHelper sh,PosStoreSubclass posStoreSubclass)
  {
    if(posStoreSubclass != null){
    	if(posStoreSubclass.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posStoreSubclass.getId());
         }
         if(posStoreSubclass.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posStoreSubclass.getHotelGroupId());
         }
         if(posStoreSubclass.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posStoreSubclass.getHotelId());
         }
        if(isNotNull(posStoreSubclass.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posStoreSubclass.getCode().trim());
        }
        if(isNotNull(posStoreSubclass.getName())){
           sh.appendSql(" AND obj.name = ? ");
           sh.insertValue(posStoreSubclass.getName().trim());
        }
        if(isNotNull(posStoreSubclass.getEngName())){
           sh.appendSql(" AND obj.engName = ? ");
           sh.insertValue(posStoreSubclass.getEngName().trim());
        }
        if(isNotNull(posStoreSubclass.getCseg())){
           sh.appendSql(" AND obj.cseg = ? ");
           sh.insertValue(posStoreSubclass.getCseg().trim());
        }
        if(isNotNull(posStoreSubclass.getCname())){
           sh.appendSql(" AND obj.cname = ? ");
           sh.insertValue(posStoreSubclass.getCname().trim());
        }
        if(isNotNull(posStoreSubclass.getCstype())){
           sh.appendSql(" AND obj.cstype = ? ");
           sh.insertValue(posStoreSubclass.getCstype().trim());
        }
        if(isNotNull(posStoreSubclass.getEngCname())){
           sh.appendSql(" AND obj.engCname = ? ");
           sh.insertValue(posStoreSubclass.getEngCname().trim());
        }
        if(isNotNull(posStoreSubclass.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posStoreSubclass.getIsGroup().trim());
        }
        if(isNotNull(posStoreSubclass.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posStoreSubclass.getGroupCode().trim());
        }
        if(isNotNull(posStoreSubclass.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posStoreSubclass.getCodeType().trim());
        }
        if(isNotNull(posStoreSubclass.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posStoreSubclass.getCreateUser().trim());
         }
        if(posStoreSubclass.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posStoreSubclass.getCreateDatetime());
         }
         if(isNotNull(posStoreSubclass.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posStoreSubclass.getModifyUser().trim());
         }
        if(posStoreSubclass.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posStoreSubclass.getModifyDatetime());
         }
    }
  }
}