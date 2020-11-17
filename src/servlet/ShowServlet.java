package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

@WebServlet("/show_do")
public class ShowServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		JSONObject jsonObj = new JSONObject();
		Map <String, String> nodeinfos = new HashMap <String, String>();
		nodeinfos.put("ip", "3kg");
		nodeinfos.put("data_center", "1kg");
		nodeinfos.put("rack", "2.4kg");
		System.out.println("999");
//		req.getRequestDispatcher("jsp/show.jsp").forward(req,resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
