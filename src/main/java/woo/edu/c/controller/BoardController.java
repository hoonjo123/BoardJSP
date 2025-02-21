package woo.edu.c.controller;

import java.util.List;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import woo.edu.c.service.BoardService;
import woo.edu.c.vo.BoardVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService boardService;
	
	//게시판 목록조회
    @GetMapping("/list")
    public String boardList(Model model) {
        List<BoardVo> list = boardService.getBoardList();
        model.addAttribute("boardList", list);
        return "board/list";
    }

    //게시판 작성페이지 가져오기
    @GetMapping("/write")
    public String writeForm() {
        return "board/write";
    }

    //게시판 작성
    @PostMapping("/write")
    public String write(BoardVo board) {
        boardService.insertBoard(board);
        return "redirect:/board/list";
    }

    //게시판 상세조회
    @GetMapping("/view/{id}")
    public String view(@PathVariable int id, Model model) {
        BoardVo board = boardService.getBoardById(id);
        model.addAttribute("board", board);
        return "board/view";
    }

    //게시판 수정페이지 가져오기
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable int id, Model model) {
        BoardVo board = boardService.getBoardById(id);
        model.addAttribute("board", board);
        return "board/edit";
    }

    //게시판 수정
    @PostMapping("/edit")
    public String edit(BoardVo board) {
        boardService.updateBoard(board);
        return "redirect:/board/list";
    }

    //게시판삭제 - soft deletion
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        boardService.deleteBoard(id);
        return "redirect:/board/list";
    }
    
    //테스트
    @GetMapping("/multiplication")
    public String multiplicationTable() {
    	return "/board/multiplication";
    }
    
    //계산기
    @GetMapping("/calculation")
    public String calculatingMachine() {
    	return "/board/calculation";
    }
    
    //캘린더
    @GetMapping("/calender")
    public String calender() {
    	return "/board/calender";
    }
}





