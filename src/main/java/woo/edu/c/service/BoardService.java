package woo.edu.c.service;

import java.util.List;
import woo.edu.c.vo.BoardVo;

public interface BoardService {

	List<BoardVo> getBoardList();
	
    void insertBoard(BoardVo board);
    
    BoardVo getBoardById(int id);
    
    void updateBoard(BoardVo board);
    
    void deleteBoard(int id);
}
