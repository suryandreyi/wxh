package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
import utils.GetIpUtil;

@WebServlet("/shnodet_do")
public class ShowNodeDetail extends HttpServlet{
	//建立连接
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		
		
		Session session = DBUtil.getSess();
		JSONObject jsonObj = new JSONObject();
		String ip = req.getParameter("nodeip");
		System.out.println("ip:"+ip);
		String cql = "select * from system.peers where peer='"+ip+"' ALLOW FILTERING;";
		Row row =  session.execute(cql).one();
		String data_center = row.getString("data_center");
		String addr = GetIpUtil.getAddr(ip);
		System.out.println("addr:"+addr);
		String rack = row.getString("rack");
		String host_id = row.getUUID("host_id").toString();
		Map<String,String> m = new HashMap<String,String>();
		m.put("data_center", data_center);
		m.put("nodeip", ip);
		m.put("addr", addr);
		m.put("rack", rack);
		m.put("host_id", host_id);
		jsonObj.put(ip, m);

		DBUtil.close();
		PrintWriter out = null;
		System.out.println(jsonObj.toString());
		out = resp.getWriter();
		out.write(jsonObj.toString()); 
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
