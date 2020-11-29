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

@WebServlet("/keyspace_do")
public class KeySpaceServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		//查询所有keyspace
		//连接集群
		//查询数据
		//显示
		Session session = DBUtil.getSess();
		
		//获取所有描述信息
		String infocql = "select * from dt.keyinfo;";
		ResultSet infors =  session.execute(infocql);
		List<Row> infolistRow = infors.all();
		Map <String, String> infos = new HashMap <String, String>();
		for (Row row : infolistRow) {
			infos.put(row.getString("keyspaceName"), row.getString("info"));
		}
		
		
		String cql = "select * from system_schema.keyspaces;";
		ResultSet rs =  session.execute(cql);
		List<Row> listRow = rs.all();
		JSONObject jsonObj = new JSONObject();
		JSONObject jsonObj1 = new JSONObject();
		JSONObject jsonObj2 = new JSONObject();
		Map <String, String> keyspaceinfos = new HashMap <String, String>();
		
		
		for (Row row : listRow) {
			keyspaceinfos.put("name", row.getString("keyspace_name"));
			jsonObj1.put(row.getString("keyspace_name"), keyspaceinfos);
			String kif = infos.get(row.getString("keyspace_name"));
			if(kif==null) {
				kif="";
			}
			System.out.println(kif);
			jsonObj2.put(row.getString("keyspace_name"), kif);
		}
		
		PrintWriter out = null;
		out = resp.getWriter();
		jsonObj.put("keyname", jsonObj1);
		jsonObj.put("keyinfo", jsonObj2);
		out.write(jsonObj.toString()); 
		DBUtil.close();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
