package targettest;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.datastax.driver.core.BatchStatement;
import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Session;

import utils.DBUtil;
import utils.DBUtil2;
import utils.DBUtil_ALL;
import utils.DBUtil_ONE;

import com.datastax.driver.core.BatchStatement.Type;
import com.datastax.driver.core.ColumnDefinitions.Definition;

import servlet.Test;

public class BatchInsert{
	private static Logger logger = Logger.getLogger(Test.class);  
	@SuppressWarnings("finally")
	public int insert1(String key, String tab, String path, String resultPath,String insertSumnum,String resultNum,String taskName) {
		Session session = DBUtil_ALL.getSess();
		int rn = Integer.parseInt(resultNum);

		List<String> columnsList = new ArrayList<String>();
		Map<String, String> columntype = new HashMap<String, String>();

		// 根据key和tab查询列

		String cql2 = "select * from " + key + "." + tab + ";";
		logger.info("cql2:"+cql2);  
		System.out.println("cql2:"+cql2);
		ResultSet rs2 = session.execute(cql2);
		for (Definition definition : rs2.getColumnDefinitions()) {
			columnsList.add(definition.getName());
			columntype.put(definition.getName(), definition.getType().toString());
		}
		int num = columnsList.size();
		logger.info("num:"+num);  
		System.out.println("num:"+num);

		// 开始拼接插入的数据
		String cql = "insert into " + key + "." + tab + "(";

		for (String name : columnsList) {
			cql = cql + name + ",";
		}

		cql = cql.substring(0, cql.lastIndexOf(","));
		cql = cql + ")values(";

		for (String name : columnsList) {
			cql = cql + "?,";
		}

		cql = cql.substring(0, cql.lastIndexOf(","));
		cql = cql + ");";
		logger.info("cql:"+cql);  
		System.out.println("cql:"+cql);
		
		PreparedStatement statement = session.prepare(cql);
		BatchStatement batchStatement = new BatchStatement(Type.UNLOGGED);
		BoundStatement boundStmt = new BoundStatement(statement);

		BufferedReader br = null;
		String temp = null;
		long stratTime = 0;
		long endTime = 0;
		int i = 0;
		int j = 0;
		try {
			br = new BufferedReader(new FileReader(new File(path)));
			stratTime = System.currentTimeMillis();
			while ((temp = br.readLine()) != null) {
				String[] s = temp.split("\\s+");
				try {
					if (j > rn) {
						endTime = System.currentTimeMillis();
						String tm = String.valueOf(endTime - stratTime);
						String cqltime = "insert into "+key+".result (taskName,tm) values('"+taskName+"','"+tm+"');";						
						logger.info("cqtime:"+cqltime);  
						System.out.println("cqtime:"+cqltime);
						session.execute(cqltime);
						WriteData.writetoFile(resultPath, tm + "\r\n");
						logger.info("time:---------------------"+ tm); 
						System.out.println("time:---------------------"+ tm);
						j = 0;
						stratTime = System.currentTimeMillis();
					}
					if (i >= 100) {
						session.execute(batchStatement);
						batchStatement.clear();
						i = 0;
					}

					Object[] colobj = new Object[num];
					for (int k = 0; k < num; k++) {
						colobj[k] = s[k];
					}
					boundStmt = statement.bind(s);
					batchStatement.add(boundStmt);
					i++;
					j++;
					logger.info("i:"+i); 
					System.out.println("i:"+i);
					logger.info("j:"+j); 
					System.out.println("j:"+j);
				} catch (Exception e) {
					logger.error("error:"+s[0] + "---" + s[1] + "---" + s[2]); 
					System.out.println("error:"+s[0] + "---" + s[1] + "---" + s[2]);
					continue;
				}
			}
			session.execute(batchStatement);
			batchStatement.clear();
			br.close();
			session.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			DBUtil_ALL.close();
			return 200;
		}
	}
	
	@SuppressWarnings("finally")
	public int insert4(String key, String tab, String path, String resultPath,String insertSumnum,String resultNum,String taskName,String consistent) {
		if(consistent.equals("单机索引")) {
			return 404;
		}
		Session session = DBUtil_ALL.getSess();
		int rn = Integer.parseInt(resultNum);

		List<String> columnsList = new ArrayList<String>();
		Map<String, String> columntype = new HashMap<String, String>();

		// 根据key和tab查询列
		String cql2 = "select * from " + key + "." + tab + ";";
		logger.info("cql2:"+cql2); 
		System.out.println("cql2:"+cql2);
		ResultSet rs2 = session.execute(cql2);
		for (Definition definition : rs2.getColumnDefinitions()) {
			columnsList.add(definition.getName());
			columntype.put(definition.getName(), definition.getType().toString());
		}
		int num = columnsList.size();
		logger.info("num:"+num); 
		System.out.println("num:"+num);

		// 开始拼接插入的数据
		String cql = "insert into " + key + "." + tab + "(";

		for (String name : columnsList) {
			cql = cql + name + ",";
		}

		cql = cql.substring(0, cql.lastIndexOf(","));
		cql = cql + ")values(";

		for (String name : columnsList) {
			cql = cql + "?,";
		}

		cql = cql.substring(0, cql.lastIndexOf(","));
		cql = cql + ");";
		
		logger.info("cql:"+cql);
		System.out.println("cql:"+cql);
		
		PreparedStatement statement = session.prepare(cql);
		BatchStatement batchStatement = new BatchStatement(Type.UNLOGGED);
		BoundStatement boundStmt = new BoundStatement(statement);

		BufferedReader br = null;
		String temp = null;
		long stratTime = 0;
		long endTime = 0;
		int i = 0;
		int j = 0;
		try {
			br = new BufferedReader(new FileReader(new File(path)));
			stratTime = System.currentTimeMillis();
			while ((temp = br.readLine()) != null) {
				String[] s = temp.split("\\s+");
				try {
					if (j > rn) {
						endTime = System.currentTimeMillis();
						String tm = String.valueOf(endTime - stratTime);
						String cqltime = "insert into "+key+".result (taskName,tm) values('"+taskName+"','"+tm+"');";						
						logger.info("cqtime:"+cqltime);
						System.out.println("cqtime:"+cqltime);
						session.execute(cqltime);
						WriteData.writetoFile(resultPath, tm + "\r\n");
						logger.info("time:---------------------"+ tm);
						System.out.println("time:---------------------"+ tm);
						j = 0;
						stratTime = System.currentTimeMillis();
					}
					if (i >= 100) {
						session.execute(batchStatement);
						batchStatement.clear();
						i = 0;
					}

					Object[] colobj = new Object[num];
					for (int k = 0; k < num; k++) {
						colobj[k] = s[k];
					}
					boundStmt = statement.bind(s);
					batchStatement.add(boundStmt);
					i++;
					j++;
				} catch (Exception e) {
					DBUtil.close();
					logger.error("error:"+s[0] + "---" + s[1] + "---" + s[2]);
					System.out.println("error:"+s[0] + "---" + s[1] + "---" + s[2]);
					continue;
				}
			}
			session.execute(batchStatement);
			batchStatement.clear();
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
		}finally {			
			DBUtil_ALL.close();
			return 200;
		}
	}
	
	
	
	@SuppressWarnings("finally")
	public int insert5(String key, String tab, String path, String resultPath,String insertSumnum,String resultNum,String taskName) {
		Session session = DBUtil_ALL.getSess();
		int rn = Integer.parseInt(resultNum);

		List<String> columnsList = new ArrayList<String>();
		Map<String, String> columntype = new HashMap<String, String>();

		// 根据key和tab查询列
		String cql2 = "select * from " + key + "." + tab + ";";
		logger.info("cql2:"+cql2);
		System.out.println("cql2:"+cql2);
		ResultSet rs2 = session.execute(cql2);
		for (Definition definition : rs2.getColumnDefinitions()) {
			columnsList.add(definition.getName());
			columntype.put(definition.getName(), definition.getType().toString());
		}
		int num = columnsList.size();
		logger.info("num:"+num);
		System.out.println("num:"+num);

		// 开始拼接插入的数据
		String cql = "insert into " + key + "." + tab + "(";

		for (String name : columnsList) {
			cql = cql + name + ",";
		}

		cql = cql.substring(0, cql.lastIndexOf(","));
		cql = cql + ")values(";

		for (String name : columnsList) {
			cql = cql + "?,";
		}

		cql = cql.substring(0, cql.lastIndexOf(","));
		cql = cql + ");";
		logger.info("cql:"+cql);
		System.out.println("cql:"+cql);
		
		PreparedStatement statement = session.prepare(cql);
		BatchStatement batchStatement = new BatchStatement(Type.UNLOGGED);
		BoundStatement boundStmt = new BoundStatement(statement);

		BufferedReader br = null;
		String temp = null;
		long stratTime = 0;
		long endTime = 0;
		int i = 0;
		int j = 0;
		try {
			br = new BufferedReader(new FileReader(new File(path)));
			stratTime = System.currentTimeMillis();
			while ((temp = br.readLine()) != null) {
				String[] s = temp.split("\\s+");
				try {
					if (j > rn) {
						endTime = System.currentTimeMillis();
						String tm = String.valueOf(endTime - stratTime);
						String cqltime = "insert into "+key+".result (taskName,tm) values('"+taskName+"','"+tm+"');";						
						logger.info("cqtime:"+cqltime);
						System.out.println("cqtime:"+cqltime);
						session.execute(cqltime);
						WriteData.writetoFile(resultPath, tm + "\r\n");
						logger.info("time:---------------------"+ tm);
						System.out.println("time:---------------------"+ tm);
						j = 0;
						stratTime = System.currentTimeMillis();
					}
					if (i >= 100) {
						session.execute(batchStatement);
						batchStatement.clear();
						i = 0;
					}

					Object[] colobj = new Object[num];
					for (int k = 0; k < num; k++) {
						colobj[k] = s[k];
					}
					boundStmt = statement.bind(s);
					batchStatement.add(boundStmt);
					i++;
					j++;
				} catch (Exception e) {
					DBUtil.close();
					logger.error("error:"+s[0] + "---" + s[1] + "---" + s[2]);
					System.out.println("error:"+s[0] + "---" + s[1] + "---" + s[2]);
					continue;
				}
			}
			session.execute(batchStatement);
			batchStatement.clear();
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {			
			DBUtil_ALL.close();
			return 200;
		}
	}
	
	
	@SuppressWarnings("finally")
	public int insert8(String key, String tab, String path, String resultPath,String insertSumnum,String resultNum,String taskName,String block) {
		Session session = DBUtil_ONE.getSess();
		int rn = Integer.parseInt(resultNum);

		List<String> columnsList = new ArrayList<String>();
		Map<String, String> columntype = new HashMap<String, String>();

		// 根据key和tab查询列
		String cql2 = "select * from " + key + "." + tab + ";";
		logger.info("cql2:"+cql2);
		System.out.println("cql2:"+cql2);
		ResultSet rs2 = session.execute(cql2);
		for (Definition definition : rs2.getColumnDefinitions()) {
			columnsList.add(definition.getName());
			columntype.put(definition.getName(), definition.getType().toString());
		}
		int num = columnsList.size();
		logger.info("num:"+num);
		System.out.println("num:"+num);

		// 开始拼接插入的数据
		String cql = "insert into " + key + "." + tab + "(";

		for (String name : columnsList) {
			cql = cql + name + ",";
		}

		cql = cql.substring(0, cql.lastIndexOf(","));
		cql = cql + ")values(";

		for (String name : columnsList) {
			cql = cql + "?,";
		}

		cql = cql.substring(0, cql.lastIndexOf(","));
		cql = cql + ");";
		logger.info("cql:"+cql);
		System.out.println("cql:"+cql);
		
		PreparedStatement statement = session.prepare(cql);
		BatchStatement batchStatement = new BatchStatement(Type.UNLOGGED);
		BoundStatement boundStmt = new BoundStatement(statement);


		String temp = null;
		long stratTime = 0;
		long endTime = 0;
		int i = 0;
		int j = 0;
		
		
		
		
		int count = 0;
		int curSize = 0;
		int blockSize = Integer.parseInt(block);
		
		long size=blockSize*(1024*1024);
		
		
		try {
			RandomAccessFile br = new RandomAccessFile(path,"rw");
			stratTime = System.currentTimeMillis();
			String line=null;
			
	        while((line=br.readLine())!=null)
	        {
	        	if(curSize>=size) {
	        		logger.info(count);
	        		System.out.println(count);
	        		Long startTs = System.currentTimeMillis();
	        		
	        		String cqltime = "insert into "+key+".ct (taskName,num,size,intime) values('"+taskName+"','"+count+"','"+curSize+"',"+startTs+");";						
					session.execute(cqltime);
	        		
	        		curSize=0;
	        		count=0;
	        		continue;
	        	}
	        	curSize = curSize+line.length();
	        	count++;
	        	logger.info(count);
	        	System.out.println(count);
	        	
	        	String[] s = new String(line.getBytes("ISO-8859-1"), "utf-8").split("\\s+");
	        	try {
					if (i >= 100) {
						session.execute(batchStatement);
						batchStatement.clear();
						i = 0;
					}

					Object[] colobj = new Object[num];
					for (int k = 0; k < num; k++) {
						colobj[k] = s[k];
					}
					boundStmt = statement.bind(s);
					batchStatement.add(boundStmt);
					i++;
					j++;
				} catch (Exception e) {
					DBUtil.close();
					logger.error("error:"+s[0] + "---" + s[1] + "---" + s[2]);
					System.out.println("error:"+s[0] + "---" + s[1] + "---" + s[2]);
					continue;
				}
	            
	        }		
	        
	        Long startTs = System.currentTimeMillis();		
    		String cqltime = "insert into "+key+".ct (taskName,num,size,intime) values('"+taskName+"','"+count+"','"+curSize+"',"+startTs+");";	
			session.execute(batchStatement);
			session.execute(cqltime);
			batchStatement.clear();
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {			
			DBUtil_ONE.close();
			return 200;
		}
			
	}
	

	
	
	
	public int insert(String key, String tab, String path, String resultPath,String insertSumnum,String resultNum,String taskName,String type,String consistent,String block) {
		if(type.equals("test1")||type.equals("test2")) {
			return insert1(key, tab, path, resultPath,insertSumnum,resultNum,taskName);
		}else if(type.equals("test2")) {
			return insert1(key, tab, path, resultPath,insertSumnum,resultNum,taskName);
		}else if(type.equals("test4")) {
			return insert4(key, tab, path, resultPath,insertSumnum,resultNum,taskName,consistent);
		}else if(type.equals("test5")) {
			return insert5(key, tab, path, resultPath,insertSumnum,resultNum,taskName);
		}else if(type.equals("test8")) {
			return insert8(key, tab, path, resultPath,insertSumnum,resultNum,taskName,block);
		}
		else {
			return 500;			
		}
	}
}
