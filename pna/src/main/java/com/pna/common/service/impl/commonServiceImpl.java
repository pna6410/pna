package com.pna.common.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pna.common.dao.commonDao;
import com.pna.common.service.commonService;
import com.pna.dto.codeManageDto;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("commonService")
public class commonServiceImpl extends EgovAbstractServiceImpl implements commonService {
	
	@Resource(name = "commonDao")
    private commonDao commonDao;

	@Override
	public List<codeManageDto> selectCodeList(String parentCode) throws Exception {
		
		List<codeManageDto> list = commonDao.selectCodeList(parentCode);

		return list;
	}

}
