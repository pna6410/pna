package com.pna.common.service;

import java.util.List;

import com.pna.dto.codeManageDto;

public interface commonService {

	public List<codeManageDto> selectCodeList(String parentCode) throws Exception;

}
