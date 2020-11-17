package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import targettest.BatchInsert;

@WebServlet("/test5_do")
public class Test5 extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{   
		req.setCharacterEncoding("utf-8");
		String key = req.getParameter("key");
		String tab = req.getParameter("tab");
		String path = req.getParameter("filepath");
		String taskName = req.getParameter("taskname");
		String resultpath = req.getParameter("resultpath");
		String insertSumnum = req.getParameter("insertSumnum");
		String resultNum = req.getParameter("resultNum").replaceAll("/", "").replace("条", "");
		String type = (String)req.getAttribute("type");
		System.out.println(type);
		System.out.println(key);
		System.out.println(tab);
		System.out.println(path);
		System.out.println(resultpath);
		System.out.println(insertSumnum);
		System.out.println(resultNum);
		
//		BatchInsert bt = new BatchInsert();
//		bt.insert(key,tab,path,resultpath,insertSumnum,resultNum,taskName);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
