package com.pna.login.service;

import com.pna.dto.loginDto;

public interface loginService {

	public int selectLoginCheck(loginDto loginDto) throws Exception;

	public loginDto selectLoginInfo(loginDto loginDto) throws Exception;

}
