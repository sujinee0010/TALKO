package model;

public class UserAvg {
	
	private int listening;

	private int writing;

	private int sum;
	
	
	
	
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

	public UserAvg() {}
	
	public UserAvg(int listening , int writing , int sum ) {
		
		this.listening=listening;
		this.writing=writing;
		this.sum=sum;
	}

}
