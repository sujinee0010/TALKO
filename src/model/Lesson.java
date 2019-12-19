package model;

public class Lesson {
	
	public Lesson() {}
	
	int idx=0;
	int count=0;
    int ongoing=0;
    int rate =0;
    int complete=0;
    String review="";
    String student="";
    String teacher="";

    String title="";
    String start_date="";
    String end_date="";
    int improvement =0;
    int user_idx=0;
    String user_email="";
	
	
    public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getOngoing() {
		return ongoing;
	}


	public void setOngoing(int ongoing) {
		this.ongoing = ongoing;
	}


	public int getRate() {
		return rate;
	}


	public void setRate(int rate) {
		this.rate = rate;
	}


	public int getComplete() {
		return complete;
	}


	public void setComplete(int complete) {
		this.complete = complete;
	}


	public String getReview() {
		return review;
	}


	public void setReview(String review) {
		this.review = review;
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


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getStart_date() {
		return start_date;
	}


	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public String getEnd_date() {
		return end_date;
	}


	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


	public int getImprovement() {
		return improvement;
	}


	public void setImprovement(int improvement) {
		this.improvement = improvement;
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

	public Lesson(
			int idx,
	        int count,
	        int ongoing,
	        int rate ,
	        int complete,
	        String review,
	        String student,
	        String teacher,

	        String title,
	        String start_date,
	        String end_date,
	        int improvement,
	        int user_idx,
	        String user_email

			) {
		
		this.idx=idx;
		this.count=count;
		this.ongoing=ongoing;
		this.rate=rate;
		this.complete=complete;
		this.review=review;
		this.student=student;
		this.teacher=teacher;
		this.title=title;
		this.start_date=start_date;
		this.end_date=end_date;
		this.improvement=improvement;
		this.user_idx=user_idx;
		this.user_email=user_email;
			}
	
	
	

}
