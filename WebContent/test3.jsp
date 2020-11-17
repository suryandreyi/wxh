<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>控制台页面</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
	<script type="text/javascript">
	function check() {
		var addr = address + "/visualCass/targetSearch_do?type=test3";
		var taskName = $("#tn").val();	
		var xh = document.getElementById("rn");
		var str = "<option>"+taskName+"</option>"
		xh.innerHTML = str;
        $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: addr ,//url
                data: $('#form1').serialize(),
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    alert("SUCCESS");
                }
         });
	}	
	function wachlog() {
		var addr = address + "/visualCass/result_do?type=test3";
		var taskName = $("#tn").val();	
		$.ajax({
			url : addr,
			dataType : "json",
			type : "post",
			data : {"taskName":taskName},
			async : false,
			success : function(data) { //如果请求成功，返回数据。
				var sx = document.getElementById("wxh");
				var str = "<h3> 查询成功率:";
				str += "<h3>success:"+data.success[0];
				str += "<h3>error:"+data.fail[0];
				str += "<h3>probability:"+data.probability[0]+"%";
				sx.innerHTML = str;
			}
		})
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
							<h3>指标3</h3>
						</div>
						<!--contenttitle-->
						<form id="form1" class="stdform" onsubmit="return false" action="##" method="post">
							<p>
								<label>数据库名</label> <span class="field"><input
									type="text" name="key" class="smallinput" /></span>
							</p>
							<p>
								<label>表名</label> <span class="field"><input
									type="text" name="tab" class="smallinput" /></span>
							</p>
							<p>
								<label>任务名</label> <span class="field"><input
									type="text" name="taskname" class="smallinput" id="tn"/></span>
							</p>
							<p>
								<label>文件路径</label> <span class="field"><input
									type="text" name="filepath" class="smallinput" /></span>
							</p>
							<p>
								<label>结果路径</label> <span class="field"><input
									type="text" name="resultpath" class="smallinput" /></span>
							</p>
							<p>
								<label>线程数</label> <span class="field"><input type="text"
									name="input1" class="smallinput" /></span>
							</p>
							<p>
								<label>查询条目数</label> <span class="field"><input
									type="text" name="insertSumnum" class="smallinput" /></span>
							</p>
							<p>
								<label>文件选择</label> <span class="field"><input
									type="file" name="input1" class="smallinput" /></span>
							</p>
							<p>
								<label>索引范围</label> <span class="field"> <select
									name="consistent" class="uniformselect">
										<option selected="selected" name="a">全局索引</option>
										<option name="o">单机索引</option>
								</select>
								</span>
							</p>
							<p>
								<label>结果统计</label> <span class="field"> <select
									name="resultNum" class="uniformselect">
										<option selected="selected">/100条</option>
										<option>/5条</option>
										<option>/10条</option>
										<option>/1000条</option>
										<option>/10000条</option>
								</select>

								</span>
							</p>
							<br clear="all" /> <br />
							<p class="stdformbutton">
								<button class="submit radius2" id="sub" onclick="return check()">查询</button>
								<input type="reset" class="reset radius2" value="Reset Button" />
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
															<div id="tabs" style="display: inline-block">
									<ul class="hornav">
										<li id="target" class="current"><a>指标内容</a></li>
									</ul>
									<div id="showinfo" style="display: block">
										<blockquote class="bq2 currentstatus marginbottom0">
											<h3>全系统提供高达99.999%的高可用性</h3>
										</blockquote>
									</div>
								</div>


								<div id="tabs" style="display: inline-block">
									<ul class="hornav">
										<li id="pro" class="current"><a>测试流程</a></li>
									</ul>
									<div id="showprocess" style="display: block">
										<blockquote class="bq2 currentstatus marginbottom0">
										<h3>1.系统每隔5s做一次查询，将查询记录做记录</h3>
										<h3>2.设置集群的一致性级别为One，此时只要有一个节点执行命令成功就会返回成功结果</h3>
										<h3>3.关闭某一数据节点的系统进程</h3>
										<h3>4.从数据集中随机读取数据，根据其中的主键信息从数据库中查询数据</h3>
										<h3>5.查询到的数据与数据集的数据进行比较</h3>
										<h3>6.将结果在日志文件中做记录，进行多次测试</h3>
										</blockquote>
									</div>
								</div>
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
								<button class="submit radius2" id="sub" onclick="return wachlog()">查看日志</button>
								<span class="field"> <select name="resultName" id="rn"
									class="uniformselect">
										<option selected="selected">task3</option>
										<option>Task2</option>
								</select>
								</span>
								<div id="showinfo" style="display: block">
									<blockquote class="bq2 currentstatus marginbottom0" id="wxh">
									</blockquote>
								</div>
							</p>
							<br />
						</div>
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