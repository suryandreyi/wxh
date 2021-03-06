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
		var addr = address + "/visualCass/targetInsert_do?type=test1";
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
                    if (result.resultCode == 200) {
                        alert("SUCCESS");
                    };
                },
                error : function() {
                    alert("完成！");
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
		var addr = address + "/visualCass/result_do?type=test1";
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
				$.each(data, function(i, item) {
					str += "<h6>"+item+"ms";
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
							<h3>指标1</h3>
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
								<label>插入条目数</label> <span class="field"><input
									type="text" name="insertSumnum" class="smallinput" /></span>
							</p>
							<p>
								<label>索引范围</label> <span class="field"> <select
									name="input3" class="uniformselect">
										<option selected="selected">全局索引</option>
										<option>单机索引</option>
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
							<div id="tabs">
								<ul class="hornav">
									<li id="target" class="current" onclick="return swtoinfo()"><a>指标内容</a></li>
									<li id="pro" onclick="return swtoprocess()"><a>测试流程</a></li>
								</ul>
								<div id="showinfo" style="display: block">
									<blockquote class="bq2 currentstatus marginbottom0">
										<h5>为多阵地跨地域部署的信息节点提供全局一致的、</h5>
										<h5>高可靠的数据视图，数据一致时延小于10秒。</h5>
									</blockquote>
								</div>
								<div id="showprocess" style="display: none">
									<blockquote class="bq2 currentstatus marginbottom0">
										<h5>1.在系统插入数据集数据</h5>
										<h5>2.记录每100条数据插入成功后的时间</h5>
										<h5>3.记录数据一致性时延，比较各节点数据视图是否相同</h5>
										<h5>4.进行多次测试</h5>
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