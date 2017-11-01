package com.bean;

public class NewHouse {
	
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	private Person person;
	private int id;
	private String house_no;
	private String choose_id;	//签号
	private int isSelected;
	private String area;
	private String person_id;
	private String p0_name;
	private String p0_uid;
	private String p0_state;
	private String p1_name;
	private String p1_idcNo;
	private String telNo;
	private String select_seq;
	private String select_time;
	private String remark;

	
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
	public String getChoose_id() {
		return choose_id;
	}
	public void setChoose_id(String choose_id) {
		this.choose_id = choose_id;
	}
	public int getIsSelected() {
		return isSelected;
	}
	public void setIsSelected(int isSelected) {
		this.isSelected = isSelected;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
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
	public String getSelect_seq() {
		return select_seq;
	}
	public void setSelect_seq(String select_seq) {
		this.select_seq = select_seq;
	}
	public String getSelect_time() {
		return select_time;
	}
	public void setSelect_time(String select_time) {
		this.select_time = select_time;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "NewHouse [person=" + person + ", id=" + id + ", house_no="
				+ house_no + ", choose_id=" + choose_id + ", isSelected="
				+ isSelected + ", area=" + area + ", person_id=" + person_id
				+ ", p0_name=" + p0_name + ", p0_uid=" + p0_uid + ", p0_state="
				+ p0_state + ", p1_name=" + p1_name + ", p1_idcNo=" + p1_idcNo
				+ ", telNo=" + telNo + ", select_seq=" + select_seq
				+ ", select_time=" + select_time + ", remark=" + remark + "]";
	}
	
	
	
	
}
