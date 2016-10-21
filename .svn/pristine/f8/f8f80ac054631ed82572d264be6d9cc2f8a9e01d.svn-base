package com.greencloud.service.impl;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import com.aua.util.Container;
import com.greencloud.dao.ICodeBaseDao;
import com.greencloud.dao.IPosConddtlDao;
import com.greencloud.dao.IPosCondstDao;
import com.greencloud.dto.CondstDto;
import com.greencloud.entity.CodeBase;
import com.greencloud.entity.PosConddtl;
import com.greencloud.entity.PosCondst;
import com.greencloud.service.IPosConddtlService;
public class PosConddtlServiceImpl extends BaseServiceImpl implements IPosConddtlService
{
   //dao 
   private IPosConddtlDao posConddtlDao;
 
   private IPosCondstDao posCondstDao;
   private ICodeBaseDao codeBaseDao;
   public void setCodeBaseDao(ICodeBaseDao codeBaseDao)
   {
   	this.codeBaseDao = codeBaseDao;
   }

  public void setPosCondstDao(IPosCondstDao posCondstDao) {
	this.posCondstDao = posCondstDao;
}

/**
   *save posConddtl object  method
   *@param posConddtl PosConddtl 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosConddtl(PosConddtl posConddtl) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosConddtl method");
		}
         posConddtlDao.save(posConddtl);
     	if(log.isDebugEnabled()){
			log.debug("end savePosConddtl method");
		}
  }//end save method
  
   /**
   *update posConddtl method
   *@param posConddtl PosConddtl
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosConddtl(PosConddtl posConddtl) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosConddtl method");
		}
        posConddtlDao.update(posConddtl);
        if(log.isDebugEnabled()){
			log.debug("end updatePosConddtl method");
		}
  }//end update method
  
   /**
   *save or update posConddtl object method
   *@param posConddtl PosConddtl
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosConddtl(PosConddtl posConddtl) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosConddtl method");
		}
		
        posConddtlDao.saveOrUpdate(posConddtl);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosConddtl method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posConddtl PosConddtl query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosConddtl> findPosConddtl(PosConddtl posConddtl,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosConddtl method");
		}
        Container<PosConddtl> container = new Container<PosConddtl>();
        List<PosConddtl> list = posConddtlDao.list(posConddtl, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posConddtlDao.count(posConddtl));
        if(log.isDebugEnabled()){
			log.debug("end findPosConddtl method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posConddtl PosConddtl query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosConddtl(PosConddtl posConddtl)throws DataAccessException{
    return posConddtlDao.count(posConddtl);
  }//end count method
  
   /**
   *query a posConddtl by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosConddtl findPosConddtlById(Long id)throws DataAccessException{
    PosConddtl  posConddtl = posConddtlDao.load(id);
    return posConddtl;
  }//end findPosConddtlById method
  
    /**
   *query posConddtl collection method
   *@param posConddtl PosConddtl send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosConddtl> listPosConddtl(PosConddtl  posConddtl)
		throws DataAccessException {
	  List<PosConddtl> list = posConddtlDao.list(posConddtl);
      return list;
  }//end list method
  
   /**
   *query posConddtl collection method
   *@param posConddtl PosConddtl send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
	  public List<PosConddtl> listPosConddtl(PosConddtl posConddtl,int firstResult ,int maxResults)throws DataAccessException{
		   List<PosConddtl> list = posConddtlDao.list(posConddtl, firstResult ,maxResults);
		   return list;
	  }
	  
	  /**
	   * Spring 
	   * @param  posConddtlDao 
	   * @author weihuawon
	   * @date 2015年M3月d23�?16:31
	   */
	  public void setPosConddtlDao(IPosConddtlDao posConddtlDao){ 
	     this.posConddtlDao = posConddtlDao;
	  }//end setPosConddtlDao method
	  
	  @Override
	  protected IBaseDao getDao(){
	    return this.posConddtlDao;
	  }//end getDao method

	@Override
	public List<CondstDto> getCondstDto(long hotelGroupId, long hotelId,String pccode, String sortCode) {
		List<CondstDto> blist = new ArrayList<CondstDto>();
		
		PosCondst posCondst=new PosCondst();
		posCondst.setHotelGroupId(hotelGroupId);
		posCondst.setHotelId(hotelId);
		posCondst.setIsHalt("F");
		List<PosCondst> list = posCondstDao.list(posCondst);
		if(list!=null && list.size()>0){
			for(Iterator<PosCondst> i=list.iterator();i.hasNext();){
				PosCondst posCondstGet = i.next();
				
				PosConddtl posConddtl = new PosConddtl();
				posConddtl.setHotelGroupId(hotelGroupId);
				posConddtl.setHotelId(hotelId);
				posConddtl.setIsHalt("F");
				posConddtl.setCondstCode(posCondstGet.getCode());
				List<PosConddtl> list1 = posConddtlDao.list(posConddtl);
				
				if(list1!=null && list1.size()>0){
					CondstDto condstDto = new CondstDto();
					condstDto.setType(posCondstGet.getDescript());
					condstDto.setList(list1);
					blist.add(condstDto);
				}
			}
		}
		return blist;
	}

	@Override
	public List<PosConddtl> findPosConddtl(Long hotelGroupId, Long hotelId,Date modifyDatetime) {
		return posConddtlDao.findPosConddtl(hotelGroupId, hotelId, modifyDatetime);
	}

	@Override
	public String getCondstTreeDto(long hotelGroupId, long hotelId,
			String pccode, String sortCode)
	{
		StringBuffer sb = new StringBuffer("");
		sb.append("<node label='" + "做法" + "' value='*' checked='0'>");
		sb.append("\n");
		
		PosCondst posCondst=new PosCondst();
		posCondst.setHotelGroupId(hotelGroupId);
		posCondst.setHotelId(hotelId);
		posCondst.setIsHalt("F");
		List<PosCondst> list = posCondstDao.list(posCondst);
		
		if (list != null && list.size() > 0) {
			for (Iterator<PosCondst> i = list.iterator(); i.hasNext();) {
				PosCondst posCondstI = i.next();
				sb.append("<node label='" + posCondstI.getDescript()
						+ "' value='" + posCondstI.getCode()
						+ "' checked='0'>");
				sb.append("\n");
				PosConddtl posConddtl = new PosConddtl();
				posConddtl.setHotelGroupId(hotelGroupId);
				posConddtl.setHotelId(hotelId);
				posConddtl.setCondstCode(posCondst.getCode());
				List<PosConddtl> slist = posConddtlDao.list(posConddtl);
				if (slist != null && slist.size() > 0) {
					for (Iterator<PosConddtl> j = slist.iterator(); j.hasNext();) {
						PosConddtl PosConddtlI = j.next();
						sb.append("<node label='" + PosConddtlI.getDescript()
								+ "' value='" + PosConddtlI.getCode()
								+ "' checked='0'>");
						sb.append("\n");
						sb.append("</node>");
					}
				}
				sb.append("</node>");
			}
		}
		sb.append("</node>");
		return sb.toString();
	}

	@Override
	public String getPosRemarkTreeDto(long hotelGroupId, long hotelId,
			String pccode, String sortCode)
	{
		StringBuffer sb = new StringBuffer("");
		sb.append("<node label='" + "整单备注" + "' value='*' checked='0'>");
		sb.append("\n");
		
		CodeBase cb=new CodeBase();
		cb.setHotelGroupId(hotelGroupId);
		cb.setHotelId(hotelId);
		cb.setParentCode("pos_remark");
		cb.setIsHalt("F");
		List<CodeBase> list = codeBaseDao.list(cb);
		
		if (list != null && list.size() > 0) {
			for (Iterator<CodeBase> i = list.iterator(); i.hasNext();) {
				CodeBase codeBase = i.next();
				sb.append("<node label='" + codeBase.getDescript()
						+ "' value='" + codeBase.getCode()
						+ "' checked='0'>");
				sb.append("\n");				
				sb.append("</node>");
			}
		}
		sb.append("</node>");
		return sb.toString();
	}
}