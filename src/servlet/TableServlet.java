package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

@WebServlet("/table_do")
public class TableServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		String keyspace = req.getParameter("keyspace");
		
		Session session = DBUtil.getSess();
		
		
		String cql = "select * from system_schema.tables where keyspace_name='"+keyspace+"';";
		System.out.println(cql);
		ResultSet rs =  session.execute(cql);
		List<Row> listRow = rs.all();
		System.out.println(listRow.size());
		JSONObject jsonObj = new JSONObject();
		Map <String, String> tables = new HashMap <String, String>();
		
		int i = 0;
		for (Row row : listRow) {
			String commnet = row.getString("comment");
			System.out.println(commnet);
			
	    	String pattern = "TableInfo.*COMMENT.*\"(.*)\"";
		    Pattern r = Pattern.compile(pattern);
		    Matcher m = r.matcher(commnet);
		    if(m.find()) {
		    	System.out.println("匹配："+m.group(1));
		    }

			tables.put(m.group(1),row.getString("table_name"));
			i++;
		}
		
		jsonObj.put(keyspace, tables);
		
		//跳转到keyspace
		PrintWriter out = null;
		System.out.println(jsonObj.toString());
		out = resp.getWriter();
		out.write(jsonObj.toString()); 
		DBUtil.close();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
