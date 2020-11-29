<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>指标10</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
	<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
			#upBox{
				text-align: center;
				width:500px;
				padding: 20px;
				border: 1px solid #666;
				margin: auto;
				margin-top: 50px;
				margin-bottom: 200px;
				position: relative;
				border-radius: 10px;
			}
			#inputBox{
				width: 100%;
				height: 40px;
				border: 1px solid cornflowerblue;
				color: cornflowerblue;
				border-radius: 20px;
				position: relative;
				text-align: center;
				line-height: 40px;
				overflow: hidden;
				font-size: 16px;
			}
			#inputBox input{
				width: 114%;
				height: 40px;
				opacity: 0;
				cursor: pointer;
				position: absolute;
				top: 0;
				left: -14%;
				
			}
			#imgBox{
				text-align: left;
			}
			.imgContainer{
				display: inline-block;
				width: 32%;
				height: 150px;
				margin-left: 1%;
				border: 1px solid #666666;
				position: relative;
				margin-top: 30px;
				box-sizing: border-box;
			}
			.imgContainer img{
				width: 100%;
				height: 150px;
				cursor: pointer;
			}
			.imgContainer p{
				position: absolute;
				bottom: -1px;
				left: 0;
				width: 100%;
				height: 30px;
				background: black;
				text-align: center;
				line-height: 30px;
				color: white;
				font-size: 16px;
				font-weight: bold;
				cursor: pointer;
				display: none;
			}
			.imgContainer:hover p{
				display: block;
			}
			#btn{
				display: inline-block;
				text-align: center;
				line-height: 30px;
				outline: none;
				width: 100px;
				height: 30px;
				background: cornflowerblue;
				border: 1px solid cornflowerblue;
				color: white;
				cursor: pointer;
				margin-top: 30px;
				border-radius: 5px;
			}
		</style>
	<script type="text/javascript">
		function check() {
			var addr = "http://183.250.164.68:15007/objectdetection";
			$("#form").attr("action", addr);
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
							<h3>指标10</h3>
						</div>
						<!--contenttitle-->
						<div class="file-box">



		<div style="width: 100%;height: 100vh;position: relative;">
			<form id="upBox">
				 <div id="inputBox"><input type="file" title="请选择图片" id="file" multiple accept="image/png,image/jpg,image/gif,image/JPEG"/>点击选择图片</div>
			     <div id="imgBox"></div>
			     <a id="btn">上传</a>
			</form>
		</div>
		
		<script src="js/uploadImg.js" type="text/javascript" charset="utf-8"></script>
				<script type="text/javascript">
			imgUpload({
				inputId:'file', //input框id
				imgBox:'imgBox', //图片容器id
				buttonId:'btn', //提交按钮id
				upUrl:'shibie_do',  //提交地址
				data:'file1', //参数名
				num:"5"//上传个数
			})
		</script>



						</div>
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
											<h3>目标提取与标注的准确率大于80%</h3>
										</blockquote>
									</div>
								</div>


								<div id="tabs" style="display: inline-block">
									<ul class="hornav">
										<li id="pro" class="current"><a>测试流程</a></li>
									</ul>
									<div id="showprocess" style="display: block">
										<blockquote class="bq2 currentstatus marginbottom0">
										<h3>1.开启目标检测正确性验证</h3>
										<h3>2.随机挑选的图像为测试集合</h3>
										<h3>3.以测试检测框与标签框重合度是否大于50%为准，大于且类别正确则认为检测正确</h3>
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