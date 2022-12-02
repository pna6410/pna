package com.pna.main.service;

import java.util.List;

import com.pna.dto.menuManageDto;

public interface mainService {

	public List<menuManageDto> listUp() throws Exception;

	public List<menuManageDto> selectSideMenu(String userId) throws Exception;

}
