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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import woo.edu.c.service.CalService;
import woo.edu.c.vo.calVo;

@Controller
public class CalController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private CalService CalService;
	
	// 캘린더
	@RequestMapping(value = "/board/calendar")
	
	public String calendar(Model model, calVo calVo) throws Exception {
		logger.info("/board/calendar");
		return "/board/calendar";
	}
	
	// 스케줄 글등록처리
	@RequestMapping(value = "/board/calInsert", method = RequestMethod.POST)
	public String boardInsert(calVo calVo) throws Exception {
		logger.info("/board/calInsert");
//		System.out.println("boardVo===="+boardVo);
		int result = CalService.calInsert(calVo);
		System.out.println("result==="+result);
		return "redirect: /board/calendar";
	}
	
    // 스케줄 리스트
	@ResponseBody
    @RequestMapping(value = "/board/calSelect", method = RequestMethod.GET)
    public List<calVo> getSchedules(@RequestParam("year") int year, @RequestParam("month") int month) {
//    	System.out.println("year===="+year);
//    	System.out.println("month===="+month);
        List<calVo> calList = CalService.calSelect(year, month);
//        System.out.println("calList===="+calList);
        return calList;
    }
    
 // 스케줄 글삭제처리
    @ResponseBody
 	@RequestMapping(value = "/board/calDelete", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
 	public String boardDelete(@RequestBody calVo calVo) throws Exception {
 		logger.info("/board/calDelete");
 		System.out.println("calvo====="+calVo);
 		String res = "";
 		int result = CalService.calDelete(calVo);
 		if(result == 1) {
 			res = "성공";
 		} else {
 			res = "실패";
 		}
 		System.out.println("result==="+result);
 		return res;
 	}
 	

}




