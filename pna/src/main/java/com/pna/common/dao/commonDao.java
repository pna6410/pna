package com.pna.common.dao;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pna.dto.codeManageDto;

@Repository("commonDao")
public class commonDao extends EgovAbstractMapper {

	public List<codeManageDto> selectCodeList(String parentCode) {
		return selectList("commonDaoSql.selectCodeList", parentCode);
	}

}
