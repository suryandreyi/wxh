package servlet;


import java.io.File;
import java.io.RandomAccessFile;

import org.apache.log4j.Logger;

import com.datastax.driver.core.Session;

import utils.DBUtil_ONE;



public class Test {
	private static Logger logger = Logger.getLogger(Test.class);  
	 
    /** 
     * @param args 
     */  
    public static void main(String[] args) {  
        logger.info("This is info message.");  
    } 
}

