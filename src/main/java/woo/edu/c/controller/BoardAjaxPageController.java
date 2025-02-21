package woo.edu.c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardAjaxPageController {
	
	//Ajax게시글목록 페이지 가져오기
    @GetMapping("/listAjax")
    public String boardListAjaxPage() {
        return "board/listAjax";
    }
    
    //Ajax게시글 작성 페이지 가져오기
    @GetMapping("/writeAjax")
    public String writeAjaxPage() {
        return "board/writeAjax";
    }
    
    //Ajax게시글 상세 페이지 가져오기
    @GetMapping("/detailAjax")
    public String detailAjaxPage() {
        return "board/detailAjax";
    }
}
