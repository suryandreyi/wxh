package utils;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class GetIpUtil {
	public static String getAddr(String ip) throws IOException {
		String url ="https://whois.pconline.com.cn/ip.jsp?ip="+ip;
        Document document = Jsoup.connect(url).get();
        System.out.println(document.body().text());
        return document.body().text();
    }
}
