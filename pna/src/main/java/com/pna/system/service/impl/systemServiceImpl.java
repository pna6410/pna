package com.pna.system.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pna.dto.userManageDto;
import com.pna.dto.db.pnauserDto;
import com.pna.system.dao.systemDao;
import com.pna.system.service.systemService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("systemService")
public class systemServiceImpl extends EgovAbstractServiceImpl implements systemService {
	
	@Resource(name = "systemDao")
    private systemDao systemDao;

	@Override
	public Map<String, Object> selectUserManageList(userManageDto userManageDto) throws Exception {
		List<userManageDto> list = systemDao.selectUserManageList(userManageDto);

    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("resultList", list);
    	
    	return map;
	}

	@Override
	public int pnauserPwUpdate(pnauserDto pnauserDto) throws Exception {
		return systemDao.pnauserPwUpdate(pnauserDto);
	}

	@Override
	public String userExistCheck(pnauserDto pnauserDto) throws Exception {
		String rtn = systemDao.userExistCheck(pnauserDto);		
    	return rtn;
	}

	@Override
	public int pnauserUpdate(pnauserDto pnauserDto) throws Exception {
		int rtn = systemDao.pnauserUpdate(pnauserDto);
    	return rtn;
	}

}
