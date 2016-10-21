package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.greencloud.entity.PosStoreClass;
import com.greencloud.entity.PosStoreSubclass;
import com.greencloud.dao.IPosStoreClassDao;
import com.greencloud.dao.IPosStoreSubclassDao;
import com.greencloud.dto.PosStoreEditDto;
import com.greencloud.service.IPosStoreSubclassService;

import org.springframework.dao.DataAccessException;
public class PosStoreSubclassServiceImpl extends BaseServiceImpl implements IPosStoreSubclassService
{
   //dao 
   private IPosStoreSubclassDao posStoreSubclassDao;
   private IPosStoreClassDao posStoreClassDao;
   
  public void setPosStoreClassDao(IPosStoreClassDao posStoreClassDao) {
	this.posStoreClassDao = posStoreClassDao;
}

/**
   *save posStoreSubclass object  method
   *@param posStoreSubclass PosStoreSubclass 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void savePosStoreSubclass(PosStoreSubclass posStoreSubclass) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosStoreSubclass method");
		}
         posStoreSubclassDao.save(posStoreSubclass);
     	if(log.isDebugEnabled()){
			log.debug("end savePosStoreSubclass method");
		}
  }//end save method
  
   /**
   *update posStoreSubclass method
   *@param posStoreSubclass PosStoreSubclass
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void updatePosStoreSubclass(PosStoreSubclass posStoreSubclass) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosStoreSubclass method");
		}
        posStoreSubclassDao.update(posStoreSubclass);
        if(log.isDebugEnabled()){
			log.debug("end updatePosStoreSubclass method");
		}
  }//end update method
  
   /**
   *save or update posStoreSubclass object method
   *@param posStoreSubclass PosStoreSubclass
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void saveOrUpdatePosStoreSubclass(PosStoreSubclass posStoreSubclass) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosStoreSubclass method");
		}
		
        posStoreSubclassDao.saveOrUpdate(posStoreSubclass);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosStoreSubclass method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posStoreSubclass PosStoreSubclass query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-02 14:20
   */
  public Container<PosStoreSubclass> findPosStoreSubclass(PosStoreSubclass posStoreSubclass,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosStoreSubclass method");
		}
        Container<PosStoreSubclass> container = new Container<PosStoreSubclass>();
        List<PosStoreSubclass> list = posStoreSubclassDao.list(posStoreSubclass, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posStoreSubclassDao.count(posStoreSubclass));
        if(log.isDebugEnabled()){
			log.debug("end findPosStoreSubclass method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posStoreSubclass PosStoreSubclass query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 14:20
   */
  public int countPosStoreSubclass(PosStoreSubclass posStoreSubclass)throws DataAccessException{
    return posStoreSubclassDao.count(posStoreSubclass);
  }//end count method
  
   /**
   *query a posStoreSubclass by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 14:20
   */
  public PosStoreSubclass findPosStoreSubclassById(Long id)throws DataAccessException{
    PosStoreSubclass  posStoreSubclass = posStoreSubclassDao.load(id);
    return posStoreSubclass;
  }//end findPosStoreSubclassById method
  
    /**
   *query posStoreSubclass collection method
   *@param posStoreSubclass PosStoreSubclass send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  14:20
   */
  public List<PosStoreSubclass> listPosStoreSubclass(PosStoreSubclass  posStoreSubclass)
		throws DataAccessException {
	  List<PosStoreSubclass> list = posStoreSubclassDao.list(posStoreSubclass);
      return list;
  }//end list method
  
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
  public List<PosStoreSubclass> listPosStoreSubclass(PosStoreSubclass posStoreSubclass,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosStoreSubclass> list = posStoreSubclassDao.list(posStoreSubclass, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posStoreSubclassDao 
   * @author weihuawon
   * @date 2015年M12月d2�?14:20
   */
  public void setPosStoreSubclassDao(IPosStoreSubclassDao posStoreSubclassDao){ 
     this.posStoreSubclassDao = posStoreSubclassDao;
  }//end setPosStoreSubclassDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posStoreSubclassDao;
  }//end getDao method
  
  @Override
	public List<PosStoreSubclass> getPosStoreSubClassBycode(Long hotelGroupId,Long hotelId, String scode) 
	{
		PosStoreSubclass posStoreSclass = new PosStoreSubclass();
		posStoreSclass.setHotelGroupId(hotelGroupId);
		posStoreSclass.setHotelId(hotelId);
		posStoreSclass.setCseg(scode);
		List<PosStoreSubclass> list = posStoreSubclassDao.list(posStoreSclass);
		return list;
	}

	@Override
	public void saveGroupPosSubClass(Long hotelGroupId, Long hotelId,PosStoreSubclass posStoreSubclass, String hotels) 
	{
		System.out.println("hotelid:"+hotelId);
		if(posStoreSubclass!=null)
		{
				if(hotelId==0)
				{
						//集团更新
						String code = posStoreSubclass.getCseg();
						List<PosStoreClass> list = getPosSubClassAllByCode(hotelGroupId,hotelId,code);
						if(list !=null && list.size()>0)
						{
								for(Iterator<PosStoreClass> i=list.iterator();i.hasNext();)
								{
										PosStoreClass posStoreClassGet = i.next();
										
										PosStoreSubclass subClassCopy = posStoreSubclass.cloneEx();
										subClassCopy.setHotelGroupId(posStoreClassGet.getHotelGroupId());
										subClassCopy.setHotelId(posStoreClassGet.getHotelId());
										subClassCopy.setCseg(posStoreClassGet.getCode());
										
										posStoreSubclassDao.save(subClassCopy);
								}
						}
				}else
				{
						//酒店更新
						posStoreSubclass.setHotelGroupId(hotelGroupId);
						posStoreSubclass.setHotelId(hotelId);
						posStoreSubclassDao.save(posStoreSubclass);
				}
		}
	}

	private List<PosStoreClass> getPosSubClassAllByCode(Long hotelGroupId,Long hotelId, String code)
	{
			List<PosStoreClass> list = new ArrayList<PosStoreClass>();
			PosStoreClass posStoreClass = new PosStoreClass();
			posStoreClass.setHotelGroupId(hotelGroupId);
			posStoreClass.setHotelId(hotelId);
			posStoreClass.setCode(code);
			List<PosStoreClass> list1=posStoreClassDao.list(posStoreClass);
			if(list1 != null)
			{
				list = list1;
			}
			return list;
	}

	@Override
	public void updatePosSubClassByDto(Long hotelGroupId, Long hotelId,PosStoreEditDto posStoreEditDto) {
			System.out.println("hotelid:"+hotelId);
			if(posStoreEditDto!=null)
			{
				if(hotelId == 0)
				{
					//集团更新
					PosStoreSubclass ssb = posStoreEditDto.ssb;
					if(ssb!=null)
					{
//						String code= ssb.getCseg();
//						List<PosStoreClass> list = getPosSubClassAllByCode(hotelGroupId,hotelId,code);
//						if(list !=null && list.size()>0)
//						{
//								for(Iterator<PosStoreClass> i=list.iterator();i.hasNext();)
//								{
//										PosStoreClass posStoreClassGet = i.next();
//										
//										PosStoreSubclass subClassDetail = new PosStoreSubclass();
//										subClassDetail.setHotelGroupId(posStoreClassGet.getHotelGroupId());
//										subClassDetail.setHotelId(posStoreClassGet.getHotelId());
//										subClassDetail.setCseg(posStoreClassGet.getCode());
//										
//										List<PosStoreSubclass> modifySubClassList = posStoreSubclassDao.list(subClassDetail);
//										if(modifySubClassList!=null && modifySubClassList.size()>0)
//										{
//												PosStoreSubclass subClassModify =modifySubClassList.get(0);
//												posStoreSubclassDao.update(subClassModify);
//										}
//								}
//						}
						posStoreSubclassDao.update(ssb);
					}
				}else
				{
					//酒店更新
					posStoreSubclassDao.update(posStoreEditDto.ssb);
				}
			}
	}

	@Override
	public void deleteGroupPosSubClass(Long hotelGroupId, Long hotelId,PosStoreSubclass posStoreSubclass) {
		System.out.println("hotelid:"+hotelId);
		if(posStoreSubclass!=null)
		{
			 if(hotelId == 0)
			 {
				 	//集团更新
//				    String code = posStoreSubclass.getCseg();
//					List<PosStoreClass> list = getPosSubClassAllByCode(hotelGroupId,hotelId,code);
//					if(list !=null && list.size()>0)
//					{
//							for(Iterator<PosStoreClass> i=list.iterator();i.hasNext();)
//							{
//								PosStoreClass posStoreClassGet = i.next();
//								
//								PosStoreSubclass subClassDetail = new PosStoreSubclass();
//								subClassDetail.setHotelGroupId(posStoreClassGet.getHotelGroupId());
//								subClassDetail.setHotelId(posStoreClassGet.getHotelId());
//								subClassDetail.setCseg(posStoreClassGet.getCode());
//								
//								List<PosStoreSubclass> deleteSubClassList = posStoreSubclassDao.list(subClassDetail);
//								if(deleteSubClassList!=null && deleteSubClassList.size()>0)
//								{
//										PosStoreSubclass subClassDelete =deleteSubClassList.get(0);
//										posStoreSubclassDao.update(subClassDelete);
//								}
//							}
//					}
					posStoreSubclassDao.delete(posStoreSubclass);
			 }else
			 {
				 	//酒店更新
				 	posStoreSubclassDao.delete(posStoreSubclass);
			 }
		}
	}

	@Override
	public List<PosStoreSubclass> checkDataSubClass(Long hotelGroupId,Long hotelId, String scode) {
		PosStoreSubclass posStoreSubClass = new PosStoreSubclass();
		posStoreSubClass.setHotelGroupId(hotelGroupId);
		posStoreSubClass.setHotelId(hotelId);
		posStoreSubClass.setCseg(scode);
		List<PosStoreSubclass> list = posStoreSubclassDao.list(posStoreSubClass);
		return list;
	}
}//end class PosStoreSubclassServiceImpl