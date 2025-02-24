package woo.edu.c.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.calVo;

@Repository
public class CalDaoImpl implements CalDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// mybatis
	@Inject
	private SqlSession sql;
	
	private static String namespace = "calMapper";
	
	// 스케줄러 작성
	@Override
	public int calInsert(calVo calVo) {
		return sql.insert(namespace + ".calInsert", calVo);
	}
	
	// 스케줄 목록
	@Override
	public List<calVo> calSelect(int year, int month) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("year", year);
		map.put("month", month);
		System.out.println("map===="+map);
		return sql.selectList(namespace + ".calSelect", map);
	}
	
	// 스케줄러 삭제
	@Override
	public int calDelete(calVo calVo) {
		return sql.delete(namespace + ".calDelete", calVo);
	}
	

}
