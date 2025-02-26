package woo.edu.c.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import woo.edu.c.dao.CalendarDao;
import woo.edu.c.vo.CalendarVo;

@Service
public class CalendarServiceImpl implements CalendarService {

    @Resource
    private CalendarDao calendarDao;
    
    @Override
    public List<CalendarVo> getCalendarList() {
        return calendarDao.getCalendarList();
    }
//
//    @Override
//    public CalendarVo getCalendarById(int calNo) {
//        return calendarDao.getCalendarById(calNo);
//    }

    @Override
    public void insertCalendar(CalendarVo calendar) {
        calendarDao.insertCalendar(calendar);
    }

    @Override
    public void deleteCalendar(int calNo) {
        calendarDao.deleteCalendar(calNo);
    }
    
    @Override
    public List<CalendarVo> getSchedulesByMonth(String month) {
        return calendarDao.getSchedulesByMonth(month);
    }
}