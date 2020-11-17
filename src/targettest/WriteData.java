package targettest;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class WriteData {
	
	public static void writetoFile(String path,String data) {
        BufferedWriter out;
        try {
        	out = new BufferedWriter(new FileWriter(path,true));
			out.write(data);
			out.close();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	

}
