package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Session;

import net.sf.json.JSONObject;
import utils.DBUtil;

@WebServlet("/workData_do")
public class DeleteServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		String type = req.getParameter("type");
		JSONObject jsonObj = new JSONObject();
		if(type.equals("search")) {
			jsonObj.put("dz", "searchData");
		}
		
		PrintWriter out = null;
		out = resp.getWriter();
		out.write(jsonObj.toString()); 
		System.out.println("777");
		
		
		
//		String key = req.getParameter("key");
//		String tabName = req.getParameter("tab");
//		
//		
//		String cql = "";
//		
//		Session session = DBUtil.getSess();
//		ResultSet rs =  session.execute(cql);
//
//		req.setAttribute("info","success");
//		req.getRequestDispatcher("insertTab.jsp").forward(req,resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
