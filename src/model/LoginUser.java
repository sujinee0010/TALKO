package model;

public class LoginUser {

	private int idx;
	private String email;
	private String password;
	private String name;
	private String gender;
	private int age;
	private String nation;
	private String phone;
	private String level;
	private String language;
	private String career;
	private String introduce;
	private String lesson_time;
	private String type;
	
	
	public LoginUser(){};
	
	
	public LoginUser(int idx ,String email,  String name ){
		this.email=email;
		this.idx=idx;
		this.name=name;
		
		
	};

	public LoginUser(String email, String password ){
		this.email=email;
		this.password=password;
		
		
	};
	
	public LoginUser(
	int idx,
    String email,
    String password,
    String name,
    String gender,
    int age,
    String nation,
    String phone,
    String level,
    String language,
    String career,
    String introduce,
    String lesson_time,
    String type
    ) {
		
		this.idx=idx;
		this.email=email;
		this.password=password;
		this.name=name;
		this.gender=gender;
		this.age=age;
		this.nation=nation;
		this.phone=phone;
		this.level=level;
		this.language=language;
		this.career=career;
		this.introduce=introduce;
		this.lesson_time=lesson_time;
		this.type=type;
		
		
		
		
	}
	
	
	
	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getLesson_time() {
		return lesson_time;
	}

	public void setLesson_time(String lesson_time) {
		this.lesson_time = lesson_time;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
