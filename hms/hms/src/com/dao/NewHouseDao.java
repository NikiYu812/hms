/**
 * 
 */
package com.dao;

import java.util.List;

import com.bean.NewHouse;

/**
 * @author yxy
 *
 */
public interface NewHouseDao {
	public List<NewHouse> getAllNewHouses();
	public List<NewHouse> getAllNewHousesByPage(int page);
	public NewHouse getNewHouseByChoose_id(String choose_id);
	public List<String> getUnSelectedChooseIds(int building_type);
	public String getMaxSelect_seq();	// 查询tb_newHouse表中select_seq最大值+1
	public int updateNewHouse(NewHouse nh);
	public List<String> getCount();
	public int getTotalCount();
	public int getTotalPage();
	
	
}
