package com.bean;

public class OldHouse {
	
	private Person person;
	
	private int id;
	private String house_no;
	private String person_id;
	private String p0_name;
	private String p0_uid;
	private String p0_state;
	private String p1_name;
	private String p1_idcNo;
	private String telNo;
	private int location;
	private String area;
	private int sign_state;
	private int move_state;
	private String move_seq;
	private int choose_state;
	

	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHouse_no() {
		return house_no;
	}
	public void setHouse_no(String house_no) {
		this.house_no = house_no;
	}
	public String getPerson_id() {
		return person_id;
	}
	public void setPerson_id(String person_id) {
		this.person_id = person_id;
	}
	public String getP0_name() {
		return p0_name;
	}
	public void setP0_name(String p0_name) {
		this.p0_name = p0_name;
	}
	public String getP0_uid() {
		return p0_uid;
	}
	public void setP0_uid(String p0_uid) {
		this.p0_uid = p0_uid;
	}
	public String getP0_state() {
		return p0_state;
	}
	public void setP0_state(String p0_state) {
		this.p0_state = p0_state;
	}
	public String getP1_name() {
		return p1_name;
	}
	public void setP1_name(String p1_name) {
		this.p1_name = p1_name;
	}
	public String getP1_idcNo() {
		return p1_idcNo;
	}
	public void setP1_idcNo(String p1_idcNo) {
		this.p1_idcNo = p1_idcNo;
	}
	public String getTelNo() {
		return telNo;
	}
	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getSign_state() {
		return sign_state;
	}
	public void setSign_state(int sign_state) {
		this.sign_state = sign_state;
	}
	public int getMove_state() {
		return move_state;
	}
	public void setMove_state(int move_state) {
		this.move_state = move_state;
	}
	public String getMove_seq() {
		return move_seq;
	}
	public void setMove_seq(String move_seq) {
		this.move_seq = move_seq;
	}
	public int getChoose_state() {
		return choose_state;
	}
	public void setChoose_state(int choose_state) {
		this.choose_state = choose_state;
	}
	@Override
	public String toString() {
		return "OldHouse [person=" + person + ", id=" + id + ", house_no="
				+ house_no + ", person_id=" + person_id + ", p0_name="
				+ p0_name + ", p0_uid=" + p0_uid + ", p0_state=" + p0_state
				+ ", p1_name=" + p1_name + ", p1_idcNo=" + p1_idcNo
				+ ", telNo=" + telNo + ", location=" + location + ", area="
				+ area + ", sign_state=" + sign_state + ", move_state="
				+ move_state + ", move_seq=" + move_seq + ", choose_state="
				+ choose_state + "]";
	}
	
	
	
	
	
}
