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
<script type="text/javascript">
function check() {
	var path = getPath($("#fc"))
	alert(path);
	$("#hidTD").val(filepath);
    $("#form1").attr("action","http://47.103.222.181:10000/visualCass/targetSearch_do");
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
                        <h3>查询指标</h3>
                    </div><!--contenttitle-->
                    <form class="stdform" id="form1" method="post">
                        <p>
                            <label>文件选择</label>
                            <span class="field"><input type="file" name="fc" class="smallinput" id="fc"/></span>
                        </p>         	
                        <p>
                        	<label>线程数</label>
                            <span class="field"><input type="text" name="thread" class="smallinput" id="thread"/></span>
                        </p>
                        <p>
                        	<label>查询条目数</label>
                            <span class="field"><input type="text" name="itemsum" class="smallinput" /></span>
                        </p>
                        
                        <p>
                        	<label>查询Keyspace</label>
                            <span class="field"><input type="text"
								name="keyspace" class="smallinput" /></span>
                        </p>
                         <p>
                        	<label>查询table</label>
                            <span class="field"><input type="text" name="table" class="smallinput" /></span>
                        </p>
                        
                        <p>
                        	<label>索引范围</label>
                            <span class="field">
                            <select name="scope" class="uniformselect">
                            	<option selected="selected">全局索引</option>
                                <option >单机索引</option>
                            </select>
                            
                            </span>
                        </p>
                        <p>
                        	<label>一致性级别</label>
                            <span class="field">
                            <select name="consistent" class="uniformselect">
                            	<option selected="selected">ALL</option>
                                <option >QUERM</option>
                                <option >ONE</option>
                            </select>
                            
                            </span>
                        </p>  
                         <p>
                        	<label>结果统计</label>
                            <span class="field">
                            <select name="rescoll" class="uniformselect">
                            	<option selected="selected">/100条</option>
                                <option >/1000条</option>
                                <option >/10000条</option>
                            </select>                          
                            </span>
                        </p>
                        
                        
                        <br clear="all" /><br />
                        
                        <p class="stdformbutton">
                        	<input type="button" class="reset radius2" value="查询" onclick="return check()"/>
                        </p>
                        
                         <input id="hidTD" type="hidden" name="filepath" />
                         <p>
                        	<label>结果</label>
                            <span class="field"><input type="text" name="input2" class="biginput" /></span>
                        </p>         
                    </form>
                    
                    <br />
			<p>
        
        </div><!--contentwrapper-->
    </div><!--centercontent-->
</div><!--bodywrapper-->

</body>
</html>
