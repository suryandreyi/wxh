<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>控制台页面</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
<%

if ((String)request.getAttribute("info") == "success") { %>

    <script>

    alert("添加Keyspace成功！"); 

   </script>

<%}%>
<div class="bodywrapper">
        <%@ include file="top.jsp" %>
    <%@ include file="leftMenu.jsp" %>
        
    <div class="centercontent">
        
               <div id="contentwrapper" class="contentwrapper">
        	
        	<div id="basicform" class="subcontent">
                                
                    <div class="contenttitle2">
                        <h3>添加Keyspace</h3>
                    </div><!--contenttitle-->
                    <form class="stdform" action="http://47.103.222.181:10000/visualCass/insertKey_do" method="post">
                    	
                        <p>
                        	<label>KeySpace Name</label>
                            <span class="field"><input type="text" name="input1" class="smallinput" /></span>
                        </p>
                        
                        <p>
                        	<label>Strategy</label>
                            <span class="field">
                            <select name="input3" class="uniformselect">
                            	<option selected="selected">NetworkTopologyStrategy</option>
                                <option >SimpleStrategy</option>
                            </select>
                            
                            </span>
                        </p>
                        <p>
                        	<label>replication</label>
                            <span class="field"><input type="text" name="input2" class="smallinput" /></span>
                        </p>         
                        <br clear="all" /><br />
                        
                        <p class="stdformbutton">
                        	<button class="submit radius2">Submit Button</button>
                            <input type="reset" class="reset radius2" value="Reset Button" />
                        </p>
                    </form>
                    
                    <br />
			<p>
        
        </div><!--contentwrapper-->
    </div><!--centercontent-->
</div><!--bodywrapper-->

</body>
</html>
