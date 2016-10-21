package com.greencloud.dao.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.aua.dao.impl.BaseDaoImpl;
import com.aua.util.Container;
import com.greencloud.dao.ICateringDao;
import com.greencloud.dao.ICommonDao;
import com.greencloud.dto.CateringSearchDto;
import com.greencloud.entity.Catering;
import com.greencloud.entity.CateringResource;
import com.greencloud.entity.CateringResourceMap;
import com.greencloud.util.DateUtil;
import com.greencloud.util.SQLHelper;
import com.greencloud.util.StringUtil;
/**
 * 
 * @author yangchao
 * @email yangchao@ipms.cn
 *
 */
@Repository("cateringDao")
public class CateringDaoImpl extends BaseDaoImpl implements ICateringDao {

	@Resource
	private ICommonDao commonDao;
	
	public void setCommonDao(ICommonDao commonDao) {
		this.commonDao = commonDao;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public boolean isResourceInUse(Long hotelGroupId, Long hotelId, String code) {
		SQLHelper sh = new SQLHelper();
		sh.appendSql("select 1 from CateringResourceMap a,Catering b where a.catering = b.id and a.cateringResource = ? and a.hotelGroupId = ? and a.hotelId = ? and b.sta in ('W','R','I')");
		sh.insertValue(code);
		sh.insertValue(hotelId);
		sh.insertValue(hotelGroupId);
		List list = find(sh);
		return list.size() > 0;
	}

	@Override
	public List<CateringResource> listCateringResourceByCateringId(Long hotelGroupId,Long hotelId, Long cateringId) {
		SQLHelper sh = new SQLHelper();
		sh.appendSql("select a from CateringResource a ,CateringResourceMap b where a.hotelGroupId = b.hotelGroupId and a.hotelId = b.hotelId and a.code = b.cateringResource and b.catering = ? ");
		sh.appendSql("and a.hotelGroupId = ? and a.hotelId = ?");
		sh.insertValue(cateringId);
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		return find(sh);
	}

	@Override
	public List<CateringResourceMap> listEffectResourceMapByResourceCode(Long hotelGroupId, Long hotelId, String cateringResource) {
		SQLHelper sh = new SQLHelper();
		sh.appendSql("select b from Catering a ,CateringResourceMap b where a.hotelGroupId = b.hotelGroupId and a.hotelId = b.hotelId and a.id = b.catering and b.cateringResource = ? ");
		sh.appendSql("and a.sta in ('R','I') ");
		sh.appendSql("and a.hotelGroupId = ? and a.hotelId = ?");
		sh.insertValue(cateringResource);
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		return find(sh);
	}

	/**
	 * 根据查询dto查找宴会主单
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Container<Catering> listCateringBySearchDto(Long hotelGroupId,Long hotelId, CateringSearchDto csdto) {
		SQLHelper sh = new SQLHelper();
		SQLHelper countSh = new SQLHelper();
		StringBuilder sb = new StringBuilder();
		
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		
		if(csdto != null){
			if(csdto.getRsvId() != null){
				sb.append(" and obj.rsvId = ? ");
				sh.insertValue(csdto.getRsvId());
			}
			if(StringUtil.isNotBlank(csdto.getRsvName())){
				sb.append(" and obj.rsvName like ?");
				sh.insertValue("%" + csdto.getRsvName() + "%");
			}
			
			if(StringUtil.isNotBlank(csdto.getTheme())){
				sb.append(" and obj.theme like ? ");
				sh.insertValue("%" + csdto.getTheme().trim() + "%");
			}
			
			if(StringUtil.isNotBlank(csdto.getStas())){
				String[] stas = csdto.getStas().split(",");
				sb.append(" and obj.sta in (");
				for(int i = 0 ; i < stas.length ; i++){
					sb.append("'" + stas[i] + "'");
					if(i < stas.length - 1){
						sb.append(",");
					}
				}
				sb.append(") ");
			}
			if(StringUtil.isNotBlank(csdto.getCategory())){
				sb.append(" and obj.category = ? ");
				sh.insertValue(csdto.getCategory());
			}
			if(StringUtil.isNotBlank(csdto.getSalesman())){
				sb.append(" and obj.salesman = ? ");
				sh.insertValue(csdto.getSalesman());
			}
			if(StringUtil.isNotBlank(csdto.getCateringPlaces())){
				String[] cateringPlaces = csdto.getCateringPlaces().split(",");
				sb.append(" and obj.cateringPlace in (");
				for(int i = 0 ; i < cateringPlaces.length ; i++){
					sb.append("'" + cateringPlaces[i] + "'");
					if(i < cateringPlaces.length - 1){
						sb.append(",");
					}
				}
				sb.append(") ");
			}
			if(csdto.getDateBegin() != null){
				sb.append(" and (date(obj.dateBegin) >= ? or (date(obj.dateBegin) < ? and date(obj.dateEnd) >= ?)) ");
				sh.insertValue(DateUtil.parseDateNoTime(csdto.getDateBegin()));
				sh.insertValue(DateUtil.parseDateNoTime(csdto.getDateBegin()));
				sh.insertValue(DateUtil.parseDateNoTime(csdto.getDateBegin()));
			}
			if(csdto.getDateEnd() != null){
				sb.append(" and date(obj.dateBegin) <= ? ");
				sh.insertValue(DateUtil.parseDateNoTime(csdto.getDateEnd()));
			}
			if(csdto.getPageSize() != null){
				csdto.setCurrentPage(csdto.getCurrentPage() == null ? 1:csdto.getCurrentPage());
				sh.setFirstResult((csdto.getCurrentPage() - 1) * csdto.getPageSize());
				sh.setMaxResults(csdto.getPageSize());
			}
		}
		
		Container<Catering> container = new Container<Catering>();
		sh.setNesting(true);
		
		sh.setSql("select obj from Catering obj where obj.hotelGroupId = ? and obj.hotelId = ? ");
		sh.appendSql(sb.toString());
		
		countSh.setSql("select count(obj) from Catering obj where obj.hotelGroupId = ? and obj.hotelId = ? ");
		countSh.appendSql(sb.toString());
		
		for(Object value : sh.getValues()){
			countSh.insertValue(value);
		}
		
		container.setTotalRows(count(countSh));
		container.setResults(Collections.EMPTY_LIST);
		if (container.getTotalRows() > 0) {
			List<Catering> list = find(sh);
			if (list.isEmpty()) {
				sh.setFirstResult(0);
				list = find(sh);
			}
			container.setResults(list);
			if (sh.getFirstResult() != null) {
				container.setFirstResult(sh.getFirstResult());
			}
			if (sh.getMaxResults() != null) {
				container.setMaxResults(sh.getMaxResults());
			}
		}
		return container;
	}

	@Override
	public int countRsvCatering(Long hotelGroupId, Long hotelId, Long rsvId) {
		String filterSql = " and rsvId = ? and sta in ( ";
		
		for(int i = 0 ; i < Catering.effectStaArray().length ; i++){
			filterSql += "'" + Catering.effectStaArray()[i] + "'";
			if(i < Catering.effectStaArray().length - 1){
				filterSql += ",";
			}
		}
		
		filterSql += ") ";
		
		List<Catering> list = commonDao.listDataWithClazz(hotelGroupId, hotelId, Catering.class, filterSql, new Object[]{rsvId});
		
		return list.size();
	}
}
