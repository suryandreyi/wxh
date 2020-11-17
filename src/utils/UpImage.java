package utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpImage {
	
	public static String saveImage(HttpServletRequest req, HttpServletResponse resp,String savePath) {
	    String fileSeperator = File.separator;
		String imagePath = "";
		try {
			//若没有文件夹 创建
			File dicFile = new File(savePath);
			if(!dicFile.exists()){ 
				dicFile.mkdirs();  
            }
		
            // 获取客户端传过来图片的二进制流             
            InputStream stream = req.getInputStream();
            // 以当前时间戳为图片命名             
            SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
            String strCurrentTime = df.format(new Date());
            //最终文件存储位置
            imagePath = savePath +"\\"+ strCurrentTime + ".png";
            System.out.println(imagePath);
            // 这里的文件格式可以自行修改，如.jpg
            FileOutputStream fos = new FileOutputStream(imagePath);
            byte[] bbuf = new byte[32];
            int hasRead = 0;
            while ((hasRead = stream.read(bbuf)) > 0) {
                fos.write(bbuf, 0, hasRead);
                // 将文件写入服务器的硬盘上
            }
            fos.close();
            stream.close();
            /*
             * 但是需要注意，采用这种原始的方式写入文件时，你会发现被写入的文件内容前4行并非是读取文件的真正内容，            
             * 从第四行开始才是正文数据。第二行是文件路径以及名称。所以通常的做法是，先将文件写入临时文件中，然后
             * 再采用RandomAccessFile读取临时文件的第四行以后部分。写入到目标文件中。              
             */
            Byte n;
            // 读取临时文件           
            RandomAccessFile random = new RandomAccessFile(imagePath, "r");
            int second = 1;
            String secondLine = null;
            while (second <= 2) {
                secondLine = random.readLine();
                second++;
            }
            int position = secondLine.lastIndexOf( fileSeperator);
            // 获取上传文件的名称
            String fileName = secondLine.substring(position + 1, secondLine.length() - 1);
            System.out.println(fileName);
            random.seek(0);
            long forthEndPosition = 0;
            int forth = 1;
            while ((n = random.readByte()) != -1 && (forth <= 4)) {
                if (n == '\n') {
                    forthEndPosition = random.getFilePointer();
                    forth++;
                }
            }
            RandomAccessFile random2 = new RandomAccessFile(imagePath, "rw");
            random.seek(random.length());
            long endPosition = random.getFilePointer();
            long mark = endPosition;
            int j = 1;
            while ((mark >= 0) && (j <= 6)) {
                mark--;
                random.seek(mark);
                n = random.readByte();
                if (n == '\n') {
                    endPosition = random.getFilePointer();
                    j++;
                }
            }
            random.seek(forthEndPosition);
            long startPoint = random.getFilePointer();
            while (startPoint < endPosition - 1) {
                n = random.readByte();
                random2.write(n);
                startPoint = random.getFilePointer();
            }
            random.close();
            random2.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return imagePath;
	}
}
