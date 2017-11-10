package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.bean.OldHouse;
import com.dao.OldHouseDao;
import com.dao.OldHouseDaoImpl;

public class AjaxServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String kw = URLDecoder.decode(request.getParameter("kw"), "utf-8");
		System.out.println("kw:" + kw);
		OldHouseDao ohd = new OldHouseDaoImpl();
		List<OldHouse> ohs = ohd.getOldHousesByKw(kw);
		//将List转化为JSON
        JSONArray json=JSONArray.fromObject(ohs);
        System.out.println(json.toString());
        //写入到前台
        response.getWriter().write(json.toString());
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
