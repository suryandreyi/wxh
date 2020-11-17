package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;

import net.sf.json.JSONObject;
import utils.DBUtil;

@WebServlet("/insertKey_do")
public class InsertKey extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		Map<String,String[]> map = req.getParameterMap();
		for (Map.Entry<String, String[]> m : map.entrySet()) {
			String name = m.getKey();
            String[] values = m.getValue();
		}
		System.out.println(req.getParameter("input3"));
		Session session = DBUtil.getSess();
		
		String cql = "CREATE KEYSPACE "+req.getParameter("input1")+" WITH replication = {'class': 'NetworkTopologyStrategy','dc1': '1','dc2': '1','dc3': '1'};";
		System.out.println(cql);
		ResultSet rs =  session.execute(cql);
		

		DBUtil.close();	
		
		req.setAttribute("info","success");
		
		req.getRequestDispatcher("insertKey.jsp").forward(req,resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
