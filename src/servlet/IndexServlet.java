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

@WebServlet("/crindex_do")
public class IndexServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String keyspace = req.getParameter("key");
		String table = req.getParameter("tab");
		String index = req.getParameter("idx");
		String col = req.getParameter("col");
		System.out.println(keyspace);
		System.out.println(table);
		System.out.println(index);
		System.out.println(col);
		
		
		JSONObject jsonObj = new JSONObject();
		Session session = DBUtil.getSess();
		
		
		
		String cql="CREATE INDEX "+index+" ON "+keyspace+"."+table+"("+col+");";
		System.out.println(cql);
		ResultSet rs =  session.execute(cql);	
		
		DBUtil.close();
		PrintWriter out = null;
		out = resp.getWriter();
		out.write(jsonObj.toString()); 
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
