package com.weWalk.together.users.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.weWalk.together.vo.UserVO;

public interface UserService {
	
	// 로그인
	void userLogin(UserVO userVo,HttpServletResponse response) throws IOException;
	
	// 아이디 중복확인
	void idOverlap(String id, HttpServletResponse response) throws IOException;
	
	//회원 등록 
	ModelAndView signUser(UserVO userVo);
	//로그아웃 
	void userLogout(HttpServletResponse response) throws Exception;

}
