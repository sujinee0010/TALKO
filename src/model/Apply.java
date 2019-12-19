package model;

import java.util.Date;

public class Apply {
	
	private int idx;
	private String date;
	private String title;
	private String content;
	private int to_lesson;
	private String student;
	private String teacher;
	private int user_idx=0;
	private String user_email="";
	
	

	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
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


	public int getTo_lesson() {
		return to_lesson;
	}


	public void setTo_lesson(int to_lesson) {
		this.to_lesson = to_lesson;
	}


	public String getStudent() {
		return student;
	}


	public void setStudent(String student) {
		this.student = student;
	}


	public String getTeacher() {
		return teacher;
	}


	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}


	public int getUser_idx() {
		return user_idx;
	}


	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public Apply() {};
	
	
	public Apply(int idx, String date, String title, String content,int to_lesson, String student, String teacher,int user_idx,
	        String user_email) 
	{
		
		this.idx =  idx;
		this.date = date;
		this.title=title;
		this.content=content;
		this.to_lesson=to_lesson;
		this.student=student;
		this.teacher=teacher;
		this.user_idx=user_idx;
		this.user_email=user_email;

	
	}


	
	
}
