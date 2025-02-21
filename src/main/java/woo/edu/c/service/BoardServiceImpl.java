package woo.edu.c.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.BoardDao;
import woo.edu.c.vo.BoardVo;
import woo.edu.c.vo.testVo;


@Service
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private BoardDao boardDao;

	
	@Override
    public List<BoardVo> getBoardList() {
        return boardDao.getBoardList();
    }

    @Override
    public void insertBoard(BoardVo board) {
        boardDao.insertBoard(board);
    }

    @Override
    public BoardVo getBoardById(int id) {
        return boardDao.getBoardById(id);
    }

    @Override
    public void updateBoard(BoardVo board) {
        boardDao.updateBoard(board);
    }

    @Override
    public void deleteBoard(int id) {
        boardDao.deleteBoard(id);
    }
}
