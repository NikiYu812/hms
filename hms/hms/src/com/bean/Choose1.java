package com.bean;

public class Choose1 {
	public String id;
	public int isSelected;
	public String person_id;
	public String p0_name;
	public String select_seq;
	public String select_time;
	public String remark;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getIsSelected() {
		return isSelected;
	}
	public void setIsSelected(int isSelected) {
		this.isSelected = isSelected;
	}
	public String getPerson_id() {
		return person_id;
	}
	public void setPerson_id(String person_id) {
		this.person_id = person_id;
	}
	/**
	 * @return the p0_name
	 */
	public String getP0_name() {
		return p0_name;
	}
	/**
	 * @param p0_name the p0_name to set
	 */
	public void setP0_name(String p0_name) {
		this.p0_name = p0_name;
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
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Choose1 [id=" + id + ", isSelected=" + isSelected
				+ ", person_id=" + person_id + ", p0_name=" + p0_name
				+ ", select_seq=" + select_seq + ", select_time=" + select_time
				+ ", remark=" + remark + "]";
	}
	

	
	
}
