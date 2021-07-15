package com.weWalk.together.users.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weWalk.together.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public UserVO userLogin(UserVO userVo) {
		return sql.selectOne("user.login", userVo);
	}

	public String idOverlap(String id) {
		return (String) sql.selectOne("user.idOverlap", id);
	}

	public int signUser(UserVO userVo) {
		return sql.insert("user.singUser", userVo);
	}

}
