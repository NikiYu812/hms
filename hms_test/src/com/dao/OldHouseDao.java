/**
 * 
 */
package com.dao;

import java.util.List;

import com.bean.OldHouse;

/**
 * @author Administrator
 *
 */
public interface OldHouseDao {
	public List<OldHouse> getAllOldHouses();
	public List<OldHouse> getOldHousesByKw(String kw);
	
	
}
