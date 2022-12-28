package com.pna.login.service.impl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pna.dto.loginDto;
import com.pna.login.dao.loginDao;
import com.pna.login.service.loginService;


@Service("loginService")
public class loginServiceImpl extends EgovAbstractServiceImpl implements loginService {

	@Resource(name = "loginDao")
	private loginDao loginDao;

	@Override
	public int selectLoginCheck(loginDto loginDto) throws Exception {
		return loginDao.selectLoginCheck(loginDto);
	}

	@Override
	public loginDto selectLoginInfo(loginDto loginDto) throws Exception {
		return loginDao.selectLoginInfo(loginDto);
	}
}
