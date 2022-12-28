package com.pna.system.dao;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pna.dto.userManageDto;
import com.pna.dto.db.pnauserDto;


@Repository("systemDao")
public class systemDao extends EgovAbstractMapper {

	public List<userManageDto> selectUserManageList(userManageDto userManageDto) throws Exception {		
		return selectList("systemDaoSql.selectUserManageList",userManageDto);
	}

	public int pnauserPwUpdate(pnauserDto pnauserDto) throws Exception {
		return update("systemDaoSql.pnauserPwUpdate",pnauserDto);
	}

	public String userExistCheck(pnauserDto pnauserDto) throws Exception {		
		return selectOne("systemDaoSql.userExistCheck",pnauserDto);
	}

	public int pnauserUpdate(pnauserDto pnauserDto) throws Exception {
		return update("systemDaoSql.pnauserUpdate",pnauserDto);
	}

}
