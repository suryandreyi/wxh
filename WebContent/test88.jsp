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
		var addr = address + "/visualCass/split_do?type=test7&task=split";
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
	
	
	function down() {
		var addr = address + "/visualCass/split_do?type=test7&task=obtain";
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
	
	
	function swtoinfo() {
		$("#showinfo").css('display','block');
		$("#showprocess").css('display','none');
		$("#pro").attr('class','');
		$("#target").attr('class','current');
	}
	function swtoprocess() {
		$("#showinfo").css('display','none');
		$("#showprocess").css('display','block');
		$("#pro").attr('class','current');
		$("#target").attr('class','');
	}
	function wachlog() {
		var addr = address + "/visualCass/result_do?type=test7";
		var taskName = $("#tn").val();	
		alert(taskName);
		$.ajax({
			url : addr,
			dataType : "json",
			type : "post",
			data : {"taskName":taskName},
			async : false,
			success : function(data) { //如果请求成功，返回数据。
				var sx = document.getElementById("wxh");
				var str = "<h5> 记录时间:";
				$.each(data.sumt, function(i, item) {
					str += "<h6>"+item+"ms"+" "+data.pert[i];
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
							<h3>指标7</h3>
						</div>
						<!--contenttitle-->
						<form id="form1" class="stdform" onsubmit="return false" action="##" method="post">
							<p>
	<label>选择分片大小</label> <span class="field"> <select
	name="block" class="uniformselect">
		<option selected="selected">1MB</option>
		<option>100KB</option>
		<option>100MB</option>
		<option>1GB</option>
</select>
</span>
</p>
							
							
							
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
								<button class="submit radius2" id="sub" onclick="return down()">下载</button>
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
							<div id="tabs">
								<ul class="hornav">
									<li id="target" class="current" onclick="return swtoinfo()"><a>指标内容</a></li>
									<li id="pro" onclick="return swtoprocess()"><a>测试流程</a></li>
								</ul>
								<div id="showinfo" style="display: block">
<blockquote class="bq2 currentstatus marginbottom0">
<h5>支持情报产品分片粒度多级可控。</h5>
</blockquote>
								</div>
								<div id="showprocess" style="display: none">
									<blockquote class="bq2 currentstatus marginbottom0">
										<h5>1.设置分片大小为1M</h5>
										<h5>2.在系统插入10M大小的数据</h5>
										<h5>3.从文件中读取需要存储的数据，根据指定的分片大小将其切割</h5>
										<h5>4.为每个分片分配分片id，并将其记录在分片表中</h5>
										<h5>5.从系统中读取数据时，根据Partition Key到分片表中找到对应的分片id</h5>
										<h5>6.根据分片id从系统中获得对应的分片数据，查看每个分片数据的大小，并对其拼接</h5>
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
								<button class="submit radius2" id="sub" onclick="return wachlog()">查看日志</button>
								<span class="field"> <select name="resultName" id="rn"
									class="uniformselect">
										<option selected="selected">Task1</option>
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