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

@WebServlet("/select_do")
public class SelectServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//连接集群
		//查询数据
		//显示
		Session session = DBUtil.getSess();
		
		String cql = "select * from system.peers;";
		ResultSet rs =  session.execute(cql);
		List<Row> listRow = rs.all();
		JSONObject jsonObj = new JSONObject();
		Map <String, String> nodeinfos = new HashMap <String, String>();
		
		for (Row row : listRow) {
			nodeinfos.put("ip", row.getInet("peer").toString());
			nodeinfos.put("data_center", row.getString("data_center"));
			nodeinfos.put("rack", row.getString("rack"));
			jsonObj.put(row.getInet("peer").toString(), nodeinfos);
		}
		
		String cql2 = "select * from system.local;";
		ResultSet rs2 =  session.execute(cql2);
		Row localRow = rs2.one();
		nodeinfos.put("ip", localRow.getInet("broadcast_address").toString());
		nodeinfos.put("data_center", localRow.getString("data_center"));
		nodeinfos.put("rack", localRow.getString("rack"));
		jsonObj.put(localRow.getInet("broadcast_address").toString(), nodeinfos);
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
