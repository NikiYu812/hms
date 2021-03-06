package com.bean;

public class Person {
	private String id;
	private String p0_name;
	private String p0_uid;
	private String p0_state;
	private String p1_name;
	private String p1_idcNo;
	private String telNo;
	private String oh_id;
	private int sign_state;
	private int move_state;
	private String move_seq;
	private int choose_state;
	private String choose1_result;	//第一轮抽签结果
	private String choose2_result;	//第二轮抽签结果
	private String nh_id;
	private String remark;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getOh_id() {
		return oh_id;
	}
	public void setOh_id(String oh_id) {
		this.oh_id = oh_id;
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
	public String getChoose1_result() {
		return choose1_result;
	}
	public void setChoose1_result(String choose1_result) {
		this.choose1_result = choose1_result;
	}
	public String getChoose2_result() {
		return choose2_result;
	}
	public void setChoose2_result(String choose2_result) {
		this.choose2_result = choose2_result;
	}
	public String getNh_id() {
		return nh_id;
	}
	public void setNh_id(String nh_id) {
		this.nh_id = nh_id;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Person [id=" + id + ", p0_name=" + p0_name + ", p0_uid="
				+ p0_uid + ", p0_state=" + p0_state + ", p1_name=" + p1_name
				+ ", p1_idcNo=" + p1_idcNo + ", telNo=" + telNo + ", oh_id="
				+ oh_id + ", move_seq=" + move_seq + ", choose_state="
				+ choose_state + ", choose1_result=" + choose1_result
				+ ", choose2_result=" + choose2_result + ", nh_id=" + nh_id
				+ ", remark=" + remark + "]";
	}

	
	
}
