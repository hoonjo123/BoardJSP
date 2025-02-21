package woo.edu.c.dao;

import java.util.List;
import woo.edu.c.vo.BoardVo;

public interface BoardDao {

	List<BoardVo> getBoardList();
	
	void insertBoard(BoardVo boardVo);
	
    BoardVo getBoardById(int id);

    void updateBoard(BoardVo board);

    void deleteBoard(int id);

}
