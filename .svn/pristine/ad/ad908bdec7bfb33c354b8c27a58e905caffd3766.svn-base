package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.greencloud.entity.PosStoreArticle;
import com.greencloud.entity.PosStoreClass;
import com.greencloud.entity.PosStoreSubclass;
import com.greencloud.dao.IPosStoreArticleDao;
import com.greencloud.dao.IPosStoreClassDao;
import com.greencloud.dao.IPosStoreSubclassDao;
import com.greencloud.dto.PosStoreDto;
import com.greencloud.dto.PosStoreEditDto;
import com.greencloud.service.IPosStoreArticleService;

import org.springframework.dao.DataAccessException;
public class PosStoreArticleServiceImpl extends BaseServiceImpl implements IPosStoreArticleService
{
   //dao 
   private IPosStoreArticleDao posStoreArticleDao;
   private IPosStoreClassDao posStoreClassDao;
   private IPosStoreSubclassDao posStoreSubclassDao;
   
   
  /**
   *save posStoreArticle object  method
   *@param posStoreArticle PosStoreArticle 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void savePosStoreArticle(PosStoreArticle posStoreArticle) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosStoreArticle method");
		}
         posStoreArticleDao.save(posStoreArticle);
     	if(log.isDebugEnabled()){
			log.debug("end savePosStoreArticle method");
		}
  }//end save method
  
   /**
   *update posStoreArticle method
   *@param posStoreArticle PosStoreArticle
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void updatePosStoreArticle(PosStoreArticle posStoreArticle) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosStoreArticle method");
		}
        posStoreArticleDao.update(posStoreArticle);
        if(log.isDebugEnabled()){
			log.debug("end updatePosStoreArticle method");
		}
  }//end update method
  
   /**
   *save or update posStoreArticle object method
   *@param posStoreArticle PosStoreArticle
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void saveOrUpdatePosStoreArticle(PosStoreArticle posStoreArticle) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosStoreArticle method");
		}
		
        posStoreArticleDao.saveOrUpdate(posStoreArticle);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosStoreArticle method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posStoreArticle PosStoreArticle query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-02 13:38
   */
  public Container<PosStoreArticle> findPosStoreArticle(PosStoreArticle posStoreArticle,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosStoreArticle method");
		}
        Container<PosStoreArticle> container = new Container<PosStoreArticle>();
        List<PosStoreArticle> list = posStoreArticleDao.list(posStoreArticle, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posStoreArticleDao.count(posStoreArticle));
        if(log.isDebugEnabled()){
			log.debug("end findPosStoreArticle method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posStoreArticle PosStoreArticle query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 13:38
   */
  public int countPosStoreArticle(PosStoreArticle posStoreArticle)throws DataAccessException{
    return posStoreArticleDao.count(posStoreArticle);
  }//end count method
  
   /**
   *query a posStoreArticle by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 13:38
   */
  public PosStoreArticle findPosStoreArticleById(Long id)throws DataAccessException{
    PosStoreArticle  posStoreArticle = posStoreArticleDao.load(id);
    return posStoreArticle;
  }//end findPosStoreArticleById method
  
    /**
   *query posStoreArticle collection method
   *@param posStoreArticle PosStoreArticle send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  13:38
   */
  public List<PosStoreArticle> listPosStoreArticle(PosStoreArticle  posStoreArticle)
		throws DataAccessException {
	  List<PosStoreArticle> list = posStoreArticleDao.list(posStoreArticle);
      return list;
  }//end list method
  
   /**
   *query posStoreArticle collection method
   *@param posStoreArticle PosStoreArticle send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  13:38
   */
  public List<PosStoreArticle> listPosStoreArticle(PosStoreArticle posStoreArticle,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosStoreArticle> list = posStoreArticleDao.list(posStoreArticle, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posStoreArticleDao 
   * @author weihuawon
   * @date 2015年M12月d2�?13:38
   */
  public void setPosStoreArticleDao(IPosStoreArticleDao posStoreArticleDao){ 
     this.posStoreArticleDao = posStoreArticleDao;
  }//end setPosStoreArticleDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posStoreArticleDao;
  }//end getDao method

	@Override
	public List<PosStoreDto> getStoreTree(Long hotelGroupId, Long hotelId)
			throws DataAccessException {
		List<PosStoreDto> listL = new ArrayList<PosStoreDto>();
		PosStoreDto storeDto = new PosStoreDto();
		storeDto.name = "物品大类";
		storeDto.type = "type";
		
		PosStoreClass storeClass = new PosStoreClass();
		storeClass.setHotelGroupId(hotelGroupId);
		storeClass.setHotelId(hotelId);
		List<PosStoreClass> classList = posStoreClassDao.list(storeClass);
		List<PosStoreDto> list = new ArrayList<PosStoreDto>();
		if(classList != null && classList.size() > 0){
			for(Iterator<PosStoreClass> i = classList.iterator();i.hasNext();){
				PosStoreClass posStoreClass = i.next();
				PosStoreDto posStoreDto = new PosStoreDto();
				posStoreDto.code = posStoreClass.getCode();
				posStoreDto.id = posStoreClass.getId();
				posStoreDto.name = posStoreClass.getName();
				posStoreDto.type = "class";
				
				PosStoreSubclass storeSubclass = new PosStoreSubclass();
				storeSubclass.setHotelGroupId(hotelGroupId);
				storeSubclass.setHotelId(hotelId);
				storeSubclass.setCseg(posStoreClass.getCode());
				List<PosStoreSubclass> subclassList = posStoreSubclassDao.list(storeSubclass);
				List<PosStoreDto> list2 = new ArrayList<PosStoreDto>();
				if(subclassList != null && subclassList.size() > 0){
					for(Iterator<PosStoreSubclass> j = subclassList.iterator(); j.hasNext();){
						PosStoreSubclass posStoreSubclass = j.next();
						PosStoreDto posStoreDto2 = new PosStoreDto();
						posStoreDto2.code = posStoreSubclass.getCode();
						posStoreDto2.id = posStoreSubclass.getId();
						posStoreDto2.name = posStoreSubclass.getName();
						posStoreDto2.type = "subclass";
						
						PosStoreArticle storeArticle = new PosStoreArticle();
						storeArticle.setHotelGroupId(hotelGroupId);
						storeArticle.setHotelId(hotelId);
						storeArticle.setSseg(posStoreSubclass.getCode());
						List<PosStoreArticle> articleList = posStoreArticleDao.list(storeArticle);
						List<PosStoreDto> list3 = new ArrayList<PosStoreDto>();
						if(articleList != null && articleList.size() > 0){
							for(Iterator<PosStoreArticle> k = articleList.iterator(); k.hasNext();){
								PosStoreArticle posStoreArticle = k.next();
								PosStoreDto posStoreDto3 = new PosStoreDto();
								posStoreDto3.code = posStoreArticle.getCode();
								posStoreDto3.id = posStoreArticle.getId();
								posStoreDto3.name = posStoreArticle.getName();
								posStoreDto3.type = "article";
								posStoreDto3.price = posStoreArticle.getPrice();
								list3.add(posStoreDto3);
							}
						}
						posStoreDto2.children = list3;
						list2.add(posStoreDto2);
					}
				}
				posStoreDto.children = list2; 
				list.add(posStoreDto);
			}
		}
		storeDto.children = list;
		listL.add(storeDto);
		return listL;
	}

	public void setPosStoreClassDao(IPosStoreClassDao posStoreClassDao) {
		this.posStoreClassDao = posStoreClassDao;
	}

	public void setPosStoreSubclassDao(IPosStoreSubclassDao posStoreSubclassDao) {
		this.posStoreSubclassDao = posStoreSubclassDao;
	}
	
	@Override
	public List<PosStoreArticle> getPosStoreArticleBycode(Long hotelGroupId,Long hotelId, String acode) {
		PosStoreArticle posStoreArticle = new PosStoreArticle();
		posStoreArticle.setHotelGroupId(hotelGroupId);
		posStoreArticle.setHotelId(hotelId);
		posStoreArticle.setSseg(acode);
		List<PosStoreArticle> list = posStoreArticleDao.list(posStoreArticle);
		return list;
	}

	@Override
	public void saveGroupPosArticle(Long hotelGroupId, Long hotelId,PosStoreArticle posStoreArticle) 
	{
		System.out.println("hotelid:"+hotelId);
		if(posStoreArticle!=null)
		{
				if(hotelId==0)
				{
						//集团更新
						String code = posStoreArticle.getSseg();
						List<PosStoreSubclass> list = getPosArticleAllByCode(hotelGroupId,hotelId,code);
						if(list !=null && list.size()>0)
						{
								for(Iterator<PosStoreSubclass> i=list.iterator();i.hasNext();)
								{
										PosStoreSubclass posSubClassGet = i.next();
										
										PosStoreArticle storeArticleCopy = posStoreArticle.cloneEx();
										storeArticleCopy.setHotelGroupId(posSubClassGet.getHotelGroupId());
										storeArticleCopy.setHotelId(posSubClassGet.getHotelId());
										storeArticleCopy.setSseg(posSubClassGet.getCode());
										
										posStoreSubclassDao.save(storeArticleCopy);
								}
						}
				}else
				{
						//酒店更新
					posStoreArticle.setHotelGroupId(hotelGroupId);
					posStoreArticle.setHotelId(hotelId);
						posStoreArticleDao.save(posStoreArticle);
				}
		}
	}
	
	private List<PosStoreSubclass> getPosArticleAllByCode(Long hotelGroupId,Long hotelId, String code)
	{
			List<PosStoreSubclass> list = new ArrayList<PosStoreSubclass>();
			PosStoreSubclass posSubClass = new PosStoreSubclass();
			posSubClass.setHotelGroupId(hotelGroupId);
			posSubClass.setHotelId(hotelId);
			posSubClass.setCode(code);
			List<PosStoreSubclass> list1=posStoreSubclassDao.list(posSubClass);
			if(list1 != null)
			{
				list = list1;
			}
			return list;
	}

	@Override
	public void updatePosArticleByDto(Long hotelGroupId, Long hotelId,PosStoreEditDto posStoreEditDto) {
		System.out.println("hotelid:"+hotelId);
		if(posStoreEditDto!=null)
		{
			if(hotelId == 0)
			{
				//集团更新
				PosStoreArticle tsb = posStoreEditDto.tsb;
				if(tsb!=null)
				{
//					String code= tsb.getSseg();
//					List<PosStoreSubclass> list = getPosArticleAllByCode(hotelGroupId,hotelId,code);
//					if(list !=null && list.size()>0)
//					{
//							for(Iterator<PosStoreSubclass> i=list.iterator();i.hasNext();)
//							{
//									PosStoreSubclass posSubClassGet = i.next();
//									
//									PosStoreArticle articleDetail = new PosStoreArticle();
//									articleDetail.setHotelGroupId(posSubClassGet.getHotelGroupId());
//									articleDetail.setHotelId(posSubClassGet.getHotelId());
//									articleDetail.setSseg(posSubClassGet.getCode());
//									
//									List<PosStoreArticle> modifyArticleList = posStoreArticleDao.list(articleDetail);
//									if(modifyArticleList!=null && modifyArticleList.size()>0)
//									{
//											PosStoreArticle articleModify =modifyArticleList.get(0);
//											posStoreArticleDao.update(articleModify);
//									}
//							}
//					}
					posStoreArticleDao.update(tsb);
				}
			}else
			{
				//酒店更新
				posStoreArticleDao.update(posStoreEditDto.tsb);
			}
		}
	}

	@Override
	public void deleteGroupPosArticle(Long hotelGroupId, Long hotelId,PosStoreArticle posStoreArticle) {
		System.out.println("hotelid:"+hotelId);
		if(posStoreArticle!=null)
		{
			if(hotelId == 0)
			{
					//集团更新
					String code= posStoreArticle.getSseg();
					List<PosStoreSubclass> list = getPosArticleAllByCode(hotelGroupId,hotelId,code);
					if(list !=null && list.size()>0)
					{
							for(Iterator<PosStoreSubclass> i=list.iterator();i.hasNext();)
							{
									PosStoreSubclass posSubClassGet = i.next();
									
									PosStoreArticle articleDetail = new PosStoreArticle();
									articleDetail.setHotelGroupId(posSubClassGet.getHotelGroupId());
									articleDetail.setHotelId(posSubClassGet.getHotelId());
									articleDetail.setSseg(posSubClassGet.getCode());
									
									List<PosStoreArticle> deleteArticleList = posStoreArticleDao.list(articleDetail);
									if(deleteArticleList!=null && deleteArticleList.size()>0)
									{
											PosStoreArticle articleDelete =deleteArticleList.get(0);
											posStoreArticleDao.delete(articleDelete);
									}
							}
					}
//					posStoreArticleDao.delete(posStoreArticle);
			}else
			{
				//酒店更新
				posStoreArticleDao.delete(posStoreArticle);
			}
		}
	}

	@Override
	public String posStoreMaxCode(Long hotelGroupId, Long hotelId, String type,String pCode) {
		String maxCode = "";
		long maxCodeL = 0;
		if(type!=null && type.equals("class"))
		{
			maxCode = posStoreArticleDao.posStoreMaxCode(type,pCode,hotelGroupId,hotelId);
			if(maxCode!="" && !maxCode.trim().equals("0"))
			{
				maxCodeL=Long.parseLong(maxCode)+1;
				System.out.println("Class==maxCodeL:"+maxCodeL);
				maxCode = Long.toString(maxCodeL);
				return maxCode;
			}else
			{
				return "1";
			}
		}else if(type!=null && type.equals("subClass"))
		{
			maxCode = posStoreArticleDao.posStoreMaxCode(type,pCode,hotelGroupId,hotelId);
			if(maxCode!="" && !maxCode.trim().equals("0"))
			{
				maxCodeL=Long.parseLong(maxCode)+1;
				System.out.println("subClass==maxCodeL:"+maxCodeL);
				maxCode = Long.toString(maxCodeL);
				return maxCode;
			}else
			{
				return  (pCode+"001");
			}
		}else if(type!=null && type.equals("article"))
		{
			maxCode = posStoreArticleDao.posStoreMaxCode(type,pCode,hotelGroupId,hotelId);
			if(maxCode!="" && !maxCode.trim().equals("0"))
			{
				maxCodeL=Long.parseLong(maxCode)+1;
				System.out.println("article==maxCodeL:"+maxCodeL);
				maxCode = Long.toString(maxCodeL);
				return maxCode;
			}else
			{
				return  (pCode+"001");
			}
		}else
		{
			return null;
		}
	}

	@Override
	public void getArticleMess(Long hotelGroupId, Long hotelId, String acode,String code) 
	{
//		 PosStoreArticle posStoreArticle = new PosStoreArticle();
//		 posStoreArticle.setHotelGroupId(hotelGroupId);
//		 posStoreArticle.setHotelId(hotelId);
//		 posStoreArticle.setCode(acode);
//		 List<PosStoreArticle> listArticle = posStoreArticleDao.list(posStoreArticle);
//		 if(listArticle !=null && listArticle.size()>0)
//		 {
//			 	PosStoreArticle posStoreArticleGet = listArticle.get(0);
//			 	
//			 	PosPldefPrice posPldefPrice = new PosPldefPrice();
//			 	posPldefPrice.setPccode(code);
//			 	posPldefPrice.setInumber(this.getInumber(posStoreArticleGet.getHotelGroupId()));
//			 	posPldefPrice.setArticle(posStoreArticleGet.getCode());
//			 	posPldefPrice.setUnit(posStoreArticleGet.getUnit());
//			 	posPldefPrice.setDescript(posStoreArticleGet.getName());
//			 	posPldefPrice.setNumber(posStoreArticleGet.getCsnumber());
//			 	posPldefPrice.setPrice(posStoreArticleGet.getPrice());
//			 	posPldefPrice.setRate(posStoreArticleGet.getMaxQuan());
//			 	
//			 	posPldefPriceDao.saveOrUpdate(posPldefPrice);
//		 }
	}
	
//	public int getInumber(Long hotelGroupId){
//		int inumber = 0;
//		PosPldefPrice posPldefPrice = new PosPldefPrice();
//		posPldefPrice.setHotelGroupId(hotelGroupId);
//		List<PosPldefPrice> list= posPldefPriceDao.list(posPldefPrice);
//		if(list != null && list.size()>0){
//			PosPldefPrice posPldefPriceGet = list.get(list.size()-1);
//			inumber = posPldefPriceGet.getInumber();
//			return inumber;
//		}else
//		{
//			return 1;
//		}
//	}

	@Override
	public PosStoreArticle getArticleByCode(Long hotelGroupId, Long hotelId,String acode) {
		PosStoreArticle posStoreArticle = new PosStoreArticle();
		posStoreArticle.setHotelGroupId(hotelGroupId);
		posStoreArticle.setHotelId(hotelId);
		posStoreArticle.setCode(acode);
		List<PosStoreArticle> list = posStoreArticleDao.list(posStoreArticle);
		if(list != null && list.size()>0)
		{
			posStoreArticle=list.get(0);
			return posStoreArticle;
		}
		return null;
	}

	@Override
	public List<PosStoreArticle> checkDataArticle(Long hotelGroupId,Long hotelId, String scode) {
		PosStoreArticle posStoreArticle = new PosStoreArticle();
		posStoreArticle.setHotelGroupId(hotelGroupId);
		posStoreArticle.setHotelId(hotelId);
		posStoreArticle.setSseg(scode);
		List<PosStoreArticle> list = posStoreArticleDao.list(posStoreArticle);
		return list;
	}
}//end class PosStoreArticleServiceImpl