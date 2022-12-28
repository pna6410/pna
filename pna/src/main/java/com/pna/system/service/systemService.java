package com.pna.system.service;

import java.util.Map;

import com.pna.dto.userManageDto;
import com.pna.dto.db.pnauserDto;

public interface systemService {

	public Map<String, Object> selectUserManageList(userManageDto userManageDto) throws Exception;

	public int pnauserPwUpdate(pnauserDto pnauserDto) throws Exception;

	public String userExistCheck(pnauserDto pnauserDto) throws Exception;

	public int pnauserUpdate(pnauserDto pnauserDto) throws Exception;

}
