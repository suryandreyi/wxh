package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.DBUtil;
@WebServlet("/index_do")
public class Index extends HttpServlet{
	//建立连接
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DBUtil.getSess();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}