package com.weWalk.together.common.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weWalk.together.vo.CodeVO;

@Repository
public class CommonDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public List<CodeVO> codeList(String code) {
		return sql.selectList("common.codeList", code );
	}

}
