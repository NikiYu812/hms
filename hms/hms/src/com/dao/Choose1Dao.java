package com.dao;

import java.util.List;

import com.bean.Choose1;

public interface Choose1Dao {
	public Choose1 getChoose1ByPerson_id(String person_id);
	public Choose1 getChoose1ById(String id);
	public List<String> getSelectedIds();
	public List<String> getUnSelectedIds();
	public String getMaxSelect_seq();	// 查询tb_choose1表中select_seq最大值+1
	
	
	public int updateChoose1(Choose1 c);
	
}
