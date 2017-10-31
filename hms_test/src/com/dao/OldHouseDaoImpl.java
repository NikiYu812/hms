package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.OldHouse;
import com.util.JdbcUtil;

public class OldHouseDaoImpl implements OldHouseDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	@Override
	public List<OldHouse> getAllOldHouses() {
		List<OldHouse> ohs = new ArrayList<OldHouse>();
		String sql = "";
		try {
			conn = JdbcUtil.getConnection();
			sql = "select oh.*,p.* from tb_oldHouse oh,tb_person p  where oh.person_id = p.id order by oh.sign_state desc , oh.move_state desc , oh.id+0";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				OldHouse oh = new OldHouse();
				oh.setId(rs.getInt("id"));
				oh.setHouse_no(rs.getString("house_no"));
				oh.setPerson_id(rs.getString("person_id"));
				oh.setP0_name(rs.getString("p0_name"));
				oh.setP0_uid(rs.getString("p0_uid"));
				oh.setP0_state(rs.getString("p0_state"));
				oh.setP1_name(rs.getString("p1_name"));
				oh.setP1_idcNo(rs.getString("p1_idcNo"));
				oh.setTelNo(rs.getString("telNo"));
				oh.setLocation(rs.getInt("location"));
				oh.setArea(rs.getString("area"));
				oh.setSign_state(rs.getInt("sign_state"));
				oh.setMove_state(rs.getInt("move_state"));
				oh.setMove_seq(rs.getString("move_seq"));
				oh.setChoose_state(rs.getInt("choose_state"));
				ohs.add(oh);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return ohs;

	}

	@Override
	public List<OldHouse> getOldHousesByKw(String kw) {
		// TODO Auto-generated method stub
		return null;
	}
}
