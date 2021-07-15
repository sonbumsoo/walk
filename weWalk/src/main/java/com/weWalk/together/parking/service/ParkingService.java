package com.weWalk.together.parking.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.weWalk.together.vo.ParkVO;
import com.weWalk.together.vo.SearchVO;


public interface ParkingService {
	
	/**
	 * parkingHomeList 주차장조회 (home)
	 * @param response
	 * @param 
	 * @return ModelAndView
	 * @throws IOException
	 */
	List<ParkVO> parkingHomeList();
	
	/**
	 * parkingList 주차장조회
	 * @param response
	 * @param pkno
	 * @return ModelAndView
	 * @throws IOException
	 */
	ModelAndView parkingList(SearchVO SearchVo);
	
	/**
	 * parking_detail_info 주차장 상세 보기
	 * @param response
	 * @param pkno
	 * @return ModelAndView
	 * @throws IOException
	 */
	ModelAndView parking_detail_info(String pkno);
	

}
