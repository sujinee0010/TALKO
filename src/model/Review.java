package model;

public class Review {

	private String review;
	private int improvement;
	
	public Review() {}
	
	
	
	
	public String getReview() {
		return review;
	}




	public void setReview(String review) {
		this.review = review;
	}




	public int getImprovement() {
		return improvement;
	}




	public void setImprovement(int improvement) {
		this.improvement = improvement;
	}




	public Review(String review , int improvement ) {
		this.review=review;
		this.improvement=improvement;
	}
}
