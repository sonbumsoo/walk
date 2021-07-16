package com.weWalk.together.parking.service.serviceImpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.weWalk.together.common.dao.CommonDAO;
import com.weWalk.together.parking.dao.ParkingDAO;
import com.weWalk.together.parking.service.ParkingService;
import com.weWalk.together.vo.CodeVO;
import com.weWalk.together.vo.ParkVO;
import com.weWalk.together.vo.SearchVO;

@Service("ParkingService")
public class ParkingServiceImpl implements ParkingService {

	@Autowired
	private ParkingDAO parkingDAO;

	@Autowired
	private CommonDAO commonDAO;

	@Autowired
	private HttpSession session;

	/**
	 * parkingHomeList 주차장조회 (home)
	 * 
	 * @param response
	 * @param
	 * @return ModelAndView
	 * @throws IOException
	 */
	@Override
	public List<ParkVO> parkingHomeList() {
		return parkingDAO.parkingTotalList();
	}

	/**
	 * parking_List 주차장검색
	 * 
	 * @param response
	 * @param pkno
	 * @return ModelAndView
	 * @throws IOException
	 */
	@Override
	public ModelAndView parkingList(SearchVO SearchVo) {
		ModelAndView mav = new ModelAndView();
		
		List<ParkVO> parkingList = parkingDAO.parkingList(SearchVo);
		
		if (!SearchVo.getKeyWord().equals(" ")) {
			// step.2 검색 리스트
			List<ParkVO> parkingSearchList = parkingDAO.parkingSearchList(SearchVo);

			// step.3 리스트 합체
			for (int i = 0; i < parkingSearchList.size(); i++) {
				parkingList.add(parkingSearchList.get(i));
			}

			String latitude = parkingList.get(parkingList.size() - 1).getLatitude(); // 위도
			String hardness = parkingList.get(parkingList.size() - 1).getHardness(); // 경도

			mav.addObject("latitude", latitude);
			mav.addObject("hardness", hardness);
		}
		
		mav.addObject("pageId","PARKING00000M");
		mav.addObject("parkingList", parkingList);
		mav.setViewName("parking/PARKING00000M");
		return mav;
	}

	public ModelAndView parking_detail_info(String pkno) {
		ModelAndView mav = new ModelAndView();

		// 시간 코드
		String code = "TIME_DIV_CD";
		List<CodeVO> time_div_cd = commonDAO.codeList(code);

		// 상세 조회
		ParkVO parking_dt_info = parkingDAO.parking_detail_info(pkno);

		mav.addObject("time_div_cd", time_div_cd);
		mav.addObject("parking_dt_info", parking_dt_info);
		mav.setViewName("parking/PARKING10001P");
		return mav;
	}

}
