<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>添加表</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
<%

if ((String)request.getAttribute("info") == "success") { %>

    <script>

    alert("添加Table成功！"); 

   </script>

<%}%>
<script type="text/javascript">
$(document).ready(function(){
	var key ="<%=request.getParameter("key")%>"
	$("#key").val(key)
	
	$("#addpri").click(function(){
		var num1 = $("#prihid").val();
		$("#prihid").val(parseInt(num1)+1);
		var num2 = $("#prihid").val();
		var fieldname = "prikey"+num2;
		var fieldtype = "type_"+fieldname;
		var str = $("#p1").html();
		var str = str + 
        	"<label>primary Column</label>"+
            "<span class='field'><input type='text' name="+fieldname+" class='smallinput' /></span>"+
            "<label>type</label>"+
            "<span class='field'>"+
            "<select name="+fieldtype+" class='uniformselect'>"+
            "	<option selected='selected'>text</option>"+
            "    <option>double</option>"+
            "    <option>int</option>"+
            "    <option>float</option>"+
            "    <option>varchar</option>"+
            "    <option>ascii</option>"+
            "    <option>bigint</option>"+
            "    <option>Boolean</option>"+
            "    <option>timestamp</option>"+
            "    <option>timeuuid</option>"+
            "    <option>uuid</option>"+
            "</select>"+         
            "</span>";
		$("#p1").html(str);
	});
	
	$("#addnormal").click(function(){
		var num1 = $("#norhid").val();
		$("#norhid").val(parseInt(num1)+1);
		var num2 = $("#norhid").val();
		var fieldname = "norkey"+num2;
		var fieldtype = "type_"+fieldname;
		var str = $("#p2").html();
		var str = str + 
        	"<label>primary Column</label>"+
            "<span class='field'><input type='text' name="+fieldname+" class='smallinput' /></span>"+
            "<label>type</label>"+
            "<span class='field'>"+
            "<select name="+fieldtype+" class='uniformselect'>"+
            "	<option selected='selected'>text</option>"+
            "    <option>double</option>"+
            "    <option>int</option>"+
            "    <option>float</option>"+
            "    <option>varchar</option>"+
            "    <option>ascii</option>"+
            "    <option>bigint</option>"+
            "    <option>Boolean</option>"+
            "    <option>timestamp</option>"+
            "    <option>timeuuid</option>"+
            "    <option>uuid</option>"+
            "</select>"+         
            "</span>";
		$("#p2").html(str);
	});
});

function refer() {
	$("#form1").submit();
}
</script>
<div class="bodywrapper">
        <%@ include file="top.jsp" %>
    <%@ include file="leftMenu.jsp" %>
    <div class="centercontent">
               <div id="contentwrapper" class="contentwrapper">
        	<div id="basicform" class="subcontent">                              
                    <div class="contenttitle2">
                        <h3>添加表</h3>
                        <button id="addpri">添加主键</button>
                        <button id="addnormal">添加列</button>
                    </div><!--contenttitle-->
                    <form id="form1" class="stdform" action="http://47.103.222.181:10000/visualCass/insertTab_do" method="post">  
                    	<p>
                    	<label>表名</label>
                    	<span class='field'><input type='text' name="tab" class='smallinput' /></span>
                        </p>   	
                        <p id="p1">
                        </p>
                        <p id="p2">
                        </p>  
                        <br clear="all" /><br />
                        <p class="stdformbutton">
                        	<button class="submit radius2" onclick="return refer()">Submit Button</button>
                            <input type="reset" class="reset radius2" value="Reset Button" />
                            <input id="prihid" type="hidden" name="prinum" value="0"/>  
                            <input id="norhid" type="hidden" name="nornum" value="0"/>
                            <input id="key" type="hidden" name="key" value="0"/>
                        </p>
                    </form>
                    <br />
			<p>       
        </div><!--contentwrapper-->
    </div><!--centercontent-->
</div><!--bodywrapper-->

</body>
</html>
