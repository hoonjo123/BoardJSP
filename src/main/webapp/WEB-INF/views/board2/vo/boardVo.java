package woo.edu.c.vo;

public class boardVo {

	private int boardIdxno;
	private String boardTitle;
	private String boardContent;
	private String boardName;
	private String boardRegdate;
//	private String loc;
	
	public int getBoardIdxno() {
		return boardIdxno;
	}
	public void setBoardIdxno(int boardIdxno) {
		this.boardIdxno = boardIdxno;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(String boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	
	@Override
	public String toString() {
		return "boardVo [boardIdxno=" + boardIdxno + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardName=" + boardName + ", boardRegdate=" + boardRegdate + "]";
	}
	
	
	
	
	
	
//	public String getDeptNo() {
//		return deptNo;
//	}
//	public void setDeptNo(String deptNo) {
//		this.deptNo = deptNo;
//	}
//	public String getdName() {
//		return dName;
//	}
//	public void setdName(String dName) {
//		this.dName = dName;
//	}
//	public String getLoc() {
//		return loc;
//	}
//	public void setLoc(String loc) {
//		this.loc = loc;
//	}
//	
//	@Override
//	public String toString() {
//		return "boardVo [deptNo=" + deptNo + ", dName=" + dName + ", loc=" + loc + "]";
//	}

	
}
