package woo.edu.c.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.boardVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// mybatis
	@Inject
	private SqlSession sql;
	
	private static String namespace = "boardMapper";
	
	// 게시판 목록
	@Override
	public List<boardVo> boardList() {
		return sql.selectList(namespace + ".boardList");
	}
	
	// 게시판 글작성
	@Override
	public int boardInsert(boardVo boardVo) {
		return sql.insert(namespace + ".boardInsert", boardVo);
	}
	
	// 게시판 상세보기
	@Override
	public boardVo boardRead(int boardIdxno) {
		return sql.selectOne(namespace + ".boardRead", boardIdxno);
	}
	
	// 게시판 업데이트
	@Override
	public int boardUpdate(boardVo boardVo) {
		return sql.update(namespace + ".boardUpdate", boardVo);
	}
	
	// 게시판 글삭제
	@Override
	public int boardDelete(int boardIdxno) {
		return sql.delete(namespace + ".boardDelete", boardIdxno);
	}

	// 게시판 선택 글 삭제
	@Override
	public int boardAjaxDelete(List<Integer> boardIdxnoList) {
	    return sql.delete(namespace + ".boardDelete", boardIdxnoList);
	}
}
