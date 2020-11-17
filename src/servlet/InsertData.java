package servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.InetAddress;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Session;
import com.google.common.base.Ascii;
import com.datastax.driver.core.ColumnDefinitions.Definition;

import net.sf.json.JSONArray;
import utils.DBUtil;
@WebServlet("/insertdata_do")
public class InsertData extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		String keyspace = req.getParameter("keyspace");
		String table = req.getParameter("table");
		Session session = DBUtil.getSess();
		
		//获得列
		List<String> columnsList = new ArrayList<String>();
		Map <String, String> columntype = new HashMap <String, String>();
		
		String cql2 = "select * from "+keyspace+"."+table+";";
		ResultSet rs2 =  session.execute(cql2);
		for (Definition definition : rs2.getColumnDefinitions())
		{
		   columnsList.add(definition.getName());
		   columntype.put(definition.getName(),definition.getType().toString());
		}
		
		
		
		String columnss = req.getParameter("strjson2");
		String datas = req.getParameter("strjson1");
		JSONArray arr1 = JSONArray.fromObject(columnss);
		JSONArray arr2 = JSONArray.fromObject(datas);
		
		System.out.println(arr2);
		
//		String cql = "insert(";
//
//		for(Object obj:arr1){
//			cql = cql+obj+",";
//		}
//		
//		cql = cql.substring(0,cql.lastIndexOf(","));
//		
//		
//		cql = cql+")values(";
//		for(Object obj:arr2){
//			cql = cql +obj+",";
//		}
//		
//		cql = cql.substring(0,cql.lastIndexOf(","));
//		cql = cql+");";
		
		
		String cql = "insert into "+keyspace+"."+table+"(";
		
		
		for(String name:columnsList){
		cql = cql+name+",";
		}
		cql = cql.substring(0,cql.lastIndexOf(","));
		
		cql = cql+")values(";
		
		System.out.println("cql1:"+cql);
		
		for(int i=0;i<columnsList.size();i++) {
			String name = columnsList.get(i);
			String type = columntype.get(name);
			Object obj = arr2.get(i);
			Object resobj = null;
			
			if(type.equals("varchar")) {
				resobj = obj.toString();
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("text")) {
				resobj = obj.toString();
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("boolean")) {
				resobj = (Boolean)obj;
				cql = cql +"'"+resobj+"'"+",";
			}		
			
			if(type.equals("ascii")) {
				resobj = (Ascii)obj;
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("bigint")) {
				resobj = Integer.parseInt((String)obj);
				cql = cql +resobj+",";
			}
			if(type.equals("blob")) {
				resobj = (ByteBuffer)obj;
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("counter")) {
				resobj = (Long)obj;
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("decimal")) {
				resobj = (BigDecimal)obj;
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("float")) {
				resobj = (Float)obj;
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("inet")) {
				resobj = (InetAddress)obj;
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("timestamp")) {
				resobj = (Date)obj;
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("uuid")) {
				resobj = (UUID)obj;
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("timeuuid")) {
				resobj = (UUID)obj;
				cql = cql +"'"+resobj+"'"+",";
			}
			if(type.equals("varint")) {
				resobj = (String)obj;
				cql = cql +"'"+resobj+"'"+",";
			}
			
			if(type.equals("int")) {
				resobj = Integer.parseInt((String)obj);
				cql = cql +resobj+",";
			}
		}
		cql = cql.substring(0,cql.lastIndexOf(","));
		cql = cql+");";
		
		System.out.println("cql2:"+cql);
		ResultSet rs =  session.execute(cql);
		DBUtil.close();	
		
		req.setAttribute("info","success");
		req.getRequestDispatcher("insertData.jsp").forward(req,resp);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
