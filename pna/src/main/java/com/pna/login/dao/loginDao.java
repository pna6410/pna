package com.pna.login.dao;

import org.springframework.stereotype.Repository;

import com.pna.dto.loginDto;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("loginDao")
public class loginDao extends EgovAbstractMapper {

	public int selectLoginCheck(loginDto loginDto) throws Exception {
		return (int) selectOne("loginDaoSql.selectLoginCheck", loginDto);
	}

	public loginDto selectLoginInfo(loginDto loginDto) throws Exception {
		return selectOne("loginDaoSql.selectLoginInfo", loginDto);
	}

}
