package com.greencloud.dao.impl;

import java.util.Iterator;
import java.util.Set;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.greencloud.dao.IPosHibernateDao;
import com.greencloud.util.ModelUtil;

public class PosHibernateDaoImpl extends HibernateDaoSupport implements IPosHibernateDao {

	@Override
	public void deleteCodeGroup(Object object, Long hotelGroupId) {
			String parentCode = null;
			String codeClassName = object.getClass().getName();
			StringBuffer buffer = new StringBuffer().append("delete  ").append(codeClassName);
			buffer.append(" where hotelGroupId=:hotelGroupId  and code=:code");
			if (ModelUtil.hasProperty(object, "parentCode"))
			{
				parentCode = (String) ModelUtil.getPropertyValue(object,"parentCode");	
				if (parentCode != null)
				{
					buffer.append(" and parentCode=:parentCode");
				}else{
					buffer.append(" and parentCode is null");
				}
			}	
					
						
			Query query = getSession().createQuery(buffer.toString());
			String code = (String) ModelUtil.getPropertyValue(object,"code");
			query.setLong("hotelGroupId", hotelGroupId);
			query.setString("code", code);
			if (null != parentCode)
			{
				query.setString("parentCode", parentCode);
			}
			query.executeUpdate();
	}

	@Override
	public void updateCodeGroup(Object object, Long hotelGroupId) {
		if (ModelUtil.hasProperty(object, "code") && ModelUtil.hasProperty(object, "descript") && ModelUtil.hasProperty(object, "hotelGroupId") && ModelUtil.hasProperty(object, "hotelId"))
		{
				String parentCode = null;
				String codeClassName = object.getClass().getName();
				StringBuffer buffer = new StringBuffer().append("update ").append(codeClassName).append(" set ");
				
				//取出属性  有些属性不必要更新  比如hotelGroupId、hotelId、createUser、createDatetime、modifyUser、modifyDatetime、groupCode、codeType、isGroup、parentCode、code、id等
				Set<String> set= ModelUtil.getDeclaredProperties(object.getClass());
				for(Iterator<String> i=set.iterator();i.hasNext();){
					String name=i.next();
					if(name != null && !name.equals("")){
						if(!name.equals("hotelGroupId") && !name.equals("hotelId") && !name.equals("createUser") && !name.equals("createDatetime")
								&& !name.equals("modifyUser") && !name.equals("modifyDatetime") && !name.equals("groupCode")
								&& !name.equals("codeType") && !name.equals("isGroup") && !name.equals("parentCode")
								&& !name.equals("code") && !name.equals("id")								
						    ){
							buffer.append(name).append(" =:").append(name).append(",");
							}
					}
				}
				buffer.append("code=:newcode");
				
				
				buffer.append(" where hotelGroupId=:hotelGroupId  and code=:code");
				if (ModelUtil.hasProperty(object, "parentCode"))
				{
					parentCode = (String) ModelUtil.getPropertyValue(object,"parentCode");	
					if (parentCode != null)
					{
						buffer.append(" and parentCode=:parentCode");
					}
					else
					{
						buffer.append(" and parentCode is null");
					}
				}	
				
					
				Query query = getSession().createQuery(buffer.toString());
				for(Iterator<String> i=set.iterator();i.hasNext();){
					String name=i.next();
					if(name != null && !name.equals("")){
						if(!name.equals("hotelGroupId") && !name.equals("hotelId") && !name.equals("createUser") && !name.equals("createDatetime")
								&& !name.equals("modifyUser") && !name.equals("modifyDatetime") && !name.equals("groupCode")
								&& !name.equals("codeType") && !name.equals("isGroup") && !name.equals("parentCode")
								&& !name.equals("code") && !name.equals("id")){
							Object vl =  ModelUtil.getPropertyValue(object, name);
							query.setParameter(name, vl);
						}
					}
				}
				
				String code = (String) ModelUtil.getPropertyValue(object,"code");
				query.setParameter("newcode", code);
				
				query.setParameter("hotelGroupId", hotelGroupId);
				query.setParameter("code", code);
				if (null != parentCode)
				{
					query.setParameter("parentCode", parentCode);
				}
				query.executeUpdate();
		}
	}

	@Override
	public void updateCodeGroupSta(Object object, Long hotelGroupId) {
		if (ModelUtil.hasProperty(object, "code") && ModelUtil.hasProperty(object, "isHalt"))
		{
			String setHalt = "F";
			String isHalt = (String) ModelUtil.getPropertyValue(object,"isHalt");	
			if(isHalt != null && isHalt.equals("T")){
				setHalt="F";
			}else{
				setHalt="T";
			}
			
				String parentCode = null;
				String codeClassName = object.getClass().getName();
				StringBuffer buffer = new StringBuffer().append("update ").append(codeClassName).append(" set isHalt=:isHalt, ");
				buffer.append("code=:newcode");
				buffer.append(" where hotelGroupId=:hotelGroupId  and code=:code");
				if (ModelUtil.hasProperty(object, "parentCode"))
				{
					parentCode = (String) ModelUtil.getPropertyValue(object,"parentCode");	
					if (parentCode != null)
					{
						buffer.append(" and parentCode=:parentCode");
					}
					else
					{
						buffer.append(" and parentCode is null");
					}
				}	
				
					
				Query query = getSession().createQuery(buffer.toString());
				
				
				String code = (String) ModelUtil.getPropertyValue(object,"code");
				query.setParameter("newcode", code);
				
				query.setParameter("hotelGroupId", hotelGroupId); 
				query.setParameter("code", code);
				query.setParameter("isHalt", setHalt);
				if (null != parentCode)
				{
					query.setParameter("parentCode", parentCode);
				}
				query.executeUpdate();
		}
	}

	@Override
	public void updateParamGroup(Object object, Long hotelGroupId) {
				String setValue = (String) ModelUtil.getPropertyValue(object,"setValue");	
				String catalog = (String) ModelUtil.getPropertyValue(object,"catalog");	
				String item = (String) ModelUtil.getPropertyValue(object,"item");	
			
				String codeClassName = object.getClass().getName();
				StringBuffer buffer = new StringBuffer().append("update ").append(codeClassName).append(" set setValue=:setValue");
				buffer.append(" where hotelGroupId=:hotelGroupId  and catalog=:catalog and item=:item ");
				Query query = getSession().createQuery(buffer.toString());
				query.setParameter("setValue", setValue);
				query.setParameter("hotelGroupId", hotelGroupId);
				query.setParameter("catalog", catalog);
				query.setParameter("item", item);
				query.executeUpdate();
	}
}
