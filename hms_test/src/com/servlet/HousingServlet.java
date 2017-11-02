package com.servlet;

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
import com.dao.NewHouseDao;
import com.dao.NewHouseDaoImpl;
import com.dao.OldHouseDao;
import com.dao.OldHouseDaoImpl;
import com.util.JdbcUtil;
import com.util.SysUtil;

public class HousingServlet extends HttpServlet {

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
				/*
				 * 
				 * 查询全部旧房屋列表
				 */
				path = "listOldHouse.jsp";
				OldHouseDao ohd = new OldHouseDaoImpl();
				List<OldHouse> ohs = ohd.getAllOldHouses();
				request.setAttribute("ss", ohs);
				request.setAttribute("method", method);
				/*
				 * 
				 * 查询全部旧房屋信息结束
				 */

				/*
				 * 
				 * 查询房屋信息开始 按关键字查询旧房信息（房号，原承租人姓名，原承租人职工号，协议签署人身份号）
				 */
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
				/*
				 * 
				 * 查询房屋信息结束
				 */
			} else if (method.equals("1stChoose") || method == "1stChoose") {
				/*
				 * 
				 * 第一轮抽签开始
				 */
				System.out.println("********第一轮抽签开始********");
				HttpSession session = request.getSession();
				String kw = (String) session.getAttribute("kw");
				System.out.println("第一轮抽签kw:" + kw);
				path = "1stChooseResult.jsp";

				// 根据id查询出person信息，写入p中
				sql = "select p.* from tb_person p where p.id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, kw);
				rs = ps.executeQuery();
				Person p = new Person();
				while (rs.next()) {
					p.setId(rs.getString("id"));
					p.setP0_name(rs.getString("p0_name"));
					p.setP0_uid(rs.getString("p0_uid"));
					p.setP0_state(rs.getString("p0_state"));
					p.setP1_idcNo(rs.getString("p1_idcNo"));
					p.setP1_name(rs.getString("p1_name"));
					p.setTelNo(rs.getString("telNo"));
					p.setOh_id(rs.getString("oh_id"));
					p.setChoose_state(rs.getInt("choose_state"));
					p.setChoose1_result(rs.getString("choose1_result"));
					p.setChoose2_result(rs.getString("choose2_result"));
					p.setNh_id(rs.getString("nh_id"));
					p.setRemark(rs.getString("remark"));
					System.out.println(p.toString());
				}
				
				//防止刷新重复抽签
				if (p.getChoose_state() == 1 || p.getChoose_state() == 2
						|| ("1").equals(p.getChoose_state())
						|| ("2").equals(p.getChoose_state())) {
					System.out.println("防止刷新重复抽签启动");
				} else {
					System.out.println("开始抽签");
					// 开始抽签（如果未抽签）
					List<String> list = new LinkedList<String>();
					sql = "select id from tb_1stChoose where isSelected = 0";
					ps = conn.prepareStatement(sql);
					rs = ps.executeQuery();
					while (rs.next()) {
						list.add(rs.getInt("id") + "");
					}
					// 计算列表大小
					int size = list.size();
					System.out.println("size:" + size);
					// 随机产生大于0小于等于size的数r
					Random rm = new Random();
					int r = rm.nextInt(size) + 1;
					System.out.println("random:" + r);
					// 读取list中第r个数据的值，即为所选值
					String selected = list.get(r - 1);
					System.out.println("第一轮抽签select id:" + selected);

					// 更新数据表tb_person信息
					String update = "update tb_person set choose_state = ?, choose1_result = ? where id = ?";
					ps = conn.prepareStatement(update);
					ps.setInt(1, 1);
					ps.setString(2, selected);
					ps.setString(3, kw);
					int result = ps.executeUpdate();
					System.out.println("更新tb_person信息结果：" + ps.toString() + " "
							+ result);

					// 查询tb_1stChoose表中select_seq最大值
					sql = "select max(c.select_seq) as 'seq' from tb_1stChoose c";
					ps = conn.prepareStatement(sql);
					rs = ps.executeQuery();
					int seq = 0;
					while (rs.next()) {
						seq = Integer.parseInt(rs.getString("seq")) + 1;
						System.out.println("seq:" + seq);
					}

					// 更新tb_1stChoose表信息
					update = "update tb_1stChoose c set c.isSelected = ?, c.person_id=?, c.p0_name=?, c.select_seq=?, c.select_time=? where c.id=? ";
					ps = conn.prepareStatement(update);
					ps.setInt(1, 1);
					ps.setString(2, p.getId());
					ps.setString(3, p.getP0_name());
					ps.setString(4, seq + "");
					ps.setString(5, ct);
					ps.setString(6, selected);
					result = ps.executeUpdate();
					System.out.println("更新tb_1stChoose信息结果：" + ps.toString()
							+ " " + result);
				}

				JdbcUtil.closeAll(rs, ps, conn);
				request.setAttribute("p", p);

				System.out.println("********第一轮抽签结束********");
				/*
				 * 
				 * 第一轮抽签结束
				 * 
				 */
			} else if (method.equals("choose") || method == "choose") {
				/*
				 * 
				 * 抽选新房屋开始(第二轮抽签)
				 */
				HttpSession session = request.getSession();
				String kw = (String) session.getAttribute("kw");
				System.out.println("第二轮抽签kw:" + kw);
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

				JdbcUtil.closeAll(rs, ps, conn);
				request.setAttribute("nh", nh);
				/*
				 * 
				 * 抽选新房屋结束
				 */

			} else if (method.equals("listNh") || method == "listNh") {
				/*
				 * 
				 * 列出全部已选新房信息开始
				 */
				path = "listNewHouse.jsp";
				NewHouseDao nhd = new NewHouseDaoImpl();
				List<NewHouse> nhs = nhd.getAllNewHouses();
				request.setAttribute("nhs", nhs);
				request.setAttribute("method", method);
				/*
				 * 
				 * 列出全部已选新房信息结束
				 */
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
}