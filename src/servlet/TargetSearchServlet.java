package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import net.sf.json.JSONObject;
import targettest.SearchProcess;

@WebServlet("/targetSearch_do")
public class TargetSearchServlet extends HttpServlet{
	private static Logger logger = Logger.getLogger(Test.class);
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String key = req.getParameter("key");
		String tab = req.getParameter("tab");
		String path = req.getParameter("filepath");
		String taskName = req.getParameter("taskname");
		String resultpath = req.getParameter("resultpath");
		String consistent = req.getParameter("consistent");
		String searchSumnum = req.getParameter("insertSumnum");
		String type = req.getParameter("type");
		String resultNum = req.getParameter("resultNum").replaceAll("/", "").replace("条", "");

	
		System.out.println(key);
		System.out.println(tab);
		logger.info(key+"==="+tab+"==="+path+"==="+resultpath+"==="+taskName+"==="+resultNum+"==="+consistent+"==="+type+"==="+searchSumnum);  

		SearchProcess sp = new SearchProcess(key,tab,searchSumnum,consistent,path,resultpath,taskName,type,resultNum);
		int code = sp.work();
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("resultCode", code);
		PrintWriter out = null;
		out = resp.getWriter();
		out.write(jsonObj.toString()); 
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
