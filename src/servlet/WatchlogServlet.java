////package servlet;
//
//import java.io.File;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import sshutil.SFTP;
//import sshutil.SFTPUtil;
//
//@WebServlet("/watchlog_do")
//public class WatchlogServlet extends HttpServlet {
//	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String logName = req.getParameter("logname");
//		// 下载文件 转发
//		SFTP s = new SFTP();
//		try {
//			SFTPUtil.getConnect(s);
//			String directory = "/home/kuayu/software/apache-cassandra-3.11.6/logs";
//			String downloadFile = logName + ".log";
//			String saveFile = getServletContext().getRealPath("/logs");
//			// 判断是否有文件 若有 删除 下载 若无下载
//			File file = new File(saveFile + "/" + downloadFile);
//			System.out.println(file.getPath());
//			if (file.exists()) {
//				file.delete();
//			}
//			SFTPUtil.download(directory, downloadFile, saveFile);
//			SFTPUtil.disConn(s.getSession(), s.getChannel(), s.getSftp());
//
//			// 读取文件内容并显示在页面上
//
//			InputStream input = getServletContext().getResourceAsStream("/logs/" + downloadFile);
//			OutputStream output = resp.getOutputStream();
//			byte[] buff = new byte[1024 * 10];// 可以自己 指定缓冲区的大小
//			int len = 0;
//			while ((len = input.read(buff)) > -1) {
//				output.write(buff, 0, len);
//			}
//			// 关闭输入输出流
//			input.close();
//			output.close();
//
//		} catch (Exception e) {
//			// TODO 自动生成的 catch 块
//			e.printStackTrace();
//		}
//	}
//
//	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doGet(req, resp);
//	}
//
//}
