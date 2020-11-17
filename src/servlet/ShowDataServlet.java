package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.datastax.driver.core.ColumnDefinitions.Definition;
import com.datastax.driver.core.DataType;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;

import net.sf.json.JSONObject;
import utils.DBUtil;

@WebServlet("/showdata_do")
public class ShowDataServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String keyspace = req.getParameter("keyspace");
		String table = req.getParameter("table");
		
		Session session = DBUtil.getSess();
		
		JSONObject jsonObj = new JSONObject();
		//获取列
//		String cql1 = "select * from system_schema.columns where keyspace_name='"+keyspace+"' and table_name='"+table+"';";
//		System.out.println(cql1);
//		ResultSet rs =  session.execute(cql1);
//		List<Row> listRow = rs.all();
//		Map <String, String> columns = new HashMap <String, String>();
		List<String> columnsList = new ArrayList<String>();
		Map <String, String> columntype = new HashMap <String, String>();
//		int i = 0;
//		for (Row row : listRow) {
//			columnsList.add(row.getString("column_name"));
//			columns.put(String.valueOf(i),row.getString("column_name"));
//			i++;
//		}
	
		
//		System.out.println(jsonObj.toString());
//		jsonObj.put("column", columns);	
		//获取数据
		String cql2 = "select * from "+keyspace+"."+table+";";
		System.out.println(cql2);
		ResultSet rs2 =  session.execute(cql2);
		
		for (Definition definition : rs2.getColumnDefinitions())
		{
		   columnsList.add(definition.getName());
		   columntype.put(definition.getName(),definition.getType().toString());
		}
		
		List<Row> listRow2 = rs2.all();
		Map <String, List <String>> rowdatas = new HashMap <String, List<String>>();
		
		int j = 0;
		for (Row row : listRow2) {
			List <String> rowdata = new ArrayList <String>();
			for (String column : columnsList) {
				//判断col类型
				if(columntype.get(column).equals("varchar")) {
					rowdata.add(row.getString(column));
				}
				if(columntype.get(column).equals("text")) {
					rowdata.add(row.getString(column));
				}
				if(columntype.get(column).equals("boolean")) {
					rowdata.add(String.valueOf(row.getBool(column)));
				}		
				
				if(columntype.get(column).equals("ascii")) {
					rowdata.add(String.valueOf(row.getString(column)));
				}
				if(columntype.get(column).equals("bigint")) {
					rowdata.add(String.valueOf(row.getLong(column)));
				}
				if(columntype.get(column).equals("blob")) {
					rowdata.add(String.valueOf(row.getByte(column)));
				}
				if(columntype.get(column).equals("counter")) {
					rowdata.add(String.valueOf(row.getLong(column)));
				}
				if(columntype.get(column).equals("decimal")) {
					rowdata.add(String.valueOf(row.getDecimal(column)));
				}
				if(columntype.get(column).equals("boolean")) {
					rowdata.add(String.valueOf(row.getBool(column)));
				}
				if(columntype.get(column).equals("float")) {
					rowdata.add(String.valueOf(row.getFloat(column)));
				}
				if(columntype.get(column).equals("inet")) {
					rowdata.add(String.valueOf(row.getInet(column)));
				}
				if(columntype.get(column).equals("timestamp")) {
					rowdata.add(String.valueOf(row.getDate(column)));
				}
				if(columntype.get(column).equals("uuid")) {
					rowdata.add(String.valueOf(row.getUUID(column)));
				}
				if(columntype.get(column).equals("timeuuid")) {
					rowdata.add(String.valueOf(row.getUUID(column)));
				}
				if(columntype.get(column).equals("varint")) {
					rowdata.add(String.valueOf(row.getInt(column)));
				}
				
				if(columntype.get(column).equals("int")) {
					rowdata.add(String.valueOf(row.getInt(column)));
				}
	        }
			rowdatas.put(String.valueOf(j), rowdata);
			j++;
		}
		
		jsonObj.put("rowdatas", rowdatas);
		jsonObj.put("columns", columnsList);
		System.out.println("-------------");
		System.out.println(jsonObj.toString());
		
		//跳转到keyspace
		PrintWriter out = null;
		out = resp.getWriter();
		out.write(jsonObj.toString()); 
		DBUtil.close();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
