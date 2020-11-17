package targettest;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.utils.Bytes;

import utils.DBUtil;
import utils.ImageUtil;

public class Imagedeal{
	
	public void insert(String key,String tab,String block,String path,String taskName,String type) {
		Session session = DBUtil.getSess();
		
		int blockSize=Integer.valueOf(block)*1024*1024;
		
		FileInputStream fis;
		try {
			fis = new FileInputStream(path);
			byte[] b= new byte[fis.available()+1];
			byte[][] ba = ImageUtil.splitBytes(b, blockSize);
			System.out.println(ba.length);
			for (int i = 0; i < ba.length; i++) {
				byte[] cs = ba[i];
				fis.read(cs);	
				ByteBuffer buffer =ByteBuffer.wrap(cs);
				String cql = "insert into "+key+"."+tab+" (taskName,blockid,image) values(?,?,?)";
				System.out.println(cql);
				PreparedStatement ps = session.prepare(cql);
				BoundStatement boundStatement = new BoundStatement(ps);
				session.execute(boundStatement.bind(taskName,i+1,buffer));
			}
			System.out.println("insert end");
			DBUtil.close();
		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	
	public void obtain(String key,String tab,String block,String path,String resultPath,String taskName,String type){
		Session session = DBUtil.getSess();
		int blockSize=Integer.valueOf(block)*1024*1024;
		String cql = "select taskName,blockid,image from "+key+"."+tab+" where taskName =? ALLOW FILTERING";
		PreparedStatement ps = session.prepare(cql);
		BoundStatement boundStatement = new BoundStatement(ps);
		ResultSet rs =session.execute (boundStatement.bind(taskName));
		
		
		ByteBuffer bImage=null;
		int blockNum = 0;
		Map<Integer,ByteBuffer> blockMap = new HashMap<Integer,ByteBuffer>();
		for (Row row : rs) {
			bImage = row.getBytes("image");
			blockNum = row.getInt("blockid");
			blockMap.put(blockNum, bImage);
		}
		
		byte image[]= new byte[blockSize];
		
		OutputStream out;
		try {
			out = new FileOutputStream(resultPath,true);
			InputStream is = null;
			for (Map.Entry<Integer, ByteBuffer> entry : blockMap.entrySet()) {
				int i = entry.getKey();
				image = Bytes.getArray(entry.getValue());
				System.out.println("blockid:"+i);
				is = new ByteArrayInputStream(image);
				BufferedInputStream input = new BufferedInputStream(is);
				byte[] buffer = new byte[blockSize];
				for (int length = 0; (length = input.read(buffer)) > 0;) {
					out.write(buffer, 0, length);
				}
			}
			out.close();
			System.out.println("downend-------");
		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
