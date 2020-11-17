package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/insert_do")
public class InsertServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String type = req.getParameter("type");
		if(type.equals("keyspace")) {
			req.getRequestDispatcher("insertKey.jsp").forward(req,resp);
		}else if(type.equals("table")) {
			req.getRequestDispatcher("insertTab.jsp").forward(req,resp);
		}else {
			req.getRequestDispatcher("insertData.jsp").forward(req,resp);
		}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
