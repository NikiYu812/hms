package com.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Choose1;
import com.bean.NewHouse;
import com.bean.OldHouse;
import com.bean.Person;
import com.dao.Choose1Dao;
import com.dao.Choose1DaoImpl;
import com.dao.NewHouseDao;
import com.dao.NewHouseDaoImpl;
import com.dao.OldHouseDao;
import com.dao.OldHouseDaoImpl;
import com.dao.PersonDao;
import com.dao.PersonDaoImpl;
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

		if (method.equals("list") || method == "list") {
			/*
			 * 
			 * 查询全部旧房屋列表
			 */
			System.out.println("********查询全部旧房屋列表开始********");
			path = "listOldHouse.jsp";
			OldHouseDao ohd = new OldHouseDaoImpl();
			List<OldHouse> ohs = ohd.getAllOldHouses();
			request.setAttribute("ss", ohs);
			System.out.println("********查询全部旧房屋列表结束********");
			/*
			 * 
			 * 查询全部旧房屋信息结束
			 */
			/*
			 * 
			 * 查询房屋信息开始 按关键字查询旧房信息（房号，原承租人姓名，原承租人职工号，协议签署人身份号）
			 */
		} else if (method.equals("find") || method == "find") {
			System.out.println("********查询信息开始********");

			path = "searchResult.jsp";

			String choose = request.getParameter("choose");
			System.out.println("choose:" + choose);

			String kw = request.getParameter("kw");
			System.out.println("kw:" + kw);

			OldHouseDao ohd = new OldHouseDaoImpl();
			List<OldHouse> ohs = ohd.getOldHousesByKw(kw);

			request.setAttribute("ss", ohs);
			request.setAttribute("kw", kw);
			request.setAttribute("choose", choose);

			System.out.println("********查询信息结束********");
			/*
			 * 
			 * 查询房屋信息结束
			 */
		} else if (method.equals("choose1") || method == "choose1") {
			/*
			 * 
			 * 第一轮抽签开始
			 */
			System.out.println("********第一轮抽签开始********");
			HttpSession session = request.getSession();
			String person_id = (String) session.getAttribute("person_id");
			System.out.println("第一轮抽签person_id:" + person_id);
			path = "chooseResult.jsp";

			OldHouseDao ohd = new OldHouseDaoImpl();
			PersonDao pd = new PersonDaoImpl();

			// 根据id查询出person信息，写入p中
			List<OldHouse> ohs = ohd.getOldHousesByPerson_id(person_id);
			Person p = ohs.get(0).getPerson();

			// 防止刷新重复抽签
			if (p.getChoose_state() == 1 || p.getChoose_state() == 2
					|| ("1").equals(p.getChoose_state())
					|| ("2").equals(p.getChoose_state())) {
				System.out.println("防止刷新重复抽签启动");
			} else {
				System.out.println("开始抽签");
				// 读取未被抽取的数字列表
				Choose1Dao cd = new Choose1DaoImpl();
				List<String> list = cd.getUnSelectedIds();
				/* 在列表中随机抽选一个数 */
				// 计算列表大小
				int size = list.size();
				System.out.println("size:" + size);

				if (size > 0) {
					// 随机产生大于0小于等于size的数r
					Random rm = new Random();
					int r = rm.nextInt(size) + 1;
					System.out.println("random:" + r);
					// 读取list中第r个数据的值，即为所选值
					String selected = list.get(r - 1);
					System.out.println("第一轮抽签select id:" + selected);

					// 查询tb_choose1表中select_seq最大值并+1
					String select_seq = cd.getMaxSelect_seq();

					// 更新数据表tb_person信息
					Choose1 c = new Choose1();
					c = cd.getChoose1ById(selected);
					c.setIsSelected(1);
					c.setPerson_id(person_id);
					c.setP0_name(p.getP0_name());
					c.setSelect_seq(select_seq);
					c.setSelect_time(ct);

					p.setChoose_state(1);
					p.setChoose1_result(selected);
					p.setChoose1(c);
					pd.updatePerson_choose(p);

					for (OldHouse oh : ohs) {
						oh.setPerson(p);
					}
				} else {
					path = "error.jsp";
					System.out.println("size<=0");
				}

			}

			request.setAttribute("ohs", ohs);

			System.out.println("********第一轮抽签结束********");
			/*
			 * 
			 * 第一轮抽签结束
			 */
		} else if (method.equals("choose2") || method == "choose2") {
			/*
			 * 
			 * 第二轮抽签开始
			 */
			System.out.println("********第二轮抽签开始********");
			HttpSession session = request.getSession();
			String person_id = (String) session.getAttribute("person_id");
			System.out.println("第二轮抽签person_id:" + person_id);

			int building_type = Integer.parseInt(request
					.getParameter("building_type")); // 抽选的房源类型
			System.out.println("building_type:" + building_type);

			path = "chooseResult.jsp";

			OldHouseDao ohd = new OldHouseDaoImpl();
			PersonDao pd = new PersonDaoImpl();
			NewHouseDao nhd = new NewHouseDaoImpl();

			// 根据id查询出person信息，写入p中
			List<OldHouse> ohs = ohd.getOldHousesByPerson_id(person_id);
			Person p = ohs.get(0).getPerson();

			// 防止刷新页面重复抽签
			if (p.getChoose_state() == 2 || ("2").equals(p.getChoose_state())) {
				// 如果已经抽过签，显示抽签新房源信息
				System.out.println("防止刷新重复抽签启动");
			} else {

				// 开始抽签（如果未抽签）
				System.out.println("开始抽签");
				// 读取数据库中可用的房源形成列表
				List<String> list = nhd.getUnSelectedChooseIds(building_type);
				/* 在列表中随机抽选一个数 */
				// 计算列表大小
				int size = list.size();
				System.out.println("size:" + size);
				if (size > 0) {
					// 随机产生大于0小于等于size的数r
					Random rm = new Random();
					int r = rm.nextInt(size) + 1;
					// 读取list(r)的值
					String selected = list.get(r - 1);
					System.out.println("第二轮抽签select id:" + selected);

					// 查询tb_choose1表中select_seq最大值并+1
					String select_seq = nhd.getMaxSelect_seq();

					// 更新数据表tb_person信息
					NewHouse nh = new NewHouse();
					nh = nhd.getNewHouseByChoose_id(selected);
					nh.setIsSelected(1);
					nh.setPerson_id(person_id);
					nh.setP0_name(p.getP0_name());
					nh.setSelect_seq(select_seq);
					nh.setSelect_time(ct);

					p.setChoose_state(2);
					p.setChoose2_result(selected);
					p.setNh_id(nh.getId());
					p.setNewHouse(nh);
					pd.updatePerson_choose(p);

				} else {
					path = "error.jsp";
					System.out.println("size<=0");
				}
			}

			request.setAttribute("ohs", ohs);
			System.out.println("********第二轮抽签结束********");
			/*
			 * 
			 * 第二轮抽签结束
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

		// 跳转到显示页面
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}