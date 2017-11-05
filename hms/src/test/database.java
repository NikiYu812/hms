package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.OldHouse;
import com.bean.Person;
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
		
		//把oldHouse表中的sign_state赋值到person表中
		String sql = "select * from tb_person";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		List<Person> ss = new ArrayList<Person>();
		while (rs.next()) {
			Person p = new Person();
			p.setId(rs.getString("id"));
			//根据person_id找到oldHouse,读取oldHouse中sign_state的值
			String sql1 = "select * from tb_oldHouse where person_id = ?";
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ps1.setString(1, p.getId());
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()){
				p.setSign_state(rs1.getInt("sign_state"));
			}
			//更新person表中sign_state的值
			 sql1="update tb_person  p set p.sign_state = ? where p.id = ?";
			 ps1 = conn.prepareStatement(sql1);
			 ps1.setInt(1, p.getSign_state());
			 ps1.setString(2, p.getId());
			 int result = ps1.executeUpdate();
			 System.out.println(result);
			 
			 rs1.close();
			 ps1.close();
			System.out.println(p.toString());
			ss.add(p);
		}
		JdbcUtil.closeAll(rs, ps, conn);
		
	}

}
