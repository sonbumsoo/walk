package com.weWalk.together.users.service.serviceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.weWalk.together.parking.dao.ParkingDAO;
import com.weWalk.together.users.dao.UserDAO;
import com.weWalk.together.users.service.UserService;
import com.weWalk.together.vo.ParkVO;
import com.weWalk.together.vo.SearchVO;
import com.weWalk.together.vo.UserVO;
@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private ParkingDAO parkingDAO;
	
	//private ModelAndView mav;
	
	@Autowired
	private HttpSession session;

	// 로그인
	@Override
	public void userLogin(UserVO userVo, HttpServletResponse response) throws IOException {
		
		UserVO result = userDao.userLogin(userVo);
		
		System.out.println("result");
		System.out.println(result);
		
		if (result != null) {
			// 로그인 이후 세션에 저장
			session.setAttribute("loginType", result.getMember_type_cd());
			session.setAttribute("loginId", result.getId());
			response.getWriter().print("001");
		} else {
			response.getWriter().print("002");
		}
		
	}
	
	// 로그아웃
	@Override
	public void userLogout(HttpServletResponse response) throws Exception {
		session.removeAttribute("loginType");
		session.removeAttribute("loginId");
		response.sendRedirect("../");
	}
	
	//아이디 중복 확인
	@Override
	public void idOverlap(String id, HttpServletResponse response) throws IOException {
		String useId = this.userDao.idOverlap(id);
		if (useId == null) {
			response.getWriter().print("1");
		} else {
			response.getWriter().print("0");
		}
		
	}
	
	// 회원 등록
	@Override
	public ModelAndView signUser(UserVO userVo) {
		System.out.println("userVo");
		System.out.println(userVo.toString());
		ModelAndView mav = new ModelAndView();
		
		//전화번호 셋팅
		String phone_num = userVo.getPhone_front()+"-"+userVo.getPhone_mid()+"-"+userVo.getPhone_end();
		userVo.setPhone_num(phone_num);
		
		//주소 셋팅 
		String addr = userVo.getAddr1()+" "+userVo.getAddr2()+" "+userVo.getAddr3();
		userVo.setAddr(addr);
		
		int result = userDao.signUser(userVo);
		
		if (result > 0) {
			mav.setViewName("user/signUpSucess");
		} else {
			mav.setViewName("user/signUpError");
			
		}
		
		return mav;
	}
	
	
	public String numberGen(int len, int dupCd) {
		Random rand = new Random();
		String numStr = "";

		for (int i = 0; i < len; ++i) {
			String ran = Integer.toString(rand.nextInt(10));
			if (dupCd == 1) {
				numStr = numStr + ran;
			} else if (dupCd == 2) {
				if (!numStr.contains(ran)) {
					numStr = numStr + ran;
				} else {
					--i;
				}
			}
		}

		return numStr;
	}

	

	

}
