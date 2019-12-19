package model;

public class Score {
	
	private int sum;
	private int listening;
	private int writing;
	private String date;
	private String level;
	
	
	
	
	public int getListening() {
		return listening;
	}
	public void setListening(int listening) {
		this.listening = listening;
	}
	public int getWriting() {
		return writing;
	}
	public void setWriting(int writing) {
		this.writing = writing;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public Score() {}
	
	public Score(int sum ,String date, String level) {
		this.sum=sum;
		this.date=date;
		this.level=level;
	}
	
	public Score(int sum , int listening , int writing ,String level ) {
		this.sum=sum;
		this.listening=listening;
		this.writing=writing;
		this.level=level;
	}

}
