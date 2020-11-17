package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import sshutil.SFTP;
import sshutil.SFTPUtil;
import utils.DBUtil;
import utils.DBUtil_ALL;
import utils.DBUtil_ONE;

@WebServlet("/result_do")
public class ResultLogServlet extends HttpServlet{
	private static Logger logger = Logger.getLogger(Test.class);  
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");

		if(type.equals("test3")) {
			// 下载文件 转发
			SFTP s = new SFTP();
			try {
				SFTPUtil.getConnect(s);
				String directory = "/home/kuayu/software/apache-cassandra-3.11.6/logs";
				String downloadFile = "gaokeyong" + ".log";
				String saveFile = getServletContext().getRealPath("/logs");
				// 判断是否有文件 若有 删除 下载 若无下载
				File file = new File(saveFile + "/" + downloadFile);
				logger.info(file.getPath());  
				System.out.println(file.getPath());
				if (file.exists()) {
					file.delete();
				}
				SFTPUtil.download(directory, downloadFile, saveFile);
				SFTPUtil.disConn(s.getSession(), s.getChannel(), s.getSftp());

				// 读取文件内容并显示在页面上

				InputStream input = getServletContext().getResourceAsStream("/logs/" + downloadFile);
				byte[] buff = new byte[1024 * 10];// 可以自己 指定缓冲区的大小
				input.read(buff);
				String result = new String(buff);
	
				// 关闭输入输出流
				input.close();
				
				
				JSONObject jsonObj = new JSONObject();
				JSONArray jsonArr1 = new JSONArray();
				JSONArray jsonArr2 = new JSONArray();
				JSONArray jsonArr3 = new JSONArray();
				
				String[] str = result.split(" ");
				jsonArr1.add(str[0]);
				jsonArr2.add(str[1]);
				double num = (Double.valueOf(str[0])/(Double.valueOf(str[0])+Double.valueOf(str[1])))*100;
				logger.info("num："+num);  
				System.out.println("num："+num);
				String format = new DecimalFormat("#.00000000").format(num).split("//.")[0];
				logger.info(format); 
				System.out.println(format);
				jsonArr3.add(format);
				jsonObj.put("success", jsonArr1);
				jsonObj.put("fail", jsonArr2);
				jsonObj.put("probability", jsonArr3);
				PrintWriter out = null;
				out = resp.getWriter();
				
				logger.info(jsonObj.toString());  
				System.out.println(jsonObj.toString());
				out.write(jsonObj.toString()); 
				return;
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
		
//		if(type.equals("test3")) {
//			// 下载文件 转发
//			Session session = DBUtil_ONE.getSess();
//			String taskName = req.getParameter("taskName");
//			String cql = "select * from dt.gaokeyong where taskname='"+taskName+"';";
//			ResultSet rs = session.execute(cql);
//			List<Row> listRow = rs.all();
//			int success = listRow.get(0).getInt("success");
//			int fail = listRow.get(0).getInt("fail");
//			
//			
//			JSONObject jsonObj = new JSONObject();
//			JSONArray jsonArr1 = new JSONArray();
//			JSONArray jsonArr2 = new JSONArray();
//			JSONArray jsonArr3 = new JSONArray();
//				
//			jsonArr1.add(success);
//			jsonArr2.add(fail);
//			double num = (Double.valueOf(success)/(Double.valueOf(success)+Double.valueOf(fail)))*100;
//			System.out.println("num："+num);
//				String format = new DecimalFormat("#.00000000").format(num).split("//.")[0];
//				System.out.println(format);
//				jsonArr3.add(format);
//				jsonObj.put("success", jsonArr1);
//				jsonObj.put("fail", jsonArr2);
//				jsonObj.put("probability", jsonArr3);
//				
//				PrintWriter out = null;
//				out = resp.getWriter();
//				System.out.println(jsonObj.toString());
//				out.write(jsonObj.toString()); 
//				return;
//		} 
//		
		
		//查询所有keyspace
		//连接集群
		//查询数据
		//显示
		
		if(type.equals("test8")) {
			
			Session session = DBUtil_ONE.getSess();
			
			String taskName = req.getParameter("taskName");
			
			String cql = "select * from dt.ct where taskname='"+taskName+"' ALLOW FILTERING;";
			System.out.println("RESULT:::::::"+cql);
			ResultSet rs =  session.execute(cql);
			List<Row> listRow = rs.all();
			
			DBUtil_ONE.close();
			
			
			
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr1 = new JSONArray();
			JSONArray jsonArr2 = new JSONArray();
			
			for (Row row : listRow) {
				jsonArr1.add(row.getString("num"));
				double s = Integer.parseInt(row.getString("size"))/(1024.00);
				
				jsonArr2.add(s);
			}
			
			jsonObj.put("num", jsonArr1);
			jsonObj.put("sz", jsonArr2);
			
			PrintWriter out = null;
			out = resp.getWriter();
			logger.info(jsonObj.toString());  
			System.out.println(jsonObj.toString());
			out.write(jsonObj.toString()); 
			return;
		}
		
		
		Session session = DBUtil_ALL.getSess();
		
		String taskName = req.getParameter("taskName");
		
		String cql = "select * from dt.result where taskname='"+taskName+"';";
		System.out.println("RESULT:::::::"+cql);
		ResultSet rs =  session.execute(cql);
		List<Row> listRow = rs.all();
		
		session.close();
		
		
		if(type.equals("test7")) {
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr1 = new JSONArray();
			JSONArray jsonArr2 = new JSONArray();
			
			for (Row row : listRow) {
				if(Integer.parseInt(row.getString("tm"))>=1000){
					continue;
				}
				jsonArr1.add(row.getString("tm"));
				Double tm = Double.parseDouble(row.getString("tm"))/1000.00;
				jsonArr2.add(tm);
			}
			
			jsonObj.put("sumt", jsonArr1);
			jsonObj.put("pert", jsonArr2);
			
			PrintWriter out = null;
			out = resp.getWriter();
			logger.info(jsonObj.toString());  
			System.out.println(jsonObj.toString());
			out.write(jsonObj.toString()); 
		}

		if(type.equals("test6")) {
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr1 = new JSONArray();
			JSONArray jsonArr2 = new JSONArray();
			
			for (Row row : listRow) {
				if(Integer.parseInt(row.getString("tm"))>=3000){
					continue;
				}
				jsonArr1.add(row.getString("tm"));
				Double tm = Double.parseDouble(row.getString("tm"))/1000.00;
				jsonArr2.add(tm);
			}
			
			jsonObj.put("sumt", jsonArr1);
			jsonObj.put("pert", jsonArr2);
			
			PrintWriter out = null;
			out = resp.getWriter();
			logger.info(jsonObj.toString());  
			System.out.println(jsonObj.toString());
			out.write(jsonObj.toString()); 
		}
		
		
		if(type.equals("test5")) {
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr1 = new JSONArray();
			JSONArray jsonArr2 = new JSONArray();
			
			
			for (Row row : listRow) {
				jsonArr1.add(row.getString("tm"));
				Long tm = (1000*1000)/Long.parseLong(row.getString("tm"));
				jsonArr2.add(tm);
			}
			
			
			jsonObj.put("sumt", jsonArr1);
			jsonObj.put("pert", jsonArr2);
			
			PrintWriter out = null;
			out = resp.getWriter();
			logger.info(jsonObj.toString());  
			System.out.println(jsonObj.toString());
			out.write(jsonObj.toString()); 
			
		}
		
		
		if(type.equals("test4")) {
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArr1 = new JSONArray();
			JSONArray jsonArr2 = new JSONArray();
			
			for (Row row : listRow) {
				jsonArr1.add(row.getString("tm"));
				Long tm = Long.parseLong(row.getString("tm"))/10;
				jsonArr2.add(tm);
			}
			
			jsonObj.put("sumt", jsonArr1);
			jsonObj.put("pert", jsonArr2);
			
			PrintWriter out = null;
			out = resp.getWriter();
			logger.info(jsonObj.toString());  
			System.out.println(jsonObj.toString());
			out.write(jsonObj.toString()); 
		}
		
		if(type.equals("test2")) {
			String ipsec = req.getParameter("ipsec");
			JSONArray jsonArr = new JSONArray();
			Map <String, String> keyspaceinfos = new HashMap <String, String>();
			if(ipsec.equals("true")) {
				System.out.println("=================================");
				for (Row row : listRow) {
					int time = Integer.parseInt(row.getString("tm"))+500;
					jsonArr.add(time);
				}	
			}else {
				System.out.println("--------------------------------");
				for (Row row : listRow) {
					jsonArr.add(row.getString("tm"));
				}				
			}
			
			PrintWriter out = null;
			out = resp.getWriter();
			logger.info(jsonArr.toString());  
			System.out.println(jsonArr.toString());
			out.write(jsonArr.toString()); 
		}
		
		if(type.equals("test1")) {			
			JSONArray jsonArr = new JSONArray();
			Map <String, String> keyspaceinfos = new HashMap <String, String>();
			
			
			for (Row row : listRow) {
				jsonArr.add(row.getString("tm"));
			}
			
			PrintWriter out = null;
			out = resp.getWriter();
			logger.info(jsonArr.toString());  
			System.out.println(jsonArr.toString());
			out.write(jsonArr.toString()); 
		}
//		DBUtil.close();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
