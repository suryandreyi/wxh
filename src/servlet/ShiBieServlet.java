package servlet;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import sshutil.GetMess;
import utils.UpImage;


@WebServlet("/shibie_do")
public class ShiBieServlet extends HttpServlet{
	private static Logger logger = Logger.getLogger(Test.class);  
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		//处理上传的图片
		//来个存储地址
		String fileSeperator = File.separator;
		String savePath = req.getSession().getServletContext().getRealPath("upload"+fileSeperator+"imgs");
		//来个后缀
		String imagePath  = UpImage.saveImage(req, resp, savePath);	
        
        String urlStr = "http://183.250.164.68:15007/objectdetection";
        
        Map<String, String> textMap = new HashMap<String, String>();
    
        textMap.put("name", "testname");

        Map<String, String> fileMap = new HashMap<String, String>();
        
        fileMap.put("image", imagePath);
        
        String ret = GetMess.formUpload(urlStr, textMap, fileMap);

        logger.info(ret); 
        System.out.println(ret);
        
		PrintWriter out = null;
		out = resp.getWriter();
		out.write(ret); 
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
