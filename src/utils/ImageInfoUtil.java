package utils;


import java.io.File;
import java.io.IOException;

import com.alibaba.fastjson.JSONObject;
import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.*;
import com.drew.metadata.Tag;
public class ImageInfoUtil {
	public static JSONObject getImgInfo(File img){
		JSONObject obj = new JSONObject();
		
		System.out.println("File Name:" + img.getName());
 
		Metadata metadata;
		try {
			metadata = JpegMetadataReader.readMetadata(img);
			System.out.println("Directory Count: "+metadata.getDirectoryCount());
			System.out.println();
			
			//输出所有附加属性数据
			for (Directory directory : metadata.getDirectories()) {
				System.out.println("******\t" + directory.getName() + "\t******");
				for (Tag tag : directory.getTags()) {
					System.out.println(tag);
					System.out.println(tag.getTagName() + ":" + tag.getDescription());
					if(tag.getTagName().endsWith("File Size")) {
						obj.put("daxiao", tag.getDescription());						
					}else if(tag.getTagName().endsWith("Image Height")) {
						obj.put("height", tag.getDescription());
					}else if(tag.getTagName().endsWith("Image Width")) {
						obj.put("width", tag.getDescription());
						//数据精度
					}else if(tag.getTagName().endsWith("Data Precision")) {
						obj.put("precision", tag.getDescription());
					}
				}
			}
		} catch (JpegProcessingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}		
		return obj;
	}
}
