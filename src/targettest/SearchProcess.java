package targettest;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CountDownLatch;

import org.apache.log4j.Logger;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;

import servlet.Test;
import utils.DBUtil;
import utils.DBUtil_ALL;
import utils.DBUtil_ONE;

public class SearchProcess {
	private static Logger logger = Logger.getLogger(Test.class); 
	static String readAppointedLineNumber(File sourceFile, int lineNumber) throws IOException {
        FileReader in = new FileReader(sourceFile);
        LineNumberReader reader = new LineNumberReader(in);
        String s = reader.readLine();
         
        if (lineNumber < 0 || lineNumber > getTotalLines(sourceFile)) {
            System.out.println("不在文件的行数范围之内。");
        }
 
        {
        while (s != null) {
        	if(reader.getLineNumber()==lineNumber) {	
        		reader.close();
        		in.close();
        		return s;
        	}
            s = reader.readLine();
        }
        }
		reader.close();
		in.close();
        return "";
	}
	
    static int getTotalLines(File file) throws IOException {
        FileReader in = new FileReader(file);
        LineNumberReader reader = new LineNumberReader(in);
        String s = reader.readLine();
        int lines = 0;
        while (s != null) {
            lines++;
            s = reader.readLine();
        }
        reader.close();
        in.close();
        return lines;
    }
	
	String keyspace;
	String table;
	String itemsum;
	String consistent;
	String type;
	String path;
	String taskName;
	String resultPath;
	String resultcollect;
	public SearchProcess(String keyspace, String table, String itemsum,String consistent, String path, String resultPath,
			String taskName,String type,String resultcollect) {
		super();
		this.keyspace = keyspace;
		this.table = table;
		this.itemsum = itemsum;
		this.consistent = consistent;
		this.path = path;
		this.resultPath = resultPath;
		this.taskName = taskName;
		this.type = type;
		this.resultcollect = resultcollect;
	}
	
	
	
	@SuppressWarnings("finally")
	public int work(){

		//从文件夹抽取数据
		logger.info(path);
		System.out.println(path);
		int sumitem = Integer.parseInt(itemsum);
		int itemper = Integer.parseInt(resultcollect);
		int esum = sumitem/itemper;
		
		Session session = null;
		if(type.equals("test6")) {
			session = DBUtil_ALL.getSess();					
		}else if(type.equals("test7")) {
			session = DBUtil_ONE.getSess();
		}else if(type.equals("test4")) {
			session = DBUtil_ONE.getSess();
		}
//			else if(type.equals("test3")) {
//			session = DBUtil_ONE.getSess();
//			work3(session);
//		}
//		
        for (int e = 0; e < esum; e++) {
			try {					
				Random random = new Random();
				String[] searcrdata = new String[10];
				File sourceFile = new File(path);
				// 获取文件的内容的总行数 
				int totalNo = getTotalLines(sourceFile); 			
				for (int i = 0; i < 10; i++) {
					// 指定读取的行号 
					int lineNumber = random.nextInt(totalNo)+1;        	
					// 读取指定的行 
					String s = readAppointedLineNumber(sourceFile, lineNumber);
					//将userid invitetime sequence截取 存入容器
					searcrdata[i] = s;
				}
				
				//从数据库查询 记录查询时间
				
				long stratTime = 0;
				long endTime = 0;
				int num=10;
				 
				
//				CountDownLatch latch=new CountDownLatch(5);				
//				Runnable myRunnable = new MyThread(session,num,latch,keyspace,table,seracrdata);
//				Thread thread1 = new Thread(myRunnable, "A");
//				Thread thread2 = new Thread(myRunnable, "B");
//				Thread thread3 = new Thread(myRunnable, "C");
//				Thread thread4 = new Thread(myRunnable, "D");
//				Thread thread5 = new Thread(myRunnable, "E");
//
				stratTime = System.currentTimeMillis();
//				
//				
//		        thread1.start();
//		        thread2.start();
//		        thread3.start();
//		        thread4.start();
//		        thread5.start();
//				
//		        latch.await();
//				
					
				for (int i = 0; i < 10; i++) {
					String[] s = searcrdata[i].split("\\s+");
					String cql = "select * from "+keyspace+"."+table+" where id='"+s[0]+"' and time='"+s[1]+"' and word='"+s[2]+"' and rank='"+s[3]+"' and touch='"+s[4]+"' and web='"+s[5]+"' ALLOW FILTERING;";
					logger.info(i+"search:::::"+cql);
					System.out.println(i+"search:::::"+cql);
					session.execute(cql);
					i++;
				}
				endTime = System.currentTimeMillis();
				
				String tm = String.valueOf(endTime - stratTime);
				String cqltime = "insert into "+keyspace+".result (taskName,tm) values('"+taskName+"','"+tm+"');";						
				logger.info("cqtime:"+cqltime);
				System.out.println("cqtime:"+cqltime);
				session.execute(cqltime);
				WriteData.writetoFile(resultPath, tm + "\r\n");
				logger.info("time:---------------------"+ tm);
				System.out.println("time:---------------------"+ tm);
	
			}catch (Exception e1) {
				System.out.println(e1);
				continue;
			}
		}
        session.close();
        return 200;
	}
	
//	public void work3(Session session) {
//		while(true) {
//			try {
//				System.out.println("11111");
//				Thread.sleep(3000);
//				System.out.println("22222");
//
//				int success = row.getInt("success");
//				int fail = 0;	
//				String cql1 = "select * from dt.gaokeyong where taskname='"+taskName+"';";
//				ResultSet rs1 = session.execute(cql1);
//				List<Row> listRow = rs1.all();
//				for (Row row : listRow) {
//					int success = row.getInt("success");
//					int fail = row.getInt("fail");					
//				}
//				
//				Random random = new Random();
//				File sourceFile = new File(path);
//				int totalNo = getTotalLines(sourceFile); 			
//				int lineNumber = random.nextInt(totalNo)+1;  
//				String str = readAppointedLineNumber(sourceFile, lineNumber);
//				String[] s = str.split("\\s+");
//				String cql = "select * from "+keyspace+"."+table+" where id='"+s[0]+"' and time='"+s[1]+"' and word='"+s[2]+"' and rank='"+s[3]+"' and touch='"+s[4]+"' and web='"+s[5]+"' ALLOW FILTERING;";
//				ResultSet rs = session.execute(cql);
//				if(rs.isExhausted()) {
//					success = success+1;
//					String cqls = "update dt.gaokeyong set success="+success+" where taskName='"+taskName+"';";
//					session.execute(cqls);
//				}else{
//					fail = fail+1;
//					String cqlf = "update dt.gaokeyong set fail="+fail+" where taskName='"+taskName+"';";
//					session.execute(cqlf);
//				}		
//			} catch (InterruptedException e) {
//				// TODO 自动生成的 catch 块
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO 自动生成的 catch 块
//				e.printStackTrace();
//			}
//		}
	}

