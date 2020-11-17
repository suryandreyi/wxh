<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.ResourceBundle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%ResourceBundle res = ResourceBundle.getBundle("basic"); %>  
<%
    String ip = res.getString("ip");
	String port = res.getString("port");
%>
<script src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
var ip = "<%=ip %>";
var port = "<%=port %>";
var address = "http://" + ip + ":" + port;
</script>