package com.weWalk.together.users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.weWalk.together.parking.service.ParkingService;
import com.weWalk.together.users.service.UserService;
import com.weWalk.together.vo.ParkVO;
import com.weWalk.together.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	// 회원가입 유형선택 화면 이동
	@RequestMapping(value = { "/user/loginPage" }, method = { RequestMethod.GET })
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}
	
	// 로그인
	@RequestMapping(value = { "/user/login" }, method = { RequestMethod.POST })
	public void login(@ModelAttribute UserVO userVo, HttpServletResponse response) throws IOException {
		userService.userLogin(userVo,response);
	}
	
	// 로그 아웃
	@RequestMapping(value = { "/user/logout" }, method = { RequestMethod.GET })
	public void logout(@ModelAttribute UserVO userVo, HttpServletResponse response) throws Exception {
		userService.userLogout(response);
	}	

	// 회원가입 유형선택 화면 이동
	@RequestMapping(value = { "/user/signUpTypePage" }, method = { RequestMethod.GET })
	public ModelAndView joinType() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/signUpType");
		return mav;
	}
	
	// 일반회원 가입 페이지 이동
	@RequestMapping(value = { "/user/signUpUserPage" }, method = { RequestMethod.GET })
	public ModelAndView joinUser(@ModelAttribute UserVO userVo) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/signUpUser");
		return mav;
	}
	
	// 기업회원 가입 페이지 이동
	@RequestMapping(value = { "/user/signUpOwnerPage" }, method = { RequestMethod.GET })
	public ModelAndView joinOwner(@ModelAttribute UserVO userVo) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/signUpOwner");
		return mav;
	}

	// 아이디 중복확인
	@RequestMapping(value = { "/user/idOverlap" }, method = { RequestMethod.POST })
	public void idOverlap(HttpServletResponse response, @RequestParam("id") String id) throws IOException {
		System.out.println("idOverlap 컨트롤러 호출 / 파라미터 : " + id);
		userService.idOverlap(id, response);
	}
	
	// 유저 등록
	@RequestMapping(value = { "/user/signUser" }, method = { RequestMethod.POST })
	public ModelAndView signUser(@ModelAttribute UserVO userVo) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav = userService.signUser(userVo);
		return mav;
	}
	
}
