package woo.edu.c.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import woo.edu.c.vo.BoardVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.testVo;

@Repository
public class BoardDaoImpl implements BoardDao {

	private static String namespace = "boardMappers";
	
	@Inject
	private SqlSession sql;

	@Override
	public List<BoardVo> getBoardList(){
		return sql.selectList(namespace + ".getBoardList");
	}
	@Override
    public void insertBoard(BoardVo board) {
        sql.insert(namespace + ".insertBoard", board);
    }

    @Override
    public BoardVo getBoardById(int id) {
        return sql.selectOne(namespace + ".getBoardById", id);
    }

    @Override
    public void updateBoard(BoardVo board) {
        sql.update(namespace + ".updateBoard", board);
    }

    @Override
    public void deleteBoard(int id) {
        sql.delete(namespace + ".deleteBoard", id);
    }
}
