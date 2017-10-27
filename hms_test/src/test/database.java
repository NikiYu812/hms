package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.OldHouse;
import com.util.JdbcUtil;

public class database {

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = JdbcUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		
		sql = "select * from tb_oldHouse";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		List<OldHouse> ohs = new ArrayList<OldHouse>();
		while (rs.next()) {
			OldHouse oh = new OldHouse();
			oh.setId(rs.getInt("id"));
			oh.setHouse_no(rs.getString("house_no"));
			oh.setP0_name(rs.getString("p0_name"));
			System.out.println("id:"+oh.getId()+"\nhouse_no:"+oh.getHouse_no()+"\np0_name:"+oh.getP0_name());
			ohs.add(oh);
			
			String person_id = "";
			String sql0 = "select * from tb_person where p0_name=?";
			PreparedStatement ps0 = conn.prepareStatement(sql0);
			ps0.setString(1, oh.getP0_name());
			ResultSet rs0 = ps0.executeQuery();
			
			while(rs0.next()){
				oh.setPerson_id( rs0.getString("id"));
				System.out.println(oh.getPerson_id());
				break;
			}
			
			sql0 = "update tb_oldHouse oh set oh.person_id = ? where oh.id = ?";
			ps0 = conn.prepareStatement(sql0);
			ps0.setString(1, oh.getPerson_id());
			ps0.setInt(2,oh.getId());
			int result = ps0.executeUpdate();
			System.out.println(result);
			
			rs0.close();
			ps0.close();
			
		}
		rs.close();
		JdbcUtil.close(ps, conn);
		
	}

}
