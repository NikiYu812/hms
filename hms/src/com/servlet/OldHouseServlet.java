/*package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.NewHouse;
import com.bean.OldHouse;
import com.bean.Person;
import com.dao.OldHouseDao;
import com.dao.OldHouseDaoImpl;
import com.util.JdbcUtil;
import com.util.SysUtil;

public class OldHouseServlet extends HttpServlet {

	// 重写doGet方法
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String ct = SysUtil.getCurrentTime("yyyy-MM-dd HH:mm:ss");
		String path = "";
		String method = "list";
		method = request.getParameter("method");

		Connection conn;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			String sql = "";

			if (method.equals("list") || method == "list") {
				
				 * 
				 * 查询全部旧房屋列表
				 
				path = "listOldHouse.jsp";
				OldHouseDao ohd = new OldHouseDaoImpl();
				List<OldHouse> ohs = ohd.getAllOldHouses();
				request.setAttribute("ss", ohs);
				request.setAttribute("method", method);
				
				 * 
				 * 查询全部旧房屋信息结束
				 

				
				 * 
				 * 查询房屋信息开始 按关键字查询旧房信息（房号，原承租人姓名，原承租人职工号，协议签署人身份号）
				 
			} else if (method.equals("find") || method == "find") {
				path = "searchResult.jsp";
				String choose = request.getParameter("choose");
				System.out.println("choose:" + choose);
				String kw = request.getParameter("kw");
				String person_id = "";
				System.out.println("kw:" + kw);

				sql = "select oh.*,p.* from tb_oldHouse oh,tb_person p  where oh.person_id = p.id and (oh.house_no= ? or p.p0_name = ? or p.p0_uid = ? or p.p1_idcNo = ?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, kw);
				ps.setString(2, kw);
				ps.setString(3, kw);
				ps.setString(4, kw);
				rs = ps.executeQuery();
				while (rs.next()) {
					person_id = rs.getString("person_id");
					// 判断如果未签协议，或者如果已抽签，不显示抽签按钮
					int sign_state = rs.getInt("sign_state");
					int choose_state = rs.getInt("choose_state");
					if (sign_state == 0 || choose_state == 1) {
						choose = "0";
					}
				}

				// 根据person_id查询新房屋信息
				sql = "select nh.* from tb_newhouse nh where nh.person_id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, person_id);
				rs = ps.executeQuery();
				NewHouse nh = new NewHouse();
				while (rs.next()) {
					nh.setId(rs.getInt("id"));
					nh.setHouse_no(rs.getString("house_no"));
					nh.setChoose_id(rs.getString("choose_id"));
					nh.setIsSelected(rs.getInt("isSelected"));
					nh.setArea(rs.getString("area"));
					nh.setPerson_id(rs.getString("person_id"));
					nh.setP0_name(rs.getString("p0_name"));
					nh.setSelect_seq(rs.getString("select_seq"));
					nh.setSelect_time(rs.getString("select_time"));
					nh.setRemark(rs.getString("remark"));
				}

				sql = "select oh.*,p.* from tb_oldHouse oh,tb_person p where oh.person_id = p.id and oh.person_id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, person_id);
				rs = ps.executeQuery();

				List<OldHouse> ss = new ArrayList<OldHouse>();
				while (rs.next()) {
					OldHouse s = new OldHouse();
					s.setId(rs.getInt("id"));
					s.setHouse_no(rs.getString("house_no"));
					s.setPerson_id(rs.getString("person_id"));
					s.setP0_name(rs.getString("p0_name"));
					s.setP0_uid(rs.getString("p0_uid"));
					s.setP0_state(rs.getString("p0_state"));
					s.setP1_name(rs.getString("p1_name"));
					s.setP1_idcNo(rs.getString("p1_idcNo"));
					s.setTelNo(rs.getString("telNo"));
					s.setLocation(rs.getInt("location"));
					s.setArea(rs.getString("area"));
					s.setSign_state(rs.getInt("sign_state"));
					s.setMove_state(rs.getInt("move_state"));
					s.setMove_seq(rs.getString("move_seq"));
					s.setChoose_state(rs.getInt("choose_state"));
					// 后台打印，试看有没有拿到
					String ms = "ID：" + rs.getInt("id") + " 房号："
							+ rs.getString("house_no");
					System.out.println(ms);
					ss.add(s);
				}

				// ArrayList放进request的属性里，这样jsp页面就能request.getAttribute("ss")
				// 拿出ArrayList了。
				request.setAttribute("nh", nh);
				request.setAttribute("ss", ss);
				request.setAttribute("method", method);
				request.setAttribute("kw", kw);
				request.setAttribute("choose", choose);
				rs.close();
				ps.close();
				
				 * 
				 * 查询房屋信息结束
				 
			} else if (method.equals("choose") || method == "choose") {
				
				 * 
				 * 抽选新房屋开始
				 
				HttpSession session = request.getSession();
				String kw = (String) session.getAttribute("kw");
				System.out.println("抽选新房kw:" + kw);
				path = "chooseResult.jsp";
				NewHouse nh = new NewHouse();

				// 根据person_id查询person_id,p0_name,写入nh
				sql = "select t2.* from tb_oldHouse t1,tb_person t2 where t1.person_id = t2.id  and t1.person_id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, kw);
				rs = ps.executeQuery();

				while (rs.next()) {
					Person p = new Person();
					p.setId(rs.getString("id"));
					p.setP0_name(rs.getString("p0_name"));
					p.setP0_uid(rs.getString("p0_uid"));
					p.setP0_state(rs.getString("p0_state"));
					p.setP1_idcNo(rs.getString("p1_idcNo"));
					p.setP1_name(rs.getString("p1_name"));
					p.setTelNo(rs.getString("telNo"));
					p.setChoose_state(rs.getInt("choose_state"));
					nh.setPerson(p);
					System.out.println(nh.getPerson().getId()
							+ nh.getPerson().getP0_name());
				}

				// 防止刷新页面重复抽签
				if (nh.getPerson().getChoose_state() == 1
						|| ("1").equals(nh.getPerson().getChoose_state())) {
					// 如果已经抽过签，显示抽签新房源信息
					sql = "select nh.* from tb_newHouse nh where nh.person_id = ?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, nh.getPerson().getId());
					rs = ps.executeQuery();

					while (rs.next()) {
						nh.setHouse_no(rs.getString("house_no"));
						nh.setChoose_id(rs.getString("choose_id"));
						nh.setIsSelected(rs.getInt("isSelected"));
						nh.setArea(rs.getString("area"));
						nh.setPerson_id(rs.getString("person_id"));
						nh.setSelect_seq(rs.getString("select_seq"));
						nh.setSelect_time(rs.getString("select_time"));
						nh.setRemark(rs.getString("remark"));
					}

				} else {

					// 开始抽签（如果未抽签）
					// 读取数据库中可用的房源形成列表
					List<String> list = new LinkedList<String>();
					sql = "select id from tb_newHouse where isSelected = 0";
					ps = conn.prepareStatement(sql);
					rs = ps.executeQuery();
					while (rs.next()) {
						list.add(rs.getInt("id") + "");
						// System.out.println(rs.getInt("nh_id"));
					}
					// 计算列表大小
					int size = list.size();
					System.out.println("size:" + size);
					// 随机产生大于0小于等于size的数r
					Random rm = new Random();
					int r = rm.nextInt(size) + 1;
					System.out.println("random:" + r);
					// 读取list(r)的值
					String selected = list.get(r - 1);
					nh.setId(Integer.parseInt(selected));
					nh.setIsSelected(1);
					System.out.println("selected record id:" + selected);

					String choose = "select * from tb_newHouse where id = ?";
					ps = conn.prepareStatement(choose);
					ps.setString(1, selected);
					rs = ps.executeQuery();
					while (rs.next()) {
						// System.out.println(rs.getString("house_no"));
						nh.setArea(rs.getString("area"));
						nh.setChoose_id(rs.getString("choose_id"));
						nh.setHouse_no(rs.getString("house_no"));
						nh.setId(rs.getInt("id"));
						nh.setSelect_time(ct);
					}

					sql = "select max(t.select_seq) as 'seq' from tb_newHouse t ";
					ps = conn.prepareStatement(sql);
					rs = ps.executeQuery();
					while (rs.next()) {
						int seq = Integer.parseInt(rs.getString("seq")) + 1;
						System.out.println(seq);
						nh.setSelect_seq(seq + "");
					}

					// 更新新房源表数据
					String update = "update tb_newHouse set isSelected = 1,person_id=?,p0_name=?, select_seq = ?,select_time=? where id = ?";
					ps = conn.prepareStatement(update);
					ps.setString(1, nh.getPerson().getId());
					ps.setString(2, nh.getPerson().getP0_name());
					ps.setString(3, nh.getSelect_seq());
					ps.setString(4, nh.getSelect_time());
					ps.setString(5, selected);
					int result = ps.executeUpdate();
					System.out.println(result);
					// 更新人员信息表数据
					update = "update tb_person set choose_state = ?, nh_id = ? where id = ?";
					ps = conn.prepareStatement(update);
					ps.setInt(1, 1);
					ps.setString(2, nh.getId() + "");
					ps.setString(3, nh.getPerson().getId());
					result = ps.executeUpdate();
					System.out.println(result);

				}

				rs.close();
				JdbcUtil.close(ps, conn);
				request.setAttribute("nh", nh);
				
				 * 
				 * 抽选新房屋结束
				 
				
				 * 
				 * 列出全部已选新房信息
				 

			} else if (method.equals("listNh")
					|| method == "listNh") {
				path = "listNewHouse.jsp";
								
				sql = "select nh.*,p.* from tb_newHouse nh,tb_person p  where nh.person_id = p.id order by nh.select_seq+0  ";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				
				List<NewHouse> nhs = new ArrayList<NewHouse>();
				while(rs.next()){
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
				
				request.setAttribute("nhs", nhs);
				request.setAttribute("method", method);
				rs.close();
				ps.close();
				
				

			} else {
				System.out.print("错错错");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 跳转到显示页面
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}*/