package com.weWalk.together.parking.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weWalk.together.vo.ParkVO;
import com.weWalk.together.vo.SearchVO;

@Repository
public class ParkingDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public List<ParkVO> parkingTotalList() {
		return sql.selectList("parking.parkingTotalList");
	}

	public List<ParkVO> parkingList(SearchVO SearchVo) {
		return sql.selectList("parking.parkingList",SearchVo);
	}
	
	public List<ParkVO> parkingSearchList(SearchVO searchVo) {
		return sql.selectList("parking.parkingSearchList",searchVo);
	}

	public ParkVO parking_detail_info(String pkno) {
		return (ParkVO) sql.selectOne("parking.parking_detail_info", pkno);
	}

	

}
