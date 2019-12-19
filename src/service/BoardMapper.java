package service;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import model.Apply;
import model.Lesson;
import model.LoginUser;
import model.Review;
import model.Score;
import model.Tutor;
import model.UserAvg;

public class BoardMapper {
	
		public BoardMapper() {}
		
		//사용자 객체 반환 (사용자 이메일 값)
		public  LoginUser getUser(String email) {
			
			LoginUser user=null;
			
			try {
				Connection conn =null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("db 연결 성공 ");
				
				String sql = "SELECT * FROM user  WHERE email = ? "; 
		        stmt = conn.prepareStatement(sql);
		        stmt.setString(1,email);
		       
		        rs=stmt.executeQuery();
		        
		        int idx =0;
		        String email_="";
		        String password="";
		        String name="";
		        String gender="";
		        int age=0;
		        String nation="";
		        String phone="";
		        String level="";
		        String language="";
		        String career="";
		        String introduce="";
		        String lesson_time="";
		        String type="";
		        
		        if(rs != null) {
		        	
		        	while(rs.next()) {
		        		idx=rs.getInt("idx");
		        		email_=rs.getString("email");
		        		password=rs.getString("password");
		        		name=rs.getString("name");		        		
		        		gender = rs.getString("gender");
		        		age=rs.getInt("age");
		        		nation=rs.getString("nation");
		        		phone=rs.getString("phone");
		        		level=rs.getString("level");
		        		language=rs.getString("language");
		        		career=rs.getString("career");
		        		introduce=rs.getString("introduce");
		        		lesson_time=rs.getString("lesson_time");
		        		type=rs.getString("type");
		        		
		        		
		        		 user = new LoginUser(idx,email_,password,name,gender,age,nation,phone,level,language,career,introduce,lesson_time,type);
		        		            		
		        	}
		        	
		        }
						}catch(SQLException ex){
					System.out.println("sqlException"+ex);}
		
				catch(Exception e) {
				System.out.println("exception"+e);}
				return user;
		}
		
		
		
		
		
		//신청테이블 삽입  (은 학생만 함) 신청 내용 + 유저 정보 
		public void insertApply(String title , String content,String teacher,LoginUser loginUser) {
			
			try {
				//드라이버 로딩
				Connection conn =null;
				PreparedStatement stmt = null;
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("db 연결 성공 ");
				
				//날짜 형식 포맷 
				Date dt = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = sdf.format(dt);
				
				
				String sql ="insert into apply (date,title,content,to_lesson,student,teacher,user_idx,user_email)"
						+ " values(?,?,?,?,?,?,?,?)";
				
				

				stmt = conn.prepareStatement(sql);
								
				stmt.setString(1, date);
				stmt.setString(2, title);
				stmt.setString(3, content);
				stmt.setInt(4, 0);
				stmt.setString(5, loginUser.getName());
				
				stmt.setString(6, teacher);
				stmt.setInt(7, loginUser.getIdx());
				stmt.setString(8,loginUser.getEmail());
				
	          
	         
	            stmt.executeUpdate();
	       
				
			}catch(SQLException ex){
				System.out.println("sqlException"+ex);}
			
			catch(Exception e) {
				System.out.println("exception"+e);}
			
		}
			
	
		// 신청리스트  조회 메서드 (유저 네임(선생님 학생 둘다 ...)
		public List<Apply>  applyList(String email) {
			List<Apply> list = new ArrayList<Apply>();
			String name = getUser(email).getName();
			
		
			try {
				Connection conn =null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("db 연결 성공 ");
			    // 조회하고  리스트 만들기 
				
		        String sql2 = "select * from apply where student = ? or teacher = ?"; 
		        stmt = conn.prepareStatement(sql2);
		       
		        stmt.setString(1,name);
		        stmt.setString(2,name);
		        
		        rs=stmt.executeQuery();
		        
		        int idx=0;
		        String title="";
		        String date="";
		        String contents="";
		        int to_lesson=0;
		        String student="";
		        String teacher="";
		        int user_idx=0;
		        String user_email="";

		        
		        
		        
		        if(rs != null) {
		        	
		        	while(rs.next()) {
		        		
		        		idx=rs.getInt("idx");
		        		date=rs.getString("date");
		        		title=rs.getString("title");
		        		contents=rs.getString("content");
		        		to_lesson=rs.getInt("to_lesson");
		        		student=rs.getString("student");
		        		teacher=rs.getString("teacher");
		        		user_idx=rs.getInt("user_idx");
		        		user_email=rs.getString("user_email");
		    
		        		
		        		
		        	    Apply ap = new Apply(idx,date,title,contents,to_lesson,student,teacher,user_idx,user_email);
		        		list.add(ap);
		        		            		
		        	}
		        	
		        }
		        
		      
		
			
			
		
				}catch(SQLException ex){
					System.out.println("sqlException"+ex);}
		
				catch(Exception e) {
				System.out.println("exception"+e);}
			
			
			
			return list;
		}
		
		
		
		//수업 만들기 // 신청 테이블에서 수업으로 변환시 0 에 1값 넣어줌 
		public int toLesson(int idx) {
			int ans=0;
			try {
				//드라이버 로딩
				
				Connection conn =null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("db to 연결 성공 ");
								
					// 0 값인지 조회 
				
				 
				 	String sql = "SELECT to_lesson FROM apply WHERE idx = ?";
			        stmt = conn.prepareStatement(sql);
			        stmt.setInt(1,idx);
			        
			        rs=stmt.executeQuery();
			        
			        int check=-1;
			       			        
			        if(rs != null) {
			        	
			        	while(rs.next()) {
			      
			        	check =rs.getInt("to_lesson");
			        	
			        	}
			        }
			        //0값이면 1로 바꾸고 전환
			        
			       	if(check==0) {
			       		System.out.println("2 연결 ? ");
			       		String sql2 ="UPDATE apply SET to_lesson =?  WHERE idx = ?";
						stmt = conn.prepareStatement(sql2);			
						stmt.setInt(1,1);
						stmt.setInt(2,idx);
			            stmt.executeUpdate();
			            ans = 1;
			       		
			       	}
			       	
			        //아니면,1값이면 전환 금지  
			       	else {
			       		
			       		ans = 0;
			       	}
	
	           				
			}catch(SQLException ex){
				System.out.println("sqlException"+ex);}
			
			catch(Exception e) {
				System.out.println("exception"+e);}
			
			return ans;
			
		}
		
		
		//수업 생성 
		public void makeLesson(Apply apply) {
			
			try {
					
				//드라이버 로딩
				
				Connection conn =null;
				PreparedStatement stmt = null;
			
				System.out.println("make lesson 연결전 ");

				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("make lesson 연결");
				
				        	
				String sql ="INSERT INTO lesson (count,ongoing,rate,complete,review,student,teacher,title,start_date,end_date,improvement,user_idx,user_email) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

				stmt = conn.prepareStatement(sql);
								
				stmt.setInt(1, 0);
				stmt.setInt(2, 0);
				stmt.setInt(3, 0);
				stmt.setInt(4, 0);
				stmt.setString(5, "");
				
				stmt.setString(6, apply.getStudent());
				stmt.setString(7, apply.getTeacher());
				stmt.setString(8, apply.getTitle());
				stmt.setString(9, "");
				stmt.setString(10,"");
				stmt.setInt(11, 0);
				stmt.setInt(12, apply.getUser_idx());
				stmt.setString(13,apply.getUser_email());

				
	          
	         
	            stmt.executeUpdate();
	          	            
				
			}catch(SQLException ex){
				System.out.println("sqlException"+ex);}
			
			catch(Exception e) {
				System.out.println("exception"+e);}
			
		}

		
		
			
		//수업 리스트 호출  선생님 ,학생 둘다 
		public List<Lesson> lessonList(String email){
			
			List<Lesson> list = new ArrayList<Lesson>();
			String name =getUser(email).getName();
						
			try {
				//드라이버 로딩
				
				
				Connection conn =null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				//컨넥션 얻어오	
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("LIST 연결 성공 ");
			
		   
				String sql2 = "SELECT * FROM lesson WHERE student = ? OR teacher = ?  "; 	
				stmt = conn.prepareStatement(sql2);
		        stmt.setString(1,name);
		        stmt.setString(2,name);
		        rs=stmt.executeQuery();
		        
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

		        
		        
		        
		        if(rs != null) {
		        	
		        	while(rs.next()) {
		        		
		        		idx=rs.getInt("idx");
		        		count=rs.getInt("count");
		        		ongoing=rs.getInt("ongoing");
		        		rate=rs.getInt("rate");
		        		complete=rs.getInt("complete");
		        		review=rs.getString("review");
		        		student=rs.getString("student");
		        		teacher=rs.getString("teacher");
		        		title=rs.getString("title");
		        		start_date=rs.getString("start_date");
		        		end_date=rs.getString("end_date");
		        		improvement=rs.getInt("improvement");
		        		user_idx=rs.getInt("user_idx");
		        		user_email=rs.getString("user_email");
		        		
		        				        		
		        		
		        	    Lesson lesson = new Lesson(idx,count,ongoing,rate,complete,review,student,teacher,title,start_date,end_date,improvement,user_idx,user_email);
		        		list.add(lesson);
		        		            		
		        	}
		        	
		        }
		        
		      
		
			
			
		
				}catch(SQLException ex){
					System.out.println("sqlException"+ex);}
		
				catch(Exception e) {
				System.out.println("exception"+e);}
			
			
			
			
			
			
			return list;
			
			
		}
		
		
		public boolean login(String email_ ,String password_) {
			
			boolean ans=false;
			//LoginUser loginUser = null ;
			
			try {
				//드라이버 로딩
				
				
				Connection conn =null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				//컨넥션 얻어오	
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("db 연결 성공 ");
			
		  
		        
				String sql2 = "SELECT email,password  FROM user WHERE email = ?"; 	
				stmt = conn.prepareStatement(sql2);
				stmt.setString(1,email_);
		        
		        rs=stmt.executeQuery();
		        
		        
		        String email ="";
		        String password="";
		        
		        if(rs != null) {
		        	
		        	while(rs.next()) {
		        		
		        		email= rs.getString("email");
		        		password= rs.getString("password");
		        		
		   		        		            		
		        	}
		        	
		        }
		        
		     
		        if((email.equals(email_)) && (password.equals(password_)))
				{
					ans=true;
				}
		      
		
			
			
		
				}catch(SQLException ex){
					System.out.println("sqlException"+ex);}
		
				catch(Exception e) {
				System.out.println("exception"+e);}
			
			
			//LoginUser u = loginUser;
			//return u;
			return ans;
			
			
		}
		
		
		public void updateLessonRate(double count, double ongoing, double rate,int idx ) {
			
			//int idx =lesson.getIdx();
			
			try {
				
				//드라이버 로딩
				
				Connection conn =null;
				PreparedStatement stmt = null;
			
				System.out.println("make lesson 연결전 ");

				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("make lesson 연결");
				
				//String sql = "UPDATE lesson SET to_lesson =?  WHERE idx = ?"
				String sql ="UPDATE lesson SET count = ? , ongoing = ? , rate = ? WHERE idx = ?";

				stmt = conn.prepareStatement(sql);
								
				stmt.setDouble(1, count);
				stmt.setDouble(2, ongoing);
				stmt.setDouble(3, rate);
				stmt.setInt(4, idx);
	            stmt.executeUpdate();
	          	            
				
			}catch(SQLException ex){
				System.out.println("sqlException"+ex);}
			
			catch(Exception e) {
				System.out.println("exception"+e);}

			
			
			
			
		}
			
		
		public void updateStudent(String email,String password,String name,String gender,int age,String nation,String phone,String lesson_time) {
			
			try {
				
				//드라이버 로딩
				
				Connection conn =null;
				PreparedStatement stmt = null;
			
				//System.out.println("make 연결전 ");

				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				//System.out.println("make lesson 연결");
				
				//String sql = "UPDATE lesson SET to_lesson =?  WHERE idx = ?"
				String sql ="UPDATE user SET password = ? , name = ? , gender = ? , age = ? , nation = ? , phone = ? , lesson_time = ?    WHERE email = ?";

				stmt = conn.prepareStatement(sql);
								
				stmt.setString(1, password);
				stmt.setString(2, name);
				stmt.setString(3, gender);
				stmt.setInt(4, age);
				stmt.setString(5, nation);
				stmt.setString(6, phone);
				stmt.setString(7, lesson_time);
				stmt.setString(8, email);
	            stmt.executeUpdate();
	          	            
				
			}catch(SQLException ex){
				System.out.println("sqlException"+ex);}
			
			catch(Exception e) {
				System.out.println("exception"+e);}


			
			
		}
		
		public void updateTeacher(String email,String password,String name,String gender,int age,String phone,String level,String language,String career ,String introduce, String lesson_time) {
		
			
			try {
				
				//드라이버 로딩
				
				Connection conn =null;
				PreparedStatement stmt = null;
			
				//System.out.println("make 연결전 ");

				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				//System.out.println("make lesson 연결");
				
				//String sql = "UPDATE lesson SET to_lesson =?  WHERE idx = ?"
				String sql ="UPDATE user SET password = ? , name = ? , gender = ? , age = ?  , phone = ? ,  level = ? , language = ? , career =? ,introduce = ?, lesson_time = ?    WHERE email = ?";

				stmt = conn.prepareStatement(sql);
								
				stmt.setString(1, password);
				stmt.setString(2, name);
				stmt.setString(3, gender);
				stmt.setInt(4, age);
			
				stmt.setString(5, phone);
				stmt.setString(6, level);
				stmt.setString(7, language);
				stmt.setString(8, career);
				stmt.setString(9, introduce);

				
				stmt.setString(10, lesson_time);
				stmt.setString(11, email);
	            stmt.executeUpdate();
	          	            
				
			}catch(SQLException ex){
				System.out.println("sqlException"+ex);}
			
			catch(Exception e) {
				System.out.println("exception"+e);}


			
			
			
			
		}
		
		
		public void insertLessonDate(int idx, String start_date, String end_date) {
			
			
			try {
				
				//드라이버 로딩
				
				Connection conn =null;
				PreparedStatement stmt = null;
			
				System.out.println("make lesson 연결전 ");

				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("make lesson 연결");
				
				
				String sql ="UPDATE lesson SET complete = 1 , start_date = ? , end_date = ? WHERE idx = ?";

				stmt = conn.prepareStatement(sql);
								
				stmt.setString(1, start_date);
				stmt.setString(2, end_date);
				//stmt.setInt(3, 1);
				stmt.setInt(3, idx);
	            stmt.executeUpdate();
	          	            
				
			}catch(SQLException ex){
				System.out.println("sqlException"+ex);}
			
			catch(Exception e) {
				System.out.println("exception"+e);}


			
			
			
		}
		
		
		public List<Score> selectScoreList(String email) {
			List<Score> list = new ArrayList<Score>();
			
			try {
				//드라이버 로딩
				
				
				Connection conn =null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				//컨넥션 얻어오	
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				//System.out.println("db 연결 성공 ");
			
		  
		        
				String sql = "SELECT sum , date,leveldifficulty FROM score WHERE user_email = ?"; 	
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,email);
		        
		        rs=stmt.executeQuery();
		        
		        int sum=0;
		        String date ="";
		        String level="";
		        
		        if(rs != null) {
		        	
		        	while(rs.next()) {
		        		sum=rs.getInt("sum");
		        		date= rs.getString("date");
		        		level= rs.getString("leveldifficulty");
		        		
		        		Score score = new Score(sum,date,level);
		        		list.add(score);
		   		        		            		
		        	}
		        	
		        }
		        
		     
		        		      
		
			
			
		
				}catch(SQLException ex){
					System.out.println("sqlException"+ex);}
		
				catch(Exception e) {
				System.out.println("exception"+e);}
			

			
			return list;
			
			
		}


		
		
		
		public void insertImprovement(int improvement, int idx) {
			
			try {
				
				//드라이버 로딩
				
				Connection conn =null;
				PreparedStatement stmt = null;
			
				//System.out.println("make 연결전 ");

				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				//System.out.println("make lesson 연결");
				
				//String sql = "UPDATE lesson SET to_lesson =?  WHERE idx = ?"
				String sql ="UPDATE lesson SET improvement = ?   WHERE idx = ?";

				stmt = conn.prepareStatement(sql);
								
				stmt.setInt(1, improvement);
				stmt.setInt(2, idx);
	            stmt.executeUpdate();
	          	            
				
			}catch(SQLException ex){
				System.out.println("sqlException"+ex);}
			
			catch(Exception e) {
				System.out.println("exception"+e);}


		
			
		}
		
		public void insertReview(String review , int idx) {
			
			
			try {
				
				//드라이버 로딩
				
				Connection conn =null;
				PreparedStatement stmt = null;
			
				//System.out.println("make 연결전 ");

				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				//System.out.println("make lesson 연결");
				
				//String sql = "UPDATE lesson SET to_lesson =?  WHERE idx = ?"
				String sql ="UPDATE lesson SET review = ?   WHERE idx = ?";

				stmt = conn.prepareStatement(sql);
								
				stmt.setString(1, review);
				stmt.setInt(2, idx);
	            stmt.executeUpdate();
	          	            
				
			}catch(SQLException ex){
				System.out.println("sqlException"+ex);}
			
			catch(Exception e) {
				System.out.println("exception"+e);}


			
			
			
		}

		public List<Review> selectReviewList(String tname) {
			
			List<Review> list = new ArrayList<Review>();
			
			try {
							
				Connection conn =null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				
				String sql = "SELECT review , improvement FROM lesson WHERE teacher = ? and complete =1 "; 	
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,tname);
		        
		        rs=stmt.executeQuery();
		       
		        String review="";
		        int improvement = 0;
		      		        
		        if(rs != null) {
		        	
		        	while(rs.next()) {
		        		
		        	
		        		review= rs.getString("review");
		        		improvement =rs.getInt("improvement");
		        		
		        		
		        		Review r = new Review(review,improvement);
		        		list.add(r);
		   		        		            		
		        	}
		        	
		        }
		        
		     
		        		      
		
			
			
		
				}catch(SQLException ex){
					System.out.println("sqlException"+ex);}
		
				catch(Exception e) {
				System.out.println("exception"+e);}
			

			
			return list;

		
		
		
		}
		
		
		public List<UserAvg> getAverage(String leveldifficulty){
			List<UserAvg> list = new ArrayList<UserAvg>();
			
			try {
				//드라이버 로딩
				
				
				Connection conn =null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				//컨넥션 얻어오	
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				//System.out.println("db 연결 성공 ");
			
		  
		        
				String sql = "SELECT  listening, writing, sum  FROM score WHERE leveldifficulty = ?"; 	
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,leveldifficulty);
		        
		        rs=stmt.executeQuery();
		       
		        int listening = 0;
		        int writing = 0;

		        int sum = 0;

		      		        
		        if(rs != null) {
		        	
		        	while(rs.next()) {
		        		
		        		//improvement = rs.getString("date");
		       
		        		listening = rs.getInt("listening");
		        		writing =rs.getInt("writing");
		        		sum =rs.getInt("sum");
		        		
		        		
		        		UserAvg userAvg = new UserAvg(listening,writing,sum);
		        		list.add(userAvg);
		   		        		            		
		        	}
		        	
		        }
		        
		     
		        		      
		
			
			
		
				}catch(SQLException ex){
					System.out.println("sqlException"+ex);}
		
				catch(Exception e) {
				System.out.println("exception"+e);}
			

			
			return list;
			
			
		}
		
		
		
		
		public Score selectScore(String email,String s[]) {
			
			
			Score score=null;
			try {
				//드라이버 로딩
				
				
				Connection conn =null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				//컨넥션 얻어오	
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("db 연결 성공 ");
			
		       System.out.print(s[0]);
		        
				String sql = "SELECT listening, writing ,sum , leveldifficulty FROM score WHERE leveldifficulty =? and date=? and user_email=?"; 	
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,s[0]);
				stmt.setString(2,s[1]);
				stmt.setString(3,email);
		        
		        rs=stmt.executeQuery();
		       
		        int listening = 0;
		        int writing = 0;
		        int sum = 0;
		        String level ="";
		      		        
		        if(rs != null) {
		        	
		        	while(rs.next()) {
		        		
		        		
		       
		        		listening = rs.getInt("listening");
		        		writing =rs.getInt("writing");
		        		sum =rs.getInt("sum");
		        		level=rs.getString("leveldifficulty");
		        		
		        		score = new Score(sum,listening,writing,level);
		        		//UserAvg userAvg = new UserAvg(listening,writing,sum);
		        		//list.add(userAvg);
		   		        		            		
		        	}
		        	
		        }
		        
		     
		        		      
		
			
			
		
				}catch(SQLException ex){
					System.out.println("sqlException"+ex);}
		
				catch(Exception e) {
				System.out.println("exception"+e);}
			

			
			return score;
			
			
		}

		public void insertStudent(String email, String password, String name, String gender, String age, String nation,
				String phone, String lesson_time, String type) {
			
			try {

			Connection conn =null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			//컨넥션 얻어오	
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
			System.out.println("db 연결 성공 ");
		
			
		

		 
		 	String sql ="INSERT INTO user(email,password,name,gender,age,nation,phone,lesson_time,type) VALUES (?,?,?,?,?,?,?,?,?)";

		    stmt = conn.prepareStatement(sql);
		    
		    stmt.setString(1,email);
		    stmt.setString(2,password);
		    stmt.setString(3,name);
		    stmt.setString(4,gender);
		    stmt.setString(5,age);
		    stmt.setString(6,nation);
		    stmt.setString(7,phone);
		    stmt.setString(8,lesson_time);
		    stmt.setString(9,type);
		    
		    stmt.executeUpdate();
			
			
			}catch(SQLException ex){
				System.out.println("sqlException"+ex);}
			
			catch(Exception e) {
			System.out.println("exception"+e);}
		
			
			
			
			
			
		}

		public void insertTeacher(String email, String password, String name, String gender, String age, String phone,
				String level, String language, String type) {
		try {
			
			
			Connection conn =null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			//컨넥션 얻어오	
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
			System.out.println("db 연결 성공 ");
		
			
			  String sql ="INSERT INTO user(email,password,name,gender,age,phone,level,language,type) VALUES (?,?,?,?,?,?,?,?,?)";
			  
		         stmt = conn.prepareStatement(sql);
		         
		         stmt.setString(1,email);
		         stmt.setString(2,password);
		         stmt.setString(3,name);
		         stmt.setString(4,gender);
		         stmt.setString(5,age);
		         stmt.setString(6,phone);
		         stmt.setString(7,level);
		         stmt.setString(8,language);
		         stmt.setString(9,type);
		         
		         stmt.executeUpdate();

			
			
			
		}catch(SQLException ex){
			System.out.println("sqlException"+ex);}
		
		catch(Exception e) {
		System.out.println("exception"+e);}
			
		}
		
		
		public Tutor getTutorDetail(Integer idx) {
			
			Tutor tutor = new Tutor();
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;

			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("db 연결 성공 ");
				
			
				String sql = "SELECT name,introduce,language,lesson_time,type,career FROM user WHERE idx = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, idx);
				rs = stmt.executeQuery();

				while (rs.next()) {
					
					
					tutor.setName(rs.getString(1));
					tutor.setIntroduce(rs.getString(2));
					tutor.setLanguage(rs.getString(3));
					tutor.setLesson_time(rs.getString(4));
					tutor.setType(rs.getString(5));
					tutor.setCareer(rs.getString(6));
					
					//detailList.add(tutordetail);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			return tutor;
			
		}
		
		
		public List<Tutor> getTutorList() {
			
			List<Tutor> list = new ArrayList<Tutor>();
					

			try {
				
				Connection conn =null;
				PreparedStatement stmt = null;
				ResultSet rs = null;

				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/talko_db?useSSL=false","root","1234");
				System.out.println("db 연결 성공 ");

				
				String sql = "SELECT name,introduce,language,lesson_time,type,career,idx FROM user WHERE type='teacher' ORDER BY idx";
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();

				while (rs.next()) {
					Tutor tutor = new Tutor();
					
					tutor.setName(rs.getString(1));
					tutor.setIntroduce(rs.getString(2));
					tutor.setLanguage(rs.getString(3));
					tutor.setLesson_time(rs.getString(4));
					tutor.setType(rs.getString(5));
					tutor.setCareer(rs.getString(6));
					tutor.setIdx(rs.getInt(7));
					list.add(tutor);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
				
			

			return list;
		}
		
		
		
		
		
		
		
	

}
	




