package woo.edu.c.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import woo.edu.c.service.BoardService;
import woo.edu.c.vo.boardVo;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService boardService;
	
	
	// 메인 화면
	@RequestMapping(value = "/board/home")
	public String home() throws Exception {
		logger.info("/board/boardhome");
		return "/home";
	}
	
	// 게시판 리스트
	@RequestMapping(value = "/board/boardList", method = RequestMethod.GET)
	public String boardList(Model model) throws Exception {
		logger.info("/board/boardList");
		List<boardVo> boardList = boardService.boardList();
//		System.out.println("boardList==="+boardList);
		model.addAttribute("boardList", boardList);
		return "/board/board_list";
	}
	
	// 게시판 글등록폼
	@RequestMapping(value = "/board/boardWriteFrm")
	public String boardWrite() throws Exception {
		logger.info("/board/boardWriteFrm");
		return "/board/board_write";
	}
	
	// 게시판 글등록처리
	@RequestMapping(value = "/board/boardInsert", method = RequestMethod.POST)
	public String boardInsert(boardVo boardVo) throws Exception {
		logger.info("/board/boardInsert");
//		System.out.println("boardVo===="+boardVo);
		int result = boardService.boardInsert(boardVo);
//		System.out.println("result==="+result);
		return "redirect: /board/boardList";
	}
	
	// 게시판 상세보기
	@RequestMapping(value = "/board/boardRead", method = RequestMethod.GET)
	public String boardRead(Model model, int boardIdxno) throws Exception {
		logger.info("/board/boardRead");
		boardVo data = boardService.boardRead(boardIdxno);
//		System.out.println("data==="+data);
		model.addAttribute("data", data);
		return "/board/board_read";
	}
	
	// 게시판 수정폼
	@RequestMapping(value = "/board/boardUpdate", method = RequestMethod.GET)
	public String boardUpdateFrm(Model model, int boardIdxno) throws Exception {
		logger.info("/board/boardUpdateFrm");
		boardVo data = boardService.boardRead(boardIdxno);
//		System.out.println("data==="+data);
		model.addAttribute("data", data);
		return "/board/board_update";
	}
	
	// 게시판 수정하기
	@RequestMapping(value = "/board/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(boardVo boardVo) throws Exception {
		logger.info("/board/boardUpdate");
		int res = boardService.boardUpdate(boardVo);
//		System.out.println("res==="+res);
		return "redirect:/board/boardList";
	}
	
	// 게시판 삭제
	@RequestMapping(value = "/board/boardDelete", method = RequestMethod.GET)
	public String boardDelete(Model model, int boardIdxno) throws Exception {
		logger.info("/board/boardDelete");
		int del = boardService.boardDelete(boardIdxno);
//		System.out.println("del==="+del);
		return "redirect:/board/boardList";
	}
	
	// Ajax 게시판 페이지
	@RequestMapping(value = "/board/boardAjaxList", method = RequestMethod.GET)
	public String boardAjaxList() throws Exception {
		logger.info("/board/boardAjaxList");
		return "/board/board_ajax_list";
	}
	
	// Ajax 게시판 조회
	@ResponseBody
	@RequestMapping(value = "/board/boardAjaxListSel", method = RequestMethod.GET)
	public List<boardVo> boardAjaxListSel() throws Exception {
		logger.info("/board/boardAjaxListSel");
		List<boardVo> boardList = boardService.boardList();
//		System.out.println(boardList);
		return boardList;
	}
	
	// Ajax 게시판 삭제
	@ResponseBody
	@RequestMapping(value = "/board/boardAjaxDelete", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
//	public void boardAjaxDelete(@RequestBody HashMap<String, Integer> noMap) throws Exception {
	public String boardAjaxDelete(@RequestBody boardVo boardIdxno) throws Exception {
//		public void boardAjaxDelete(@RequestBody int boardIdxno) throws Exception {
		logger.info("/board/boardAjaxDelete");
		String result = "";
		int ajaxdel = boardService.boardDelete(boardIdxno.getBoardIdxno());
		if(ajaxdel == 1) {
			result = "성공";
		} else {
			result = "실패";
		}
		System.out.println("ajaxdel==="+ajaxdel);
		return result;
	}
	
	// 게시판 선택 글 삭제
	@ResponseBody
	@RequestMapping(value = "/board/boardAjaxSelectDelete", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String boardAjaxDelete(@RequestBody List<Integer> boardIdxnoList) throws Exception {
	    logger.info("/board/boardAjaxSelectDelete");
	    String result = "";
	    int ajaxdel = boardService.boardAjaxDelete(boardIdxnoList);
	    if(ajaxdel == 1) {
	        result = "성공";
	    } else {
	        result = "실패";
	    }
	    System.out.println("ajaxdel==="+ajaxdel);
	    return result;
	}
	
	
	// Ajax 게시판 글조회
	@ResponseBody
	@RequestMapping(value = "/board/boardAjaxRead", method = RequestMethod.POST)
//	public void boardAjaxRead(@RequestParam HashMap<String, Integer> boardIdxno) throws Exception {
//		public void boardAjaxRead(@RequestParam int boardIdxno, @RequestParam String dd) throws Exception {
//		public void boardAjaxRead(@RequestParam(name="boardIdxno") int aa) throws Exception {
//		public void boardAjaxRead(@RequestParam(value="boardIdxno") int aa) throws Exception {
	public boardVo boardAjaxRead(@RequestBody boardVo boardVo) throws Exception {
		logger.info("/board/boardAjaxRead");
//		System.out.println("dd====="+dd);
//		System.out.println("boardReadVo=====" + boardVo);
		boardVo res = boardService.boardRead(boardVo.getBoardIdxno());
//		System.out.println("res===="+res);
		return res;
	}
	
	// Ajax 게시판 글작성
	@ResponseBody
	@RequestMapping(value = "/board/boardAjaxInsert", method = RequestMethod.POST)
	public String boardAjaxInsert(@RequestBody boardVo boardVo) throws Exception {
		System.out.println("boardAjaxInsert===="+boardVo);
		//boardService.boardInsert(boardVo);
		logger.info("/board/boardAjaxInsert");
		int result = boardService.boardInsert(boardVo);
		System.out.println("result===="+result);
		return "redirect:/board/boardAjaxList";
	}
	
	// JS
	@RequestMapping(value = "/board/js")
	public String js() throws Exception {
//		logger.info("/board/boardWriteFrm");
		return "/board/js";
	}
	
	// 계산기
	@RequestMapping(value = "/board/calculator")
	public String calculator() throws Exception {
//		logger.info("/board/calculator");
		return "/board/calculator";
	}
	// 캘린더
	@RequestMapping(value = "/board/calendar", method = RequestMethod.GET)
	public String calendar(Model model) throws Exception {
//		logger.info("/board/calculator");
		return "/board/calendar";
	}

	
}




