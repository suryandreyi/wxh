package utils;

import java.awt.image.BufferedImage; 
import java.io.ByteArrayInputStream; 
import java.io.ByteArrayOutputStream; 
import java.io.File; 
import java.io.IOException;
import java.util.Arrays;

import javax.imageio.ImageIO; 
   
import sun.misc.BASE64Decoder; 
import sun.misc.BASE64Encoder; 

public class ImageUtil {	
	static BASE64Encoder encoder = new BASE64Encoder(); 
	static BASE64Decoder decoder = new BASE64Decoder(); 
    public static String getImageBinary(String path,String type) { 	
        File f = new File(path); 
        BufferedImage bi; 
        try { 
            bi = ImageIO.read(f); 
            ByteArrayOutputStream baos = new ByteArrayOutputStream(); 
            ImageIO.write(bi, type, baos);  //经测试转换的图片是格式这里就什么格式，否则会失真 
            byte[] bytes = baos.toByteArray(); 
   
            return encoder.encodeBuffer(bytes).trim(); 
        } catch (IOException e) { 
            e.printStackTrace(); 
        } 
        return null; 
    }
	
    public static void base64StringToImage(String base64String,String path,String type) { 
        try { 
            byte[] bytes1 = decoder.decodeBuffer(base64String); 
   
            ByteArrayInputStream bais = new ByteArrayInputStream(bytes1); 
            BufferedImage bi1 = ImageIO.read(bais); 
            File w2 = new File(path);// 可以是jpg,png,gif格式 
            ImageIO.write(bi1, type, w2);// 不管输出什么格式图片，此处不需改动 
        } catch (IOException e) { 
            e.printStackTrace(); 
        } 
    } 
    
    
    //拆分byte数组
	public static byte[][] splitBytes(byte[] bytes, int size) {
		double splitLength = Double.parseDouble(size + "");
		int arrayLength = (int) Math.ceil(bytes.length / splitLength);
		byte[][] result = new byte[arrayLength][];
		int from, to;
		for (int i = 0; i < arrayLength; i++) {
			from = (int) (i * splitLength);
			to = (int) (from + splitLength);
			if (to > bytes.length)
				to = bytes.length;
			result[i] = Arrays.copyOfRange(bytes, from, to);
		}
		return result;
	}
    
    
    
}