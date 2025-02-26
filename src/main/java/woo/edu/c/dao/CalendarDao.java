package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.vo.CalendarVo;

public interface CalendarDao {
    
    List<CalendarVo> getCalendarList();

//    
//    CalendarVo getCalendarById(int calNo);

    
    void insertCalendar(CalendarVo calendar);
    
    void deleteCalendar(int calNo);
    
    List<CalendarVo> getSchedulesByMonth(String month);
}