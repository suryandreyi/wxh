<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $(".one_bar").click(function(){
          $(this).next().slideToggle();
          $(this).parent().siblings().children("ul").slideUp();
    });
});
</script>
<title>sx</title>
</head>
<body>


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


   
<div class="top_bar">
    <ul>
        <li>
            <a href="###" class="one_bar">一级菜单</a>
            <ul class="two_bar">
                <li>二级菜单</li>
                <li>二级菜单</li>
                <li>二级菜单</li>
            </ul>
        </li>
        <li>
            <a href="###" class="one_bar">一级菜单</a>
            <ul class="two_bar">
                <li>二级菜单</li>
                <li>二级菜单</li>
                <li>二级菜单</li>
            </ul>
        </li>
    </ul>
</div>

	
	
	
</body>
</html>