package woo.edu.c.service;

import java.util.List;

import woo.edu.c.vo.calVo;

public interface CalService {

	// 스케줄러 작성
	int calInsert(calVo calVo);
	
	// 스케줄러 삭제
	int calDelete(calVo calVo);
	
	// 스케줄러 리스트
	List<calVo> calSelect(int year, int month);
}
