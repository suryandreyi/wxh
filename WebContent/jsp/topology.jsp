<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%">
<head>
<meta charset="utf-8">
</head>
<body style="height: 100%; margin: 0">
	<div id="container" style="height: 100%"></div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
	<script type="text/javascript" 
		src="https://api.map.baidu.com/api?v=2.0&ak=8wM4W6uhvDdEfDSm3tp3mGEjwGKgp2vo"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
	<script src="js/jquery-3.3.1.js"></script>
	<%@ include file="../basic.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			var addr = address+"/visualCass/select_do";
			var dom = document.getElementById("container");
			var myChart = echarts.init(dom);
			var app = {};
			var ips = new Array();
			var racks = new Array();
			var datacenters = new Array();

			$.ajax({
				url : addr,
				dataType : "json",
				type : "post",
				async : false,
				success : function(data) { //如果请求成功，返回数据。
					$.each(data, function(i, item) {
						ips.push(item.ip);
						racks.push(item.rack);
						datacenters.push(item.data_center);
					})
					option = null;
					option = {
						title : {
							text : '集群结构'
						},
						tooltip : {},
						animationDurationUpdate : 1500,
						animationEasingUpdate : 'quinticInOut',
						series : [ {
							type : 'graph',
							layout : 'none',
							symbolSize : 50,
							roam : true,
							label : {
								show : true
							},
							edgeSymbol : [ 'circle', 'arrow' ],
							edgeSymbolSize : [ 4, 10 ],
							edgeLabel : {
								fontSize : 20
							},
							data : [ {
								name : datacenters[0],
								x : 300,
								y : 300
							}, {
								name : datacenters[1],
								x : 800,
								y : 300
							}, {
								name : datacenters[2],
								x : 550,
								y : 100
							}, {
								name : ips[0],
								x : 200,
								y : 300
							}, {
								name : ips[1],
								x : 900,
								y : 300
							}, {
								name : ips[2],
								x : 550,
								y : 20
							} ],
							// links: [],
							links : [ {
								source : datacenters[1],
								target : datacenters[0],
								lineStyle : {
									curveness : 0.2
								}
							}, {
								source : datacenters[0],
								target : datacenters[2],
								lineStyle : {
									curveness : 0.2
								}
							}, {
								source : datacenters[2],
								target : datacenters[1],
								lineStyle : {
									curveness : 0.2
								}
							}, {
								source : datacenters[2],
								target : datacenters[0],
								lineStyle : {
									curveness : -0.2
								}
							}, {
								source : datacenters[0],
								target : datacenters[1],
								lineStyle : {
									curveness : -0.2
								}
							}, {
								source : datacenters[1],
								target : datacenters[0],
								lineStyle : {
									curveness : 0.2
								}
							}, {
								source : datacenters[0],
								target : ips[0],
								lineStyle : {
									curveness : 0.2
								}
							}, {
								source : datacenters[1],
								target : ips[1],
								lineStyle : {
									curveness : 0.2
								}
							}, {
								source : datacenters[2],
								target : ips[2],
								lineStyle : {
									curveness : 0.2
								}
							} ],
							lineStyle : {
								opacity : 0.9,
								width : 2,
								curveness : 0
							}
						} ]
					};
					if (option && typeof option === "object") {
						myChart.setOption(option, true);
					}

				}
			})
		})
	</script>
</body>
</html>