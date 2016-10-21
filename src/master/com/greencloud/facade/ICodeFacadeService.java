package com.greencloud.facade;

import java.util.List;
import java.util.Map;

import com.aua.util.Container;
import com.greencloud.dto.CodeHelpDto;
import com.greencloud.dto.CodeInputDto;
import com.greencloud.dto.CodeInputExDto;
import com.greencloud.dto.CodeMaintDto;
import com.greencloud.dto.TranslateCodeInputExDto;
import com.greencloud.entity.CodeBase;
import com.greencloud.entity.CodeBrief;
import com.greencloud.entity.CodeDictionary;
import com.greencloud.entity.CodeMaint;
import com.greencloud.entity.CodeRentalPlu;
import com.greencloud.entity.CodeRentalShowPeriod;
import com.greencloud.entity.CodeRentalSort;
import com.greencloud.entity.CodeRoomAssignment;
import com.greencloud.entity.CodeRsvSpecial;
import com.greencloud.entity.CodeRsvType;
import com.greencloud.entity.CodeTransaction;
import com.greencloud.entity.EntityInfo;
import com.greencloud.entity.Hotel;
import com.greencloud.entity.SysHelp;
import com.greencloud.entity.SysListCfg;
import com.greencloud.entity.SysListMeta;
import com.greencloud.exception.BizException;

import flex.messaging.services.ServiceException;

/****
 * 
 * @author ryan.tao
 * @since 2010-09-16
 * @version 1.0 代码维护服务的facade接口
 * 
 */

public interface ICodeFacadeService {
	public Object getCodeDetail(Object object);
	public void saveCode(Object object);
	public List<Object> saveCodeGroup(Object object,String hotels);
	public void updateCode(Object object);
	public List<Object> updateCodeGroup(Object object, String hotels);
	public List<Object> deleteCode(Object object);
	public List<CodeBase> listCodeBase(CodeBase codeBase);
	
}