package woo.edu.c.service;

import java.util.List;

import woo.edu.c.vo.boardVo;

public interface BoardService {

	// 게시판 리스트
	List<boardVo> boardList();
	
	// 게시판 글작성
	int boardInsert(boardVo boardVo);

	// 게시판 상세보기
	boardVo boardRead(int boardIdxno);
	
	// 게시판 업데이트
	int boardUpdate(boardVo boardVo);
	
	// 게시판 글삭제
	int boardDelete(int boardIdxno);

	// 게시판 선택 글 삭제
	int boardAjaxDelete(List<Integer> boardIdxnoList);

}
