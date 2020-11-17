package sshutil;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Properties;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

public class SFTPUtil {
	public static void getConnect(SFTP s) throws Exception {

		/** 密钥的密码 */
		// String privateKey ="key";
		// /** 密钥文件路径 */
		// String passphrase ="path";
		/** 主机 */
		String host = "159.226.41.232";
		/** 端口 */
		int port = 10000;
		/** 用户名 */
		String username = "kuayu";
		/** 密码 */
		String password = "fdsajkl";

		Session session = null;
		Channel channel = null;
		ChannelSftp sftp = null;// sftp操作类

		JSch jsch = new JSch();

		// 设置密钥和密码
		// 支持密钥的方式登陆，只需在jsch.getSession之前设置一下密钥的相关信息就可以了
		// if (privateKey != null && !"".equals(privateKey)) {
		// if (passphrase != null && "".equals(passphrase)) {
		// //设置带口令的密钥
		// jsch.addIdentity(privateKey, passphrase);
		// } else {
		// //设置不带口令的密钥
		// jsch.addIdentity(privateKey);
		// }
		// }
		session = jsch.getSession(username, host, port);
		session.setPassword(password);
		Properties config = new Properties();
		config.put("StrictHostKeyChecking", "no"); // 不验证 HostKey
		session.setConfig(config);
		try {
			session.connect();
		} catch (Exception e) {
			if (session.isConnected())
				session.disconnect();

		}
		channel = session.openChannel("sftp");
		try {
			channel.connect();
		} catch (Exception e) {
			if (channel.isConnected())
				channel.disconnect();
		}
		sftp = (ChannelSftp) channel;

		s.setChannel(channel);
		s.setSession(session);
		s.setSftp(sftp);

	}

	public static void disConn(Session session, Channel channel, ChannelSftp sftp) throws Exception {
		if (null != sftp) {
			sftp.disconnect();
			sftp.exit();
			sftp = null;
		}
		if (null != channel) {
			channel.disconnect();
			channel = null;
		}
		if (null != session) {
			session.disconnect();
			session = null;
		}
	}

	public static void download(String directory, String downloadFile, String saveFile) throws Exception {
		SFTP s = new SFTP();
		getConnect(s);// 建立连接
		Session session = s.getSession();
		Channel channel = s.getChannel();
		ChannelSftp sftp = s.getSftp();// sftp操作类
		try {

			sftp.cd(directory); // 进入目录
			File file = new File(saveFile);
			boolean bFile;
			bFile = false;
			bFile = file.exists();
			if (!bFile) {
				bFile = file.mkdirs();// 创建目录
			}
			OutputStream out = new FileOutputStream(new File(saveFile, downloadFile));

			sftp.get(downloadFile, out);

			out.flush();
			out.close();

		} catch (Exception e) {
			throw new Exception(e.getMessage(), e);
		} finally {
			disConn(session, channel, sftp);
		}

	}
}
