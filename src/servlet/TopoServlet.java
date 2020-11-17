package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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

@WebServlet("/topo_do")
public class TopoServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
				//连接集群
				//查询数据
				//显示
				Session session = DBUtil.getSess();
				
				String cql = "select * from system.peers;";
				ResultSet rs =  session.execute(cql);
				List<Row> listRow = rs.all();
				JSONObject jsonObj = new JSONObject();
				
				int size = listRow.size()+1;
				//key dc   value[node1,node2]
				//node: {key1:value1,key2:value2}
				Map<String,List<Map<String,String>>> alldata = new HashMap<>();
				
				for (Row row : listRow) {
					Map<String,String> m = new HashMap<String,String>();
					String data_center = row.getString("data_center");
					String ip = row.getInet("peer").toString().replace("/", "");
					String addr = GetIpUtil.getAddr(ip);
					String rack = row.getString("rack");
					String host_id = row.getUUID("host_id").toString();
					
					m.put("data_center", data_center);
					m.put("ip", ip);
					m.put("addr", addr);
					m.put("rack", rack);
					m.put("host_id", host_id);
					
					List<Map<String,String>> nodearr;
					
					if(alldata.containsKey(data_center)) {
						nodearr = alldata.get(data_center);
					}else {
						nodearr = new ArrayList<>();
					}
					nodearr.add(m);
					alldata.put(data_center,nodearr);
				}
				
				
				
				String cql2 = "select * from system.local;";
				ResultSet rs2 =  session.execute(cql2);
				Row localRow = rs2.one();
				
				
				Map<String,String> m = new HashMap<String,String>();
				String data_center = localRow.getString("data_center");
				String ip = localRow.getInet("broadcast_address").toString().replace("/", "");
				String addr = GetIpUtil.getAddr(ip);
				String rack = localRow.getString("rack");
				String host_id = localRow.getUUID("host_id").toString();
				
				m.put("data_center", data_center);
				m.put("ip", ip);
				m.put("addr", addr);
				m.put("rack", rack);
				m.put("host_id", host_id);
				
				List<Map<String,String>> nodearr;
				
				if(alldata.containsKey(data_center)) {
					nodearr = alldata.get(data_center);
				}else {
					nodearr = new ArrayList<>();
				}
				nodearr.add(m);
				alldata.put(data_center,nodearr);
				
	
				int dcnum = alldata.size();
				
				Map []nodearrayMap = new Map[size+dcnum+1];
				Map []edgearrayMap = new Map[size+dcnum];
				
				int i = 1;
				int j = 0;
				
				Map<String, String> nodeMap = new HashMap<String, String>();
				nodeMap.put("id", "client");
				nodeMap.put("label", "client");
				nodearrayMap[0] = nodeMap;
				
				
				Iterator<Entry<String,List<Map<String,String>>>> entries = alldata.entrySet().iterator();
				while(entries.hasNext()){
				    Entry<String,List<Map<String,String>>> entry = entries.next();
				    String key = entry.getKey();
				    nodearrayMap[i] = new HashMap<String, String>();
				    edgearrayMap[j] = new HashMap<String, String>();
				    
			    	nodearrayMap[i].put("id", key);
			    	nodearrayMap[i].put("label", key);
			    	
			    	edgearrayMap[j].put("source", "client");
			    	edgearrayMap[j].put("target",  key);
				    
			    	i++;
			    	j++;
					List<Map<String,String>> nodes = entry.getValue();
				    for (Map<String, String> map : nodes) {
				    	nodearrayMap[i] = new HashMap<String, String>();
				    	edgearrayMap[j] = new HashMap<String, String>();
				    	
				    	nodearrayMap[i].put("id", map.get("ip"));
				    	nodearrayMap[i].put("label", map.get("ip"));
				    	
				    	edgearrayMap[j].put("source", key);
				    	edgearrayMap[j].put("target", map.get("ip"));
				    	
				    	i++;
				    	j++;
					}
				}

				
				jsonObj.put("nodes", nodearrayMap);
				jsonObj.put("edges", edgearrayMap);
				
				System.out.println(jsonObj.toString());
				
				
				DBUtil.close();
				
				PrintWriter out = null;
				out = resp.getWriter();
				out.write(jsonObj.toString()); 
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
