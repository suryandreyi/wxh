package servlet;


import java.io.File;
import java.io.RandomAccessFile;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import com.datastax.driver.core.Session;

import utils.DBUtil_ONE;



public class Test {
    public static void main(String[] args) {  
    	String commnet = "\"Record_Datetime\" int(10) unsigned NOT NULL DEFAULT \"0\" COMMENT \"记录的时间，UTC秒表示\",\r\n" + 
    			"  \"MMSI\" int(11) unsigned NOT NULL DEFAULT \"0\" COMMENT \"船只MMSI。在AIS消息中，使用30bit来表示\",";
    	String pattern = "MMSI.*COMMENT.*\"(.*)\"";
	    Pattern r = Pattern.compile(pattern);
	    Matcher m = r.matcher(commnet);
	    if(m.find()) {
	    	System.out.println("匹配："+m.group(0));	   
	    	System.out.println("匹配："+m.group(1));
	    }
    } 
}

