package com.weWalk.together.parking.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.weWalk.together.parking.service.ParkingService;
import com.weWalk.together.vo.ParkVO;
import com.weWalk.together.vo.SearchVO;
import com.weWalk.together.vo.UserVO;


@Controller
public class ParkingController {
	
	@Autowired
	private ParkingService parkingService;
	
	
	/**
	 * parkingList 주차장조회
	 * @param response
	 * @param pkno
	 * @return ModelAndView
	 * @throws IOException
	 */
	@RequestMapping(value = {"/parking/parkingList"})
	public ModelAndView parkingList(HttpServletResponse response, @ModelAttribute SearchVO SearchVo) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav = parkingService.parkingList(SearchVo);
		return mav;
	}
	
	/**
	 * parking_detail_info 주차장 상세 보기
	 * @param response
	 * @param pkno
	 * @return ModelAndView
	 * @throws IOException
	 */
	@RequestMapping(value = {"/parkingDtl"}, method = {RequestMethod.GET})
	public ModelAndView parking_detail_info(HttpServletResponse response, @RequestParam("pkno") String pkno) throws IOException {
		ModelAndView mav = new ModelAndView();
		mav = parkingService.parking_detail_info(pkno);
		return mav;
	}

}
