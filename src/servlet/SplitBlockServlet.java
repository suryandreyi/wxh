package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import targettest.Imagedeal;

@WebServlet("/split_do")
public class SplitBlockServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{   		
		req.setCharacterEncoding("utf-8");
		String block = req.getParameter("block").replace("MB", "").replace("KB", "");
		String key = req.getParameter("key");
		String tab = req.getParameter("tab");
		String path = req.getParameter("filepath");
		String taskName = req.getParameter("taskname");
		String resultpath = req.getParameter("resultpath");
		String insertSumnum = req.getParameter("insertSumnum");
		String resultNum = req.getParameter("resultNum").replaceAll("/", "").replace("条", "");
		System.out.println(key);
		System.out.println(tab);
		System.out.println(path);
		System.out.println(resultpath);
		System.out.println(insertSumnum);
		System.out.println(resultNum);
		System.out.println(block);
		String type = (String)req.getParameter("type");
		System.out.println(type);
		
		String task = req.getParameter("task");
		Imagedeal it = new Imagedeal();			
		if(task.equals("split")) {
			it.insert(key,tab,block,path,taskName,type);
		}else if(task.endsWith("obtain")){
			it.obtain(key,tab,block,path,resultpath,taskName,type);	
		}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
