package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.NewHouse;
import com.bean.OldHouse;
import com.bean.Person;
import com.util.JdbcUtil;

public class NewHouseDaoImpl implements NewHouseDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	@Override
	public List<NewHouse> getAllNewHouses() {
		List<NewHouse> nhs = new ArrayList<NewHouse>();
		String sql = "";
		try {
			conn = JdbcUtil.getConnection();
			sql = "select nh.*,p.* from tb_newHouse nh left JOIN tb_person p  ON nh.person_id = p.id order by nh.select_seq+0 DESC";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				NewHouse nh = new NewHouse();
				Person p = new Person();
				p.setId(rs.getString("person_id"));
				p.setP0_name(rs.getString("p0_name"));
				p.setP0_uid(rs.getString("p0_uid"));
				p.setP0_state(rs.getString("p0_state"));
				p.setP1_idcNo(rs.getString("p1_idcNo"));
				p.setP1_name(rs.getString("p1_name"));
				p.setTelNo(rs.getString("telNo"));
				p.setChoose_state(rs.getInt("choose_state"));
				nh.setPerson(p);
				
				nh.setHouse_no(rs.getString("house_no"));
				nh.setChoose_id(rs.getString("choose_id"));
				nh.setIsSelected(rs.getInt("isSelected"));
				nh.setArea(rs.getString("area"));
				nh.setPerson_id(rs.getString("person_id"));
				nh.setSelect_seq(rs.getString("select_seq"));
				nh.setSelect_time(rs.getString("select_time"));
				nh.setRemark(rs.getString("remark"));
				
				nhs.add(nh);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return nhs;

	}

}
