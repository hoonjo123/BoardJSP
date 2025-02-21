package woo.edu.c.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import woo.edu.c.service.BoardService;
import woo.edu.c.vo.BoardVo;

@RestController
@RequestMapping("/board")
public class BoardAjaxController {

    @Inject
    private BoardService boardService;
    
    //게시글 리스트 가져오기
    @GetMapping(value="/listAjaxJson", produces="application/json")
    public List<BoardVo> boardListAjaxJson() {
        return boardService.getBoardList();
    }
    
    //게시글 작성하기
    @PostMapping(value="/write", produces="application/json")
    public Map<String, Object> writeBoard(@RequestBody BoardVo board) {
        boardService.insertBoard(board);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("success", true);
        return result;
    }
    
    //게시글 삭제
    @GetMapping(value="/deleteAjax", produces="application/json")
    public Map<String, Object> deleteBoardAjax(@RequestParam("id") int id) {
        boardService.deleteBoard(id);
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            boardService.deleteBoard(id);
            result.put("success", true);
        } catch(Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", e.getMessage());
        }
        return result;
    }
    
    //게시글 상세조회
    @GetMapping(value="detailAjaxJson", produces="application/json")
    public BoardVo detailAjaxJson(@RequestParam("id") int id) {
    	return boardService.getBoardById(id);
    }
}
