package woo.edu.c.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CalendarVo {
	private int calNo;
	private String calYear;
	private String calMonth;
	private String calDay;
	private String calTime;
	private String calReq;
	
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date calDate;
	private String calContents;
	
    public CalendarVo() {}
    
    public CalendarVo(int calNo, String calYear, String calMonth, String calDay, String calTime, String calReq, Date calDate, String calContents) {
        this.calNo = calNo;
        this.calYear = calYear;
        this.calMonth = calMonth;
        this.calDay = calDay;
        this.calTime = calTime;
        this.calReq = calReq;
        this.calDate = calDate;
        this.calContents = calContents;
    }

    // Getter,Setter
    public int getCalNo() {
        return calNo;
    }

    public void setCalNo(int calNo) {
        this.calNo = calNo;
    }

    public String getCalYear() {
        return calYear;
    }

    public void setCalYear(String calYear) {
        this.calYear = calYear;
    }

    public String getCalMonth() {
        return calMonth;
    }

    public void setCalMonth(String calMonth) {
        this.calMonth = calMonth;
    }

    public String getCalDay() {
        return calDay;
    }

    public void setCalDay(String calDay) {
        this.calDay = calDay;
    }

    public String getCalTime() {
        return calTime;
    }

    public void setCalTime(String calTime) {
        this.calTime = calTime;
    }

    public String getCalReq() {
        return calReq;
    }

    public void setCalReq(String calReq) {
        this.calReq = calReq;
    }
    
    public Date getCalDate() {
        return calDate;
    }

    public void setCalDate(Date calDate) {
        this.calDate = calDate;
    }

    public String getCalContents() {
        return calContents;
    }

    public void setCalContents(String calContents) {
        this.calContents = calContents;
    }

    @Override
    public String toString() {
        return "CalendarVo [calNo=" + calNo + ", calYear=" + calYear + ", calMonth=" + calMonth 
                + ", calDay=" + calDay + ", calTime=" + calTime + ", calReq=" + calReq 
                + ", calDate=" + calDate + ", calContents=" + calContents + "]";
    }
}
