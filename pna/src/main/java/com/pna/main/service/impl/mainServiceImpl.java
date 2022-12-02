package com.pna.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.pna.main.service.mainService;
import com.pna.dto.menuManageDto;
import com.pna.main.dao.mainDao;


@Service("mainService")
public class mainServiceImpl extends EgovAbstractServiceImpl implements mainService {

	@Resource(name = "mainDao")
	private mainDao mainDao;
	
	/* @Override */
	public List<menuManageDto> listUp() throws Exception {		
		List<menuManageDto> list = mainDao.listUp();
    	return list;
	}

	@Override
	public List<menuManageDto> selectSideMenu(String userId) throws Exception {
		return mainDao.selectSideMenu(userId);
	}

}
