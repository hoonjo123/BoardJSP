package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.vo.calVo;

public interface CalDao {

	// 스케줄러 작성
	int calInsert(calVo calvo);
	
	// 스케줄러 리스트
	List<calVo> calSelect(int year, int month);
	
	// 스케쥴러 삭제
	int calDelete(calVo calNo);
	
}
