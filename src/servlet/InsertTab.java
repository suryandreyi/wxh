package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Session;

import utils.DBUtil;

@WebServlet("/insertTab_do")
public class InsertTab extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		System.out.println(6666);
		String tabName = req.getParameter("tab");
		System.out.println(tabName);
		int prinum = Integer.valueOf(req.getParameter("prinum"));
		int nornum = Integer.valueOf(req.getParameter("nornum"));
		System.out.println("prinum"+prinum);
		System.out.println("nornum"+nornum);
		String key = req.getParameter("key");
		String s1 = req.getParameter("norkey"+nornum);
		String s2 = req.getParameter("type_norkey"+nornum);
		String cql = "CREATE TABLE "+key+"."+tabName+"(";
		for(int i=1;i<=prinum;i++) {
			cql = cql+req.getParameter("prikey"+i)+" "+req.getParameter("type_prikey"+i)+",";
			System.out.println("cql1:"+cql);
		}
		for(int i=1;i<=nornum;i++) {
			cql = cql+req.getParameter("norkey"+i)+" "+req.getParameter("type_norkey"+i)+",";
			System.out.println("cql2:"+cql);
		}
		cql = cql + "primary key(";
		for(int i=1;i<=prinum;i++) {
			cql = cql+req.getParameter("prikey"+i)+",";
		}
		cql = cql.substring(0,cql.lastIndexOf(","));
		cql = cql + "));";		
		//插入
		System.out.println(cql);
		
		Session session = DBUtil.getSess();
		ResultSet rs =  session.execute(cql);

		req.setAttribute("info","success");
		req.getRequestDispatcher("insertTab.jsp").forward(req,resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
