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
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select oh.* from tb_oldhouse oh order by oh.move_state desc,oh.sign_state desc,oh.id+0";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			PersonDao pd = new PersonDaoImpl();
			
			while (rs.next()) {
				OldHouse oh = new OldHouse();
				oh.setId(rs.getInt("id"));
				oh.setHouse_no(rs.getString("house_no"));
				oh.setPerson_id(rs.getString("person_id"));
				oh.setP0_name(rs.getString("p0_name"));
				oh.setLocation(rs.getInt("location"));
				oh.setArea(rs.getString("area"));
				oh.setSign_state(rs.getInt("sign_state"));
				oh.setMove_state(rs.getInt("move_state"));
				oh.setMove_seq(rs.getString("move_seq"));
				oh.setPerson(pd.getPersonById(rs.getString("person_id")));
				ohs.add(oh);
				/*System.out.println(oh.toString());*/
			}
			System.out.println("count:"+ohs.size());
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
		List<OldHouse> ohs = new ArrayList<OldHouse>();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select oh.*,p.* from tb_oldHouse oh,tb_person p  where oh.person_id = p.id and (oh.house_no like ? or p.p0_name like ? or p.p0_uid like ? or p.p1_idcNo like ? or oh.person_id like ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+kw+"%");
			ps.setString(2, "%"+kw+"%");
			ps.setString(3, "%"+kw+"%");
			ps.setString(4, "%"+kw+"%");
			ps.setString(5, "%"+kw+"%");
			rs = ps.executeQuery();
			PersonDao pd = new PersonDaoImpl();
			
			while (rs.next()) {
				OldHouse oh = new OldHouse();
				oh.setId(rs.getInt("id"));
				oh.setHouse_no(rs.getString("house_no"));
				oh.setPerson_id(rs.getString("person_id"));
				oh.setP0_name(rs.getString("p0_name"));
				oh.setLocation(rs.getInt("location"));
				oh.setArea(rs.getString("area"));
				oh.setSign_state(rs.getInt("sign_state"));
				oh.setMove_state(rs.getInt("move_state"));
				oh.setMove_seq(rs.getString("move_seq"));
				oh.setPerson(pd.getPersonById(rs.getString("person_id")));
				ohs.add(oh);
				System.out.println(oh.toString());
			}
			System.out.println("count:"+ohs.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return ohs;
	}

	@Override
	public List<OldHouse> getOldHousesByPerson_id(String person_id) {
		// TODO Auto-generated method stub
		List<OldHouse> ohs = new ArrayList<OldHouse>();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select * from tb_oldHouse where person_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, person_id);
			rs = ps.executeQuery();
			PersonDao pd = new PersonDaoImpl();
			
			while (rs.next()) {
				OldHouse oh = new OldHouse();
				oh.setId(rs.getInt("id"));
				oh.setHouse_no(rs.getString("house_no"));
				oh.setPerson_id(rs.getString("person_id"));
				oh.setP0_name(rs.getString("p0_name"));
				oh.setLocation(rs.getInt("location"));
				oh.setArea(rs.getString("area"));
				oh.setSign_state(rs.getInt("sign_state"));
				oh.setMove_state(rs.getInt("move_state"));
				oh.setMove_seq(rs.getString("move_seq"));
				oh.setPerson(pd.getPersonById(rs.getString("person_id")));
				ohs.add(oh);
				System.out.println(oh.toString());
			}
			System.out.println("count:"+ohs.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return ohs;
	}
}
