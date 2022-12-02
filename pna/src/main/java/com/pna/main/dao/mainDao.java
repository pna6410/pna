package com.pna.main.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import com.pna.dto.menuManageDto;


@Repository("mainDao")
public class mainDao extends EgovAbstractMapper{

	public List<menuManageDto> listUp() throws Exception {
		return selectList("mainDaoSql.listUp");
	}

	public List<menuManageDto> selectSideMenu(String userId) {
		return selectList("mainDaoSql.selectSideMenu", userId);
	}

}
