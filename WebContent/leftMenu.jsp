<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $(".one_bar").click(function(){
          $(this).next().slideToggle();
          $(this).parent().siblings().children("ul").slideUp();
    });
});
</script>
<style type="text/css">
.two_bar {
	display:none;
}
li {
	list-style:none;
}
.two_bar li,.one_bar {
	display:block;
}
a:link,a:visited,a:hover,a:active {
	text-decoration:none;
}
</style>
<div class="vernav2 iconmenu">
	<ul>
	    <br/>
		<li>
            <a href="###" class="one_bar">集群信息</a>
            <ul class="two_bar">
                <li><a href="nodeinfo.jsp">节点信息</a></li>
				<li><a href="maptopo.jsp">节点位置</a></li>
				<li><a href="keyspaces.jsp">数据库信息</a></li>
            </ul>
        </li>
        <br/>
		
		
		<li>
            <a href="###" class="one_bar">运维信息</a>
            <ul class="two_bar">
				<li><a href="watchlog.jsp">运维日志</a></li>
				<li><a href="clusternode.jsp">集群状态</a></li>
            </ul>
        </li>
		 <br/>
		<li><a href="safeconf.jsp" class="widgets">安全配置</a></li>
		 <br/>


		<li>
            <a href="###" class="one_bar">指标测试</a>
            <ul class="two_bar">
				<li><a href="test1.jsp">指标1</a></li>
				<li><a href="test2.jsp">指标2</a></li>
				<li><a href="test3.jsp">指标3</a></li>
				<li><a href="test4.jsp">指标4</a></li>
				<li><a href="test5.jsp">指标5</a></li>
				<li><a href="test6.jsp">指标6</a></li>
				<li><a href="test7.jsp">指标7</a></li>
				<li><a href="test8.jsp">指标8</a></li>
				<li><a href="test9.jsp">指标9</a></li>
				<li><a href="test10.jsp">指标10</a></li>
            </ul>
        </li>
	</ul>
	<br />
</div>