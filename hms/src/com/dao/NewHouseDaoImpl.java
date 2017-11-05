package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.bean.NewHouse;
import com.util.JdbcUtil;

public class NewHouseDaoImpl implements NewHouseDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	@Override
	public List<NewHouse> getAllNewHouses() {
		List<NewHouse> nhs = new ArrayList<NewHouse>();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select nh.*,p.* from tb_newHouse nh left JOIN tb_person p  ON nh.person_id = p.id order by nh.select_seq+0 DESC";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				NewHouse nh = new NewHouse();
				nh.setId(rs.getString("id"));
				nh.setHouse_no(rs.getString("house_no"));
				nh.setChoose_id(rs.getString("choose_id"));
				nh.setIsSelected(rs.getInt("isSelected"));
				nh.setBuilding_type(rs.getInt("building_type"));
				nh.setArea(rs.getString("area"));
				nh.setPerson_id(rs.getString("person_id"));
				nh.setP0_name(rs.getString("p0_name"));
				nh.setSelect_seq(rs.getString("select_seq"));
				nh.setSelect_time(rs.getString("select_time"));
				nh.setRemark(rs.getString("remark"));
				nhs.add(nh);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs, ps, conn);
		}
		return nhs;

	}

	@Override
	public NewHouse getNewHouseByChoose_id(String choose_id) {
		// TODO Auto-generated method stub
		NewHouse nh = new NewHouse();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select * from tb_newHouse where choose_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, choose_id);
			rs = ps.executeQuery();

			while (rs.next()) {
				nh.setId(rs.getString("id"));
				nh.setHouse_no(rs.getString("house_no"));
				nh.setChoose_id(rs.getString("choose_id"));
				nh.setIsSelected(rs.getInt("isSelected"));
				nh.setBuilding_type(rs.getInt("building_type"));
				nh.setArea(rs.getString("area"));
				nh.setPerson_id(rs.getString("person_id"));
				nh.setSelect_seq(rs.getString("select_seq"));
				nh.setSelect_time(rs.getString("select_time"));
				nh.setRemark(rs.getString("remark"));
				/* nh.toString(); */
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs, ps, conn);
		}

		return nh;
	}

	@Override
	public int updateNewHouse(NewHouse nh) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			conn = JdbcUtil.getConnection();
			String update = "update tb_newHouse set isSelected = ?,person_id=?,p0_name=?, select_seq = ?,select_time=? where id = ?";
			ps = conn.prepareStatement(update);
			ps.setInt(1, nh.getIsSelected());
			ps.setString(2, nh.getPerson_id());
			ps.setString(3, nh.getP0_name());
			ps.setString(4, nh.getSelect_seq());
			ps.setString(5, nh.getSelect_time());
			ps.setString(6, nh.getId());
			result = ps.executeUpdate();
			System.out.println("更新newHouse:" + result + " " + ps.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs, ps, conn);
		}
		return result;

	}

	@Override
	public List<String> getUnSelectedChooseIds(int building_type) {
		// TODO Auto-generated method stub
		List<String> list = new LinkedList<String>();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select choose_id from tb_newHouse where building_type = ? and isSelected = 0";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, building_type);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getInt("choose_id") + "");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs, ps, conn);
		}
		return list;
	}

	@Override
	public String getMaxSelect_seq() {
		// TODO Auto-generated method stub
		int seq = 0;
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select max(select_seq) as 'seq' from tb_newHouse";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				seq = Integer.parseInt(rs.getString("seq")) + 1;
				System.out.println("seq:" + seq);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return seq+"";
	}

}
