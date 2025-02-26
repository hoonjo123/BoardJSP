package woo.edu.c.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import woo.edu.c.vo.CalendarVo;

@Repository
public class CalendarDaoImpl implements CalendarDao {
	
	private static String namespace = "calendarMappers";
	
	@Inject
	private SqlSession sql;

    @Override
    public List<CalendarVo> getCalendarList() {
        return sql.selectList(namespace + ".getCalendarList");
    }
//
//    @Override
//    public CalendarVo getCalendarById(int calNo) {
//        return sql.selectOne(namespace + ".getCalendarById", calNo);
//    }

    @Override
    public void insertCalendar(CalendarVo calendar) {
        sql.insert(namespace + ".insertCalendar", calendar);
    }

    @Override
    public void deleteCalendar(int calNo) {
    	sql.delete(namespace + ".deleteCalendar", calNo);
    }
    
    @Override
    public List<CalendarVo> getSchedulesByMonth(String month) {
        return sql.selectList(namespace + ".getSchedulesByMonth", month);
    }
}