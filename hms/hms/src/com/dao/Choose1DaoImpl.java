package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.bean.Choose1;
import com.util.JdbcUtil;

public class Choose1DaoImpl implements Choose1Dao{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	@Override
	public Choose1 getChoose1ById(String id) {
		// TODO Auto-generated method stub
		Choose1 c = new Choose1();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select * from tb_choose1 where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()){
				c.setId(rs.getString("id"));
				c.setIsSelected(rs.getInt("isSelected"));
				c.setPerson_id(rs.getString("person_id"));
				c.setSelect_seq(rs.getString("select_seq"));
				c.setSelect_time(rs.getString("select_time"));
				/*System.out.println(c.toString());*/	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return c;
	}
	
	
	@Override
	public Choose1 getChoose1ByPerson_id(String person_id) {
		// TODO Auto-generated method stub
		Choose1 c = new Choose1();
		
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select * from tb_choose1 where person_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, person_id);
			rs = ps.executeQuery();
			while(rs.next()){
				c.setId(rs.getString("id"));
				c.setIsSelected(rs.getInt("isSelected"));
				c.setPerson_id(rs.getString("person_id"));
				c.setSelect_seq(rs.getString("select_seq"));
				c.setSelect_time(rs.getString("select_time"));
				System.out.println(c.toString());	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return c;
	}


	@Override
	public List<String> getSelectedIds() {
		// TODO Auto-generated method stub
		List<String> list = new LinkedList<String>();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select id from tb_choose1 where isSelected = 1";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getInt("id") + "");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return list;
	}
	
	@Override
	public List<String> getUnSelectedIds() {
		// TODO Auto-generated method stub
		List<String> list = new LinkedList<String>();
		
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select id from tb_choose1 where isSelected = 0";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(rs.getInt("id") + "");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return list;
	}


	@Override
	public String getMaxSelect_seq() {
		// TODO 查询tb_choose1表中select_seq最大值+1
		int seq = 0;
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select max(c.select_seq) as 'seq' from tb_choose1 c";
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


	@Override
	public int updateChoose1(Choose1 c) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			conn = JdbcUtil.getConnection();
			String sql = "update tb_choose1 c set c.isSelected = ?, c.person_id=?, c.p0_name=?, c.select_seq=?, c.select_time=? where c.id=? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getIsSelected());
			ps.setString(2, c.getPerson_id());
			ps.setString(3, c.getP0_name());
			ps.setString(4, c.getSelect_seq());
			ps.setString(5, c.getSelect_time());
			ps.setString(6, c.getId());
			result = ps.executeUpdate();
			System.out.println("更新tb_choose1信息结果：" + result + " "
					+ ps.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs, ps, conn);
		}
		return result;
	}

}
