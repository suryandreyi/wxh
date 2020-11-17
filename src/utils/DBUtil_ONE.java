package utils;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.ConsistencyLevel;
import com.datastax.driver.core.HostDistance;
import com.datastax.driver.core.PoolingOptions;
import com.datastax.driver.core.QueryOptions;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.SocketOptions;
import com.datastax.driver.core.policies.LoadBalancingPolicy;
import com.datastax.driver.core.policies.RoundRobinPolicy;

public class DBUtil_ONE {
	 public static Cluster cluster;
	    public static Session session;
	    public static Session getSess() {
	    	PoolingOptions poolingOptions = new PoolingOptions();
//	    	poolingOptions.setMaxSimultaneousRequestsPerConnectionThreshold(HostDistance.LOCAL, 32);
	    	poolingOptions.setCoreConnectionsPerHost(HostDistance.LOCAL, 1);
	    	poolingOptions.setMaxConnectionsPerHost(HostDistance.LOCAL, 6);
	    	
	    	
	    	
	    	SocketOptions options = new SocketOptions();
			options.setConnectTimeoutMillis(3000000);
			options.setReadTimeoutMillis(30000000);
			
			QueryOptions op = new QueryOptions();  
	        op.setConsistencyLevel(ConsistencyLevel.LOCAL_ONE); 
			LoadBalancingPolicy loadBalancingPolicy = new RoundRobinPolicy();
			cluster = Cluster.builder().addContactPoint("159.226.41.232").withPort(10056)
					.withPoolingOptions(poolingOptions).withSocketOptions(options).withQueryOptions(op).build();
	        session = cluster.connect();  
	        return session;
	    }
	    public static void close() {
	        cluster.close();
	        session.close();
	    }

}
