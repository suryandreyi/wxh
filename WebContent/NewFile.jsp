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
		function tt() {
			var addr = address + "/visualCass/shibie_do";
			$.ajax({
				url : addr,
				dataType : "json",
				type : "post",
				async : false,
				success : function(data) { //如果请求成功，返回数据。
					var sx = document.getElementById("wxh");
					var str = "";
					$.each(data, function(i, item) {
						str += "<h5> 置信数:";
						str += item.score;
						str += "</h5>";
						str += "<h5> 位置:";
						str += item.position;
						str += "</h5>";						
						str += "<h5> 类别:";
						str += item.class_name;
						str += "</h5>";
					})
					
					sx.innerHTML = str;
				}
			})
		}
		function swtoinfo() {
			$("#showinfo").css('display', 'block');
			$("#showprocess").css('display', 'none');
			$("#pro").attr('class', '');
			$("#target").attr('class', 'current');
		}
		function swtoprocess() {
			$("#showinfo").css('display', 'none');
			$("#showprocess").css('display', 'block');
			$("#pro").attr('class', 'current');
			$("#target").attr('class', '');
		}
	</script>
	<div class="bodywrapper">
		<%@ include file="top.jsp"%>
		<%@ include file="leftMenu.jsp"%>
		<%@ include file="basic.jsp"%>
		<div class="centercontent">
			<div id="contentwrapper" class="contentwrapper widgetpage">
				<div class="one_half">
					<div class="widgetbox">
						<div class="contenttitle2">
							<h3>指标9</h3>
						</div>
						<!--contenttitle-->
						<form class="stdform" id="form" method="post" enctype="multipart/form-data">
							<p>
								<label>文件选择</label> <span class="field"><input
									type="file" name="image" class="smallinput" /></span>
							</p>
							<br clear="all" /> <br />
							<p class="stdformbutton">
								<button class="submit radius2" id="sub" onclick="return check()">查询</button>
								<input type="reset" class="reset radius2" value="Reset Button" />
								<a class="btn btn2 btn_book" onclick="return tt()"><span>添加</span></a>
							</p>
						</form>
					</div>
					<!--widgetbox-->
				</div>
				<!--one_half-->
				<div class="one_half last">
					<div class="widgetbox">
						<br /> <br />
						<div class="title">
							<h3>指标详情</h3>
						</div>
						<div class="widgetcontent">
							<div id="tabs">
								<ul class="hornav">
									<li id="target" class="current" onclick="return swtoinfo()"><a>指标内容</a></li>
									<li id="pro" onclick="return swtoprocess()"><a>测试流程</a></li>
								</ul>
								<div id="showinfo" style="display: block">
									<blockquote class="bq2 currentstatus marginbottom0">
										<h5>支持视觉数据目标提取与标注，提取与标注的目标种类大于20类</h5>
									</blockquote>
								</div>
								<div id="showprocess" style="display: none">
									<blockquote class="bq2 currentstatus marginbottom0">
										<h5>1.开启目标检测算法</h5>
										<h5>2.对随机搜集的图像进行测试</h5>
										<h5>3.通过目标检测算法检测图像数据</h5>
									</blockquote>
								</div>
							</div>
							<!--#tabs-->
						</div>
						<!--widgetcontent-->
					</div>
					<!--widgetbox-->
					<div class="widgetbox">
						<div class="title">
							<h3>测试结果</h3>
						</div>
						<div class="widgetcontent">
							<p>
								<label>选择任务</label>
								<button class="submit radius2" id="sub" onclick="return check()">查看日志</button>
								<span class="field"> <select name="resultNum"
									class="uniformselect">
										<option selected="selected"></option>
										<option></option>
										<option></option>
										<option></option>
								</select>
								</span>
								<div id="showinfo" style="display: block">
									<blockquote class="bq2 currentstatus marginbottom0" id="wxh">
									</blockquote>
								</div>
							</p>
							<br />
						</div>
						<!--widgetcontent-->
					</div>
					<!--widgetbox-->
				</div>
				<!--one_half last-->
			</div>
			<!--contentwrapper-->
			<!--centercontent-->
		</div>
		<!--bodywrapper-->
	</div>

</body>
</html>