package com.pna.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.pna.main.service.mainService;
import com.pna.dto.mainManageDto;
import com.pna.main.dao.mainDao;


@Service("mainService")
public class mainServiceImpl extends EgovAbstractServiceImpl implements mainService {

	@Resource(name = "mainDao")
	private mainDao mainDao;
	
	/* @Override */
	public List<mainManageDto> listUp() throws Exception {		
		List<mainManageDto> list = mainDao.listUp();
    	return list;
	}

}
