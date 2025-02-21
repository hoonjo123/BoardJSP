package woo.edu.c.vo;

import java.sql.*;
import com.fasterxml.jackson.annotation.JsonFormat;

public class BoardVo {
	private int id;
	private String title;
	private String content;
	private String writer;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp regdate;
	private int status;
	
	public BoardVo() {}
	
	public BoardVo(int id, String title, String content, String writer, Timestamp regdate, int status) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.writer = writer;
        this.regdate = regdate;
        this.status = status;
    }
	
	public int getStatus() {
		return status;
	}
	
	public void setStatus(int status) {
	    this.status = status;
	}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Timestamp getRegdate() {
        return regdate;
    }

    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }

    @Override
    public String toString() {
        return "BoardVo [id=" + id + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate=" + regdate + ",  status=" + status + "]";
    }
}
