package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import com.util.JdbcUtil;



public class random {
	
	

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
/*		char[] people = {'A','B','C','D','E'};
		char[] buildingNo = {'1','2','3','4','5'};
		ArrayList buildlist = new ArrayList();	//用来存放已经被抓出的楼号
		Random rm = new Random();
		for(int i=0;i<5;i++){
			System.out.print(people[i]+"抽中的楼号是：");
			for(;;){
				int r = rm.nextInt(5);	//随机产生大于等于0小于5的数
				if(!buildlist.contains(buildingNo[r])){
					buildlist.add(buildingNo[r]);
					System.out.println(buildingNo[r]);
					break;
				}
			}
		}*/
		
/*		
		//读取数据库中可用的房源nh_id形成列表
		List<String> list = new LinkedList<String>();
		DBUtil du = new DBUtil();
		Connection conn = du.getConn();
		String strsql= "select id from rt_newHouse where isSelected = 0";
		PreparedStatement pstmt = conn.prepareStatement(strsql); 
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			list.add(rs.getInt("id")+"");
//			System.out.println(rs.getInt("nh_id"));
		}
		//计算列表大小
		int max = list.size();
		System.out.println("max:"+max);
		//随机产生大于0小于等于max的数r
		Random rm = new Random();
		
		for(int i=0;i<3;i++){
			int r = rm.nextInt(max)+1;
			System.out.println("random:"+r);
			//读取list(r)的值
			String selected = list.get(r-1);
			System.out.println("selected record id:"+selected);
			String choose = "select * from rt_newHouse where id ="+selected;
			pstmt = conn.prepareStatement(choose); 
			ResultSet rs1 = pstmt.executeQuery(); 
			while(rs1.next()){
				System.out.println(rs1.getString("house_no"));
			}
		}
		*/
		
		/*for(int i=0;i<3;i++){
			//读取数据库中可用的房源nh_id形成列表
			List<String> list = new LinkedList<String>();
			Connection conn = JdbcUtil.getConnection();
			String strsql= "select id from rt_newHouse where isSelected = 0";
			PreparedStatement pstmt = conn.prepareStatement(strsql); 
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				list.add(rs.getInt("id")+"");
	//			System.out.println(rs.getInt("nh_id"));
			}
			//计算列表大小
			int max = list.size();
			System.out.println("max:"+max);
			//随机产生大于0小于等于max的数r
			Random rm = new Random();
			int r = rm.nextInt(max)+1;
			System.out.println("random:"+r);
			//读取list(r)的值
			String selected = list.get(r-1);
			System.out.println("selected record id:"+selected);
			String choose = "select * from rt_newHouse where id ="+selected;
			pstmt = conn.prepareStatement(choose); 
			ResultSet rs1 = pstmt.executeQuery(); 
			while(rs1.next()){
				System.out.println(rs1.getString("house_no"));
			}
			String update = "update rt_newHouse set isSelected = 1 where id ="+selected;
			pstmt = conn.prepareStatement(update);
			int result = pstmt.executeUpdate();
			System.out.println(result);
			if(result==0){
				break;
			}
		}*/
		
//		开始抽签
		Connection conn = JdbcUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		
		
		//读取数据库中可用的房源形成列表
		List<String> list = new LinkedList<String>();
		sql = "select id from rt_newHouse where isSelected = 0";
		ps = conn.prepareStatement(sql); 
		rs = ps.executeQuery();
		while(rs.next()){
			list.add(rs.getInt("id")+"");
//			System.out.println(rs.getInt("nh_id"));
		}
		//计算列表大小
		int size = list.size();
		System.out.println("size:"+size);
		//随机产生大于0小于等于size的数r
		Random rm = new Random();
		int r = rm.nextInt(size)+1;
		
		System.out.println("random:"+r);
		//读取list(r)的值
		String selected = list.get(r-1);
		System.out.println("selected record id:"+selected);
		String choose = "select * from rt_newHouse where id = ?";
		ps = conn.prepareStatement(choose);
		ps.setString(1, selected);
		rs = ps.executeQuery();
		
		while(rs.next()){
			System.out.println(rs.getString("house_no"));
		}
		String update = "update rt_newHouse set isSelected = 1 where id = ?";
		ps = conn.prepareStatement(update);
		ps.setString(1, selected);
		int result = ps.executeUpdate();
		System.out.println(result);
			
		JdbcUtil.close(ps, conn);
	}

}
