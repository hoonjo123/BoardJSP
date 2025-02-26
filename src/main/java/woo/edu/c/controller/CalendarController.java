package woo.edu.c.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import woo.edu.c.service.CalendarService;
import woo.edu.c.vo.CalendarVo;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    @Resource
    private CalendarService calendarService;
    
    @GetMapping
    public String calendarPage() {
        return "calendar/calendar";
    }
    
    @GetMapping("/schedules")
    @ResponseBody
    public List<CalendarVo> getSchedulesByMonth(@RequestParam("month") String month) {
        return calendarService.getSchedulesByMonth(month);
    }
    
    @PostMapping("/schedules")
    @ResponseBody
    public Map<String, Object> insertSchedule(@RequestBody CalendarVo calendar) {
        calendarService.insertCalendar(calendar);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("success", true);
        return result;
    }
    
    @DeleteMapping("/schedules/{calNo}")
    @ResponseBody
    public Map<String, Object> deleteSchedule(@PathVariable("calNo") int calNo) {
        calendarService.deleteCalendar(calNo);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("success", true);
        return result;
    }
}
