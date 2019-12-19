package controller;

import java.util.List;
import model.*;
import service.BoardMapper;

public class Controller {
	BoardMapper service = new BoardMapper();

	//사용자 이름 가져오는 메서드 
	public LoginUser getUser(String email) {
		
		return service.getUser(email);
		
	}

	//01 수업 만들기 메서드 
	public void makeLesson(Apply apply) {
		//수업으로 전환 하기 (이미 한거면 0 값 리턴 )
		int to_L =service.toLesson(apply.getIdx());
			//수업으로 전환완료되면  수업 생성하기 
			if(to_L==1){
				System.out.println(to_L);
				service.makeLesson(apply);
			}
		//수업으로 전환 불가능한 상태면 노실행 
	}

	//02 수업리스트 조회 메서드 
	public List<Lesson> lessonList(String email){
		
		List<Lesson> list =service.lessonList(email);

		return list;
	}
	
	public List<Apply>  applyList(String email) {
				
		return service.applyList(email);
		
	}
	
	public List<Score> selectScoreList(String email) {
		
		return service.selectScoreList(email);
	}
	
	
	public  List<Review> selectReviewList(String tname){
		
		return service.selectReviewList(tname);
				
	}
	
	public double averageSum(String leveldifficulty) {
		// 같은 레벨 가진 사람 총점 , 듣기 ,읽기 객체  라수트 들고 오기 
		List<UserAvg> list = service.getAverage(leveldifficulty);
		
		double aSum =0;
		for(int i=0; i<list.size();i++) {
			
			aSum+=list.get(i).getSum();
		}
		
		aSum= aSum/list.size();
		return aSum;
		
	}
	
	public double averageListening(String leveldifficulty) {
		
		
		List<UserAvg> list = service.getAverage(leveldifficulty);
		
		double aListen =0;
		for(int i=0; i<list.size();i++) {
			
			aListen+=list.get(i).getListening();
		}
		
		aListen = aListen/list.size();
		
		return aListen;
		
		
	}
	
	public double  averageWriting(String leveldifficulty) {
		
		List<UserAvg> list = service.getAverage(leveldifficulty);
		
		double aWriting =0;
		for(int i=0; i<list.size();i++) {
			
			aWriting+=list.get(i).getWriting();
		}
		
		aWriting= aWriting/list.size();
		
		return aWriting;
		
		
	}
	
	
	public void insertStudent(String email,String password,String name,String gender,String age,
			String nation,String phone,String lesson_time,String type) {
		
		service.insertStudent(email,password,name,gender,age,nation,phone,lesson_time,type);
		
	}
	
	public void insertTeacher(String email,String password,String name,String gender,String age,
			String phone,String level,String language,String type) {
		
		service.insertTeacher(email,password,name,gender,age,phone,level,language,type);
		
	}
	
	
	public Tutor getTutorDetail(Integer idx){
		
		return service.getTutorDetail(idx);
	}
	
	
	
	public List<Tutor> getTutorList() {
		return service.getTutorList();
	}
}
