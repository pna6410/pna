package com.pna.main.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import com.pna.dto.mainManageDto;


@Repository("mainDao")
public class mainDao extends EgovAbstractMapper{

	public List<mainManageDto> listUp() throws Exception {
		return selectList("mainDaoSql.listUp");
	}

}
