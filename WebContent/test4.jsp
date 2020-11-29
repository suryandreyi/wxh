<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>指标4</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
	<script type="text/javascript">
		function insert() {
			var sx1 = document.getElementById("wxh");
			var str1 = sx1.innerHTML;
			str1 += "<h3> 开始测试</h3> ";
			sx1.innerHTML = str1;

			var addr = address + "/visualCass/targetInsert_do?type=test4&dt=it";
			var taskName = $("#tn").val();
			var xh = document.getElementById("rn");
			var str = "<option>" + taskName + "</option>"
			xh.innerHTML = str;
			$.ajax({
				//几个参数需要注意一下
				type : "POST",//方法类型
				dataType : "json",//预期服务器返回的数据类型
				url : addr,//url
				data : $('#form1').serialize(),
				success : function(result) {
					if (result.resultCode == 200) {
						str1 = sx1.innerHTML;
						str1 += "<h3> 测试完成</h3>";
						sx1.innerHTML = str1;
					}
					;
					if (result.resultCode == 404) {
						setTimeout(function() {

							str1 = sx1.innerHTML;
							str1 += "<h5> 插入失败";
							sx1.innerHTML = str1;

						}, 2000);
					}
					;
				}
			});
		}

		function search() {
			var sx1 = document.getElementById("wxh");
			var str1 = sx1.innerHTML;
			str1 += "<h3> 开始查询 </h3>";
			sx1.innerHTML = str1;

			var addr = address + "/visualCass/targetSearch_do?type=test4&dt=se";
			var taskName = $("#tn").val();
			var xh = document.getElementById("rn");
			var str = "<option>" + taskName + "</option>"
			xh.innerHTML = str;
			$.ajax({
				//几个参数需要注意一下
				type : "POST",//方法类型
				dataType : "json",//预期服务器返回的数据类型
				url : addr,//url
				data : $('#form1').serialize(),
				success : function(result) {
					if (result.resultCode == 200) {
						str1 = sx1.innerHTML;
						str1 += "<h3> 查询完成 </h3>";
						sx1.innerHTML = str1;
					}
					;
				}
			});
		}
		function close1() {
			var sx = document.getElementById("wxh");
			var s = $("#nodesel1").val();
			var h = sx.innerHTML;
			var str = h+"<h3>关闭节点:" + s+"</h3>";
			sx.innerHTML = str;
			
			var addr = address + "/visualCass/nodestate_do?stop="+s;
			
	        $.ajax({
	            //几个参数需要注意一下
	                type: "POST",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: addr ,//url
	                success: function (result) {
	                	if(result.resultCode==200){
		                	var sx1 = document.getElementById("wxh");
							var str1 = sx1.innerHTML += "<h3> 关闭节点成功</h3>";
							sx1.innerHTML = str1;                		
	                	}else{
	                		alert(666);
	                	}
	                }
	         });
		}

		function start1() {
			var sx = document.getElementById("wxh");
			var h = sx.innerHTML;
			
			var s = $("#nodesel2").val();
			var str = h+"<h3>开启节点:"+s+"</h3>";
			sx.innerHTML = str;
			var addr = address + "/visualCass/nodestate_do?start="+s;
			
	        $.ajax({
	            //几个参数需要注意一下
	                type: "POST",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: addr ,//url
	                success: function (result) {
	                	if(result.resultCode==200){
		                	var sx1 = document.getElementById("wxh");
							var str1 = sx1.innerHTML += "<h3> 开启节点成功</h3>";
							sx1.innerHTML = str1;                		
	                	}else{
	                		alert(666);
	                	}
	                }
	         });
		}

		function wachlog() {
			var addr = address + "/visualCass/result_do?type=test4";
			var taskName = $("#tn").val();
			$.ajax({
				url : addr,
				dataType : "json",
				type : "post",
				data : {
					"taskName" : taskName
				},
				async : false,
				success : function(data) { //如果请求成功，返回数据。
					var sx = document.getElementById("wxh");
					var str = sx.innerHTML;
					str += "<h3> 记录时间:</h3>";
					$.each(data.sumt, function(i, item) {
						str += "<h3>" + item + "ms";
					})

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
							<h3>指标4</h3>
						</div>
						<p>
							<label>节点信息</label>
							<button class="submit radius2" id="sub" onclick="return close1()">关闭</button>
							<span class="field"> 
							<select name="nodesel" id="nodesel1" class="uniformselect">
									<option selected="selected">183.250.164.68</option>
									<option>36.153.113.4</option>
									<option>159.226.41.232</option>
									<option>202.189.3.234</option>
							</select>
							</span>
							
							<button class="submit radius2" id="sub" onclick="return start1()">开启</button>
							<span class="field"> 
							<select name="nodesel" id="nodesel2" class="uniformselect">
									<option selected="selected">183.250.164.68</option>
									<option>36.153.113.4</option>
									<option>159.226.41.232</option>
									<option>202.189.3.234</option>
							</select>
							</span>
						</p>
						<!--contenttitle-->
						<form id="form1" class="stdform" onsubmit="return false"
							action="##" method="post">


							<p>
								<label>数据库名</label> <span class="field"><input
									type="text" name="key" class="smallinput" /></span>
							</p>
							<p>
								<label>表名</label> <span class="field"><input type="text"
									name="tab" class="smallinput" /></span>
							</p>
							<p>
								<label>任务名</label> <span class="field"><input type="text"
									name="taskname" class="smallinput" id="tn" /></span>
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
								<label>查询条目数</label> <span class="field"><input
									type="text" name="insertSumnum" class="smallinput" /></span>
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
										<option>/20条</option>
										<option>/500条</option>
								</select>
								</span>
							</p>
							<br clear="all" /> <br />
							<p class="stdformbutton">
								<button class="submit radius2" id="it" onclick="return insert()">插入</button>
								<button class="submit radius2" id="se" onclick="return search()">查询</button>
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
										<h3>用例7：网络分区时，孤儿节点仍可提供数据只读服务。</h3>
									</blockquote>
								</div>
							</div>
							<div id="tabs" style="display: inline-block">
								<ul class="hornav">
									<li id="pro" class="current"><a>测试流程</a></li>
								</ul>
								<div id="showprocess" style="display: block">
									<blockquote class="bq2 currentstatus marginbottom0">
<h3>1.选择一个孤儿节点，在其他节点后台使用命令”ps -ef|grep cass”</h3>
<h3>2.使用命令”kill -9 进程号”</h3>
<h3>3.使用命令”nodetool status”</h3>
<h3>4.在样本数据集中，选择任意数据</h3>
<h3>5.根据该数据，在测试表中进行查询</h3>
									</blockquote>
								</div>
							</div>
						</div>
						<!--widgetcontent-->
					</div>
					<div class="widgetbox">
						<div class="title">
							<h3>测试结果</h3>
						</div>
						<div class="widgetcontent">
							<p>
								<label>选择任务</label>
								<button class="submit radius2" id="sub"
									onclick="return wachlog()">查看日志</button>
								<span class="field"> <select name="resultName" id="rn"
									class="uniformselect">
										<option selected="selected">task3</option>
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