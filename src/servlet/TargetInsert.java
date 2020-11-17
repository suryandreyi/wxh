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
import targettest.BatchInsert;

@WebServlet("/targetInsert_do")
public class TargetInsert extends HttpServlet{
	private static Logger logger = Logger.getLogger(Test.class);
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{   
		req.setCharacterEncoding("utf-8");
		String key = req.getParameter("key");
		String tab = req.getParameter("tab");
		String path = req.getParameter("filepath");
		String taskName = req.getParameter("taskname");
		String resultpath = req.getParameter("resultpath");
		String insertSumnum = req.getParameter("insertSumnum");
		String consistent = req.getParameter("consistent");
		String resultNum = req.getParameter("resultNum").replaceAll("/", "").replace("条", "");
		String type = (String)req.getParameter("type");
		String block = "";
		if(type.equals("test8")) {
			block=req.getParameter("block").replaceAll("M", "");			
		}
		
		logger.info(key+"==="+tab+"==="+path+"==="+resultpath+"==="+insertSumnum+"==="+resultNum+"==="+consistent+"==="+type+"==="+block);  
		System.out.println(key);
		System.out.println(tab);
		System.out.println(path);
		System.out.println(resultpath);
		System.out.println(insertSumnum);
		System.out.println(resultNum);
		System.out.println(consistent);
		System.out.println(type);
		System.out.println(block);
		
		BatchInsert bt = new BatchInsert();
		int code = bt.insert(key,tab,path,resultpath,insertSumnum,resultNum,taskName,type,consistent,block);
		
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
