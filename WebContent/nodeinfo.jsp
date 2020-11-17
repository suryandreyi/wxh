<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>控制台页面</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<link rel="stylesheet" href="css/loaders.css" type="text/css"/>
<script src="js/jquery-3.3.1.js"></script>
</head>
<body class="withvernav">
<style>
.loader {
	margin-bottom: 50px;
	min-height: 100px;
	margin-left: 800px;
}
</style>
	<div class="bodywrapper">
		<%@ include file="top.jsp"%>
		<%@ include file="leftMenu.jsp"%>
		<%@ include file="basic.jsp"%>

		<div class="centercontent">
			<div class="pageheader">
				<h1 class="pagetitle">节点信息</h1>
			</div>
			
			<div id="contentwrapper" class="contentwrapper">
		   <div class="contenttitle2">
                	<h1>数据节点</h5>
                </div><!--contenttitle-->
                	
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable">
                    <colgroup>
                        <col class="con0" />
                        <col class="con1" />
                        <col class="con0" />
                        <col class="con1" />
                        <col class="con0" />
                        <col class="con1" />
                        <col class="con0" />
                        <col class="con1" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="head0">IP地址</th>
                            <th class="head1">物理位置</th>
                            <th class="head0">JDK</th>
                            <th class="head1">Cassandra</th>
                            <th class="head0">OS</th>
                            <th class="head0">CPU型号</th>
                            <th class="head0">CPU内核</th>
                            <th class="head0">内存大小</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>159.226.41.232</td>
                            <td>北京(中科院计算所)</td>
                            <td>1.8.0_121</td>
                            <td>3.11.5</td>
                            <td>Linux version 3.10.0-514.el7.x86_64</td>
                            <td>Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz</td>
                            <td>6</td>
                            <td>128654 mb</td>
                        </tr>
                        <tr>
                            <td>202.189.3.235</td>
                            <td>北京(龙芯产业园)</td>
                            <td>1.8.0_121</td>
                            <td>3.11.5</td>
                            <td>Linux version 4.15.0-74-generic</td>
                            <td>Intel(R) Xeon(R) CPU E5-2620 v4 @ 2.10GHz</td>
                            <td>8</td>
                            <td>64300 mb</td>
                        </tr>
                        <tr>
                        	<td>183.250.164.68</td>
                            <td>无锡</td>
                            <td>1.8.0_121</td>
                            <td>3.11.5</td>
                            <td>Linux version 3.10.0-862.el7.x86_64</td>
                            <td>Intel(R) Xeon(R) Silver 4110 CPU @ 2.10GHz</td>
                            <td>1</td>
                            <td>2000 mb</td>
                        </tr>
                        <tr>
                            <td>36.153.113.4</td>
                            <td>厦门</td>
                            <td>1.8.0_121</td>
                            <td>3.11.5</td>
                            <td>Linux version 5.3.0-51-generic</td>
                            <td>Intel(R) Core(TM) i5-8500 CPU @ 3.00GHz</td>
                            <td>5</td>
                            <td>7844 mb</td>
                        </tr>
                    </tbody>
                </table>
                
                <br /><br />
                
                
                 <div class="contenttitle2">
                	<h1>计算节点</h5>
                </div><!--contenttitle-->
                	
                <table cellpadding="0" cellspacing="0" border="0" class="stdtable">
                    <colgroup>
                        <col class="con0" />
                        <col class="con1" />
                        <col class="con0" />
                        <col class="con1" />
                        <col class="con0" />
                        <col class="con1" />
                        <col class="con0" />
                        <col class="con1" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="head0">IP地址</th>
                            <th class="head1">物理位置</th>
                            <th class="head0">JDK</th>
                            <th class="head0">OS</th>
                            <th class="head1">NVDIA</th>
                            <th class="head0">NVDIA驱动</th>
                            <th class="head0">CUDA版本</th>
                            <th class="head0">内存大小</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        	<td>183.250.164.68</td>
                            <td>无锡</td>
                            <td>openJDK，Oracle，JKD</td>
                            <td>Linux version 5.4.0-45-generic</td>
                            <td>NVDIA Corporation GP104 [GeForce GTX 1080 Ti]</td>
                            <td>NVDIA UNIX x86_64 450.66</td>
                            <td>CUDA 11.0</td>
                            <td>40078 mb</td>
                        </tr>
                    </tbody>
                </table>
                
                <br /><br />
			</div>
			<!--contentwrapper-->
		</div>
		<!--centercontent-->
	</div>
	<!--bodywrapper-->
</body>
</html>