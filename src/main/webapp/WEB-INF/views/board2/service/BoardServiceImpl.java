package woo.edu.c.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.BoardDao;
import woo.edu.c.vo.boardVo;


@Service
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private BoardDao boardDao;

	@Override
	public List<boardVo> boardList() {
		return boardDao.boardList();
	}
	
	@Override
	public int boardInsert(boardVo boardVo) {
		return boardDao.boardInsert(boardVo);
	}
	
	@Override
	public boardVo boardRead(int boardIdxno) {
		return boardDao.boardRead(boardIdxno);
	}
	
	@Override
	public int boardUpdate(boardVo boardVo) {
		return boardDao.boardUpdate(boardVo);
	}
	
	@Override
	public int boardDelete(int boardIdxno) {
		return boardDao.boardDelete(boardIdxno);
	}
	
	@Override
	public int boardAjaxDelete(List<Integer> boardIdxnoList) {
		int result = 0;
		for (int boardIdxno : boardIdxnoList) {
			result += boardDao.boardDelete(boardIdxno);
		}
		return result;
	} 
	

	
}
