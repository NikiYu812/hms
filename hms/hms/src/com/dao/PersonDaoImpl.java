package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Choose1;
import com.bean.NewHouse;
import com.bean.Person;
import com.util.JdbcUtil;

public class PersonDaoImpl implements PersonDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public Person getPersonById(String id){
		Person p = new Person();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select * from tb_person where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			Choose1Dao cd = new Choose1DaoImpl();
			NewHouseDao nhd = new NewHouseDaoImpl();
			while(rs.next()){
				int choose_state = rs.getInt("choose_state");
				p.setId(rs.getString("id"));
				p.setP0_name(rs.getString("p0_name"));
				p.setP0_uid(rs.getString("p0_uid"));
				p.setP0_state(rs.getString("p0_state"));
				p.setP1_name(rs.getString("p1_name"));
				p.setP1_idcNo(rs.getString("p1_idcNo"));
				p.setTelNo(rs.getString("telNo"));
				p.setOh_id(rs.getString("oh_id"));
				p.setSign_state(rs.getInt("sign_state"));
				p.setMove_state(rs.getInt("move_state"));
				p.setMove_seq(rs.getString("move_seq"));
				p.setChoose_state(rs.getInt("choose_state"));
				p.setChoose1_result(rs.getString("choose1_result"));
				p.setChoose2_result(rs.getString("choose2_result"));
				p.setNh_id(rs.getString("nh_id"));
				p.setRemark(rs.getString("remark"));
				if(choose_state==1){
					p.setChoose1(cd.getChoose1ById(rs.getString("choose1_result")));
				}else if(choose_state==2){
					p.setChoose1(cd.getChoose1ById(rs.getString("choose1_result")));
					p.setNewHouse(nhd.getNewHouseByChoose_id(rs.getString("choose2_result")));
				}
				/*System.out.println(p.toString());*/
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}	
		return p;
	}

	@Override
	public List<Person> getAllPersons() {
		// TODO Auto-generated method stub
		List<Person> persons = new ArrayList<Person>();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select p.* from tb_person p order by p.choose2_result DESC,p.choose1_result desc,p.choose_state desc,p.sign_state desc,id";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Person p = new Person();
				Choose1Dao cd = new Choose1DaoImpl();
				NewHouseDao nhd = new NewHouseDaoImpl();
				
				int choose_state = rs.getInt("choose_state");
				
				p.setId(rs.getString("id"));
				p.setP0_name(rs.getString("p0_name"));
				p.setP0_uid(rs.getString("p0_uid"));
				p.setP0_state(rs.getString("p0_state"));
				p.setP1_name(rs.getString("p1_name"));
				p.setP1_idcNo(rs.getString("p1_idcNo"));
				p.setTelNo(rs.getString("telNo"));
				p.setOh_id(rs.getString("oh_id"));
				p.setSign_state(rs.getInt("sign_state"));
				p.setMove_state(rs.getInt("move_state"));
				p.setMove_seq(rs.getString("move_seq"));
				p.setChoose_state(rs.getInt("choose_state"));
				p.setChoose1_result(rs.getString("choose1_result"));
				p.setChoose2_result(rs.getString("choose2_result"));
				p.setNh_id(rs.getString("nh_id"));
				p.setRemark(rs.getString("remark"));
				if(choose_state==1){
					p.setChoose1(cd.getChoose1ById(rs.getString("choose1_result")));
				}else if(choose_state==2){
					p.setChoose1(cd.getChoose1ById(rs.getString("choose1_result")));
					p.setNewHouse(nhd.getNewHouseByChoose_id(rs.getString("choose2_result")));
				}
				persons.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return persons;
	}

	@Override
	public List<Person> getAllPersons_newHouse() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Person> getAllPersons_choose1() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int updatePerson(Person p) {
		// TODO Auto-generated method stub
		int result = 0;
		return result;
	}
	
/*	
 * 第一轮抽签后更新tb_person信息
*/	
	@Override
	public int updatePerson_choose(Person p) {
		// TODO Auto-generated method stub
		int result = 0;
		int choose_state = p.getChoose_state();
		
		try {
			conn = JdbcUtil.getConnection();
			String update = "";
			if(choose_state==0){
				System.out.println("更新tb_person信息结果：choose_state=0,不更新任何信息。");
			}else if(choose_state==1){
				update = "update tb_person set choose_state = ?, choose1_result = ? where id = ?";
				ps = conn.prepareStatement(update);
				ps.setInt(1, 1);
				ps.setString(2, p.getChoose1_result());
				ps.setString(3, p.getId());
				result = ps.executeUpdate();
				System.out.println("更新tb_person信息结果(第一轮抽签)：" + result + " " + ps.toString());
				//更新tb_choose1表中信息
				Choose1 c = p.getChoose1();
				Choose1Dao cd = new Choose1DaoImpl();
				cd.updateChoose1(c);
			}else if(choose_state==2){
				update = "update tb_person set choose_state = ?, choose2_result = ?, nh_id = ? where id = ?";
				ps = conn.prepareStatement(update);
				ps.setInt(1, 2);
				ps.setString(2, p.getChoose2_result());
				ps.setString(3, p.getNh_id());
				ps.setString(4, p.getId());
				result = ps.executeUpdate();
				System.out.println("更新tb_person信息结果(第二轮抽签)：" + result + " " + ps.toString());
				//更新tb_newHouse表中信息
				NewHouse nh = p.getNewHouse();
				NewHouseDao nhd = new NewHouseDaoImpl();
				nhd.updateNewHouse(nh);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.closeAll(rs,ps, conn);
		}
		return result;
	}


}
