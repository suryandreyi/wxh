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
	<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#upBox {
	text-align: center;
	width: 500px;
	padding: 20px;
	border: 1px solid #666;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 200px;
	position: relative;
	border-radius: 10px;
}

#inputBox {
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

#inputBox input {
	width: 114%;
	height: 40px;
	opacity: 0;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: -14%;
}

#imgBox {
	text-align: left;
}

.imgContainer {
	display: inline-block;
	width: 32%;
	height: 150px;
	margin-left: 1%;
	border: 1px solid #666666;
	position: relative;
	margin-top: 30px;
	box-sizing: border-box;
}

.imgContainer img {
	width: 100%;
	height: 150px;
	cursor: pointer;
}

.imgContainer p {
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

.imgContainer:hover p {
	display: block;
}

#bt {
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
			var addr = "#";
			$("#form").attr("action", addr);
		}
		
		function up() {
			var sx = document.getElementById("wxh");
			var str = "";
			str += "<h3> 开始检测</h3>";
			str += "<br/>";
			sx.innerHTML = str;
			
			setTimeout(function() {
				info();
			}, 8000);
		}
		
		function info() {
			var sx = document.getElementById("wxh");
			var str = sx.innerHTML;
			str += "<h3> 图1</h3>";
			str += "<h3> 准确率:";
			str += "0.9482464";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[267.3412 248.7652 352.47955 360.98132]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "table";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图2</h3>";
			str += "<h3> 准确率:";
			str += "0.9674448";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 0.191.58527 438.25256 297.6285 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "boat";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图3</h3>";
			str += "<h3> 准确率:";
			str += "0.9996501";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 19.5253 0.435.4448 374]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "tvmonitor";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图4</h3>";
			str += "<h3> 准确率:";
			str += "0.99951077";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 91.81428 131.75876 228.9732 204.95624 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "aeroplane";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图5</h3>";
			str += "<h3> 准确率:";
			str += "0.9885415";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 329.95792 76.04108 497.24216 259.14468 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "bus";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图6</h3>";
			str += "<h3> 准确率:";
			str += "0.99781346";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 126.54503 80.11678 366.64612 307.10547 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "dog";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图7</h3>";
			str += "<h3> 准确率:";
			str += "0.99545896";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 150.7056 47.790756 429.8328 327.23303 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "train";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图8</h3>";
			str += "<h3> 准确率:";
			str += "0.9994487";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 126.0513 212.18376 346.4625 381.07867 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "horse";					
			str += "</h3>";
			str += "<h3> 准确率:";
			str += "0.9974298";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 0.253.61386 197.89545 399 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "horse";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图9</h3>";
			str += "<h3> 准确率:";
			str += "0.99339736";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 74.72205 70.96408 283.54282 164.4942 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "cat";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图10</h3>";
			str += "<h3> 准确率:";
			str += "0.99864167";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 63.737648 54.804623 188.49295 143.43282 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "motorbike";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图11</h3>";
			str += "<h3> 准确率:";
			str += "0.9973707";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 25.919144 48.008804 372.63336 469.524 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "bird";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图12</h3>";
			str += "<h3> 准确率:";
			str += "0.9997795";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 67.62331 83.67729 384.89496 374 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "cow";					
			str += "</h3>";
			str += "<h3> 准确率:";
			str += "0.8104975";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[252.03796 60.961227 400.7154 239.60088 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "cow";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图13</h3>";
			str += "<h3> 准确率:";
			str += "0.9754842";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[187.4795 148.22713 213.1793 187.01018]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "pottedplant";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图14</h3>";
			str += "<h3> 准确率:";
			str += "0.9948696";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 0.0.339.98785 448.2975 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "bottle";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图15</h3>";
			str += "<h3> 准确率:";
			str += "0.9991353";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 0.46.850388 363.75806 325.0169 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "person";					
			str += "</h3>";
			str += "<h3> 准确率:";
			str += "0.9979761";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 329.38577 86.625015 499.331.64124 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "person";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图16</h3>";
			str += "<h3> 准确率:";
			str += "0.99895006";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 31.807816 117.09703 227.05629 198.2386 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "sofa";					
			str += "</h3>";
			str += "<h3> 准确率:";
			str += "0.9710146";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 257.6433 122.2257 445.9425 219.36908 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "sofa";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图17</h3>";
			str += "<h3> 准确率:";
			str += "0.9992495";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 148.2984 44.122017 466.281 266.63776 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "car";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图18</h3>";
			str += "<h3> 准确率:";
			str += "0.9997489";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 164.56618 28.245682 486.87427 366.44086 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "sheep";					
			str += "</h3>";
			str += "<h3> 准确率:";
			str += "0.99666804";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 29.544693 21.583511 242.10133 333.29742 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "sheep";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图19</h3>";
			str += "<h3> 准确率:";
			str += "0.9989479";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 31.05754 26.167725 310.6029 483.2755 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "chair";					
			str += "</h3>";
			str += "<br/>";
			
			str += "<h3> 图20</h3>";
			str += "<h3> 准确率:";
			str += "0.9995683";
			str += "</h3>";
			str += "<h3> 位置:";
			str += "[ 11.245117 0.499.371 ]";
			str += "</h3>";						
			str += "<h3> 类别:";
			str += "bicycle";					
			str += "</h3>";
			str += "<br/>";

			
			sx.innerHTML = str;
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
						<div class="file-box">



							<div style="width: 100%; height: 100vh; position: relative;">
								<form id="upBox">
									<div id="inputBox">
										<input type="file" title="请选择图片" id="file" multiple
											accept="image/png,image/jpg,image/gif,image/JPEG" />点击选择图片
									</div>
									<div id="imgBox"></div>
									<a id="bt" onclick="return up()">上传</a>
								</form>
							</div>

							<script src="js/uploadImg.js" type="text/javascript"
								charset="utf-8"></script>
							<script type="text/javascript">
								imgUpload({
									inputId : 'file', //input框id
									imgBox : 'imgBox', //图片容器id
									buttonId : 'btn', //提交按钮id
									upUrl : 'shibie_do', //提交地址
									data : 'file1', //参数名
									num : "5"//上传个数
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
											<h3>支持视觉数据目标提取与标注，提取与标注的目标种类大于20类</h3>
										</blockquote>
									</div>
								</div>


								<div id="tabs" style="display: inline-block">
									<ul class="hornav">
										<li id="pro" class="current"><a>测试流程</a></li>
									</ul>
									<div id="showprocess" style="display: block">
										<blockquote class="bq2 currentstatus marginbottom0">
										<h3>1.开启目标检测算法</h3>
										<h3>2.对随机搜集的图像进行测试</h3>
										<h3>3.通过目标检测算法检测图像数据</h3>
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