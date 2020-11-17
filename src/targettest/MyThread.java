package targettest;

import java.util.concurrent.CountDownLatch;

import com.datastax.driver.core.Session;

import utils.DBUtil;

public class MyThread implements Runnable{
	int i = 0;
	int num;
	Session session;
	CountDownLatch latch=new CountDownLatch(5);
	String keyspace;
	String table;
	String[] searchdata;

	public MyThread(Session session,int num,CountDownLatch latch,String keyspace,String table,String[] searchdata) {
		this.session = session;
		this.num = num;
		this.session = DBUtil.session;
		this.latch = latch;
		this.searchdata = searchdata;
		this.keyspace = keyspace;
		this.table = table;
	}
	@Override
	public void run() {
	       while(true){
	    	   try {
	    		   synchronized(MyThread.class){
	    			   if(i<num){
	    				   String[] s = searchdata[i].split("\\s+");
	    				   String cql = "select * from "+keyspace+"."+table+" where id='"+s[0]+"' and time='"+s[1]+"' and word='"+s[2]+"' and rank='"+s[3]+"' and touch='"+s[4]+"' and web='"+s[5]+"' ALLOW FILTERING;";
	    				   System.out.println(i+"search:::::"+cql);
	    				   session.execute(cql);
	    				   i++;
	    			   }
	    			   else {
	    				   latch.countDown();
	    				   System.out.println("end==========");
	    				   break;
	    			   }	    		   
	    		   	}
	    		}catch (Exception e) {
	    			System.out.println(e);
	    			continue;
	    		}
	    	   }
	       }
	

}
