package woo.edu.c.vo;

public class calVo {

	private int calNo;
	private String calYear;
	private String calMonth;
	private String calDay;
	private String calTime;
	private String calReq;
	private String calDate;
	private String calContents;
//	private String loc;
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
	public String getCalDate() {
		return calDate;
	}
	public void setCalDate(String calDate) {
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
		return "calVo [calNo=" + calNo + ", calYear=" + calYear + ", calMonth=" + calMonth + ", calDay=" + calDay
				+ ", calTime=" + calTime + ", calReq=" + calReq + ", calDate=" + calDate + ", calContents="
				+ calContents + "]";
	}
	

	
}
