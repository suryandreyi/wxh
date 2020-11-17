package servlet;

import java.io.RandomAccessFile;


public class Test2 {
	public static void main(String[] args) throws Exception {
		int block = 1;
		int size = block*1024*1024;
		int num = 0;
		int curSize = 0;
		
        RandomAccessFile rf = new RandomAccessFile("D:\\ceshishuju\\r6.txt", "r");
        
        RandomAccessFile out = new RandomAccessFile("D:\\ceshishuju\\r7.txt", "rw");

        String line=null;
        while((line=rf.readLine())!=null)
        {
        	if(curSize>=size) {
        		System.out.println(num);
        		curSize=0;
        		num=0;
        		continue;
        	}
        	curSize = curSize+line.length();
            System.out.println(new String(line.getBytes("ISO-8859-1"), "utf-8"));
            out.write(line.getBytes()); 
        }
        
        out.close();
        rf.close();
	}

}
