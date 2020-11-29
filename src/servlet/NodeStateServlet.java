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

@WebServlet("/nodestate_do")
public class NodeStateServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//连接集群
		//查询数据
		//显示
		Session session = DBUtil.getSess();
		
		if(req.getParameter("stop")!=null){
			String cql = "UPDATE system_basic.nodestate SET state=0 where ip='"+req.getParameter("stop")+"';";
			System.out.println(cql);
			JSONObject jsonObj = new JSONObject();
			try {
				ResultSet rs =  session.execute(cql);
				DBUtil.close();
				jsonObj.put("resultCode", 200);
				PrintWriter out = null;
				out = resp.getWriter();
				out.write(jsonObj.toString()); 
				return;
			}catch(Exception e){
				DBUtil.close();
				jsonObj.put("resultCode", 404);
				PrintWriter out = null;
				out = resp.getWriter();
				out.write(jsonObj.toString()); 
				return;
			}
		};
		if(req.getParameter("start")!=null) {
			String cql = "UPDATE system_basic.nodestate SET state=1 where ip='"+req.getParameter("start")+"';";
			System.out.println(cql);
			JSONObject jsonObj = new JSONObject();
			try {
				ResultSet rs =  session.execute(cql);
				DBUtil.close();
				jsonObj.put("resultCode", 200);
				PrintWriter out = null;
				out = resp.getWriter();
				out.write(jsonObj.toString()); 
				return;
			}catch(Exception e){
				DBUtil.close();
				jsonObj.put("resultCode", 404);
				PrintWriter out = null;
				out = resp.getWriter();
				out.write(jsonObj.toString());
				return;
			}
		};
		
		
		
		String cql = "select * from system_basic.nodestate;";
		System.out.println(cql);
		ResultSet rs =  session.execute(cql);
		List<Row> listRow = rs.all();
		JSONObject jsonObj = new JSONObject();
		Map <String, String> nodeinfos = new HashMap <String, String>();
		
		for (Row row : listRow) {
			nodeinfos.put("ip", row.getString("ip"));
			nodeinfos.put("state", String.valueOf(row.getInt("state")));
			nodeinfos.put("safe", String.valueOf(row.getInt("safestate")));
			jsonObj.put(row.getString("ip"), nodeinfos);
		}
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
