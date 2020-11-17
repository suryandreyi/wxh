<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-3.3.1.js"></script>
<title>Radial 布局参数变化</title>
<style>
::-webkit-scrollbar {
	display: none;
}

html, body {
	overflow: hidden;
	margin: 0;
}
</style>
</head>
<body>
	<div id="mountNode"></div>
	<script>document.body.clientHeight;</script>
	<script
		src="https://gw.alipayobjects.com/os/antv/pkg/_antv.g6-3.1.1/build/g6.js"></script>
	<script type="text/javascript">
$(function(){
	var addr = address+"/visualCass/topo_do";
	$.ajax({
		url : addr,
		dataType : "json",
		type : "post",
		async : false,
		success : function(data) { //如果请求成功，返回数据。
					  var graph = new G6.Graph({
					    container: 'mountNode',
					    width: window.innerWidth,
					    height: window.innerHeight,
					    modes: {
					      default: ['drag-canvas', 'drag-node']
					    },
					    layout: {
					      type: 'radial',
					      unitRadius: 150
					    },
					    animate: true,
					    defaultNode: {
					      size: [50, 50],
					      color: 'steelblue',
					      style: {
					        lineWidth: 2,
					        fill: '#fff'
					      }
					    },
					    defaultEdge: {
					      size: 1,
					      color: '#e2e2e2',
					    }
					  });
					  graph.data(data);
					  graph.render();
					  graph.on('node:click', function(evt) {
						  var node = evt.item;
						  var model = node.getModel();
						  var label = model.label
						  window.location.href=address+"/visualCass/shownode_do?nodeip="+label;
					  });
					  var descriptionDiv = document.createElement("div");
					  descriptionDiv.innerHTML = '集群结构';
					  var graphDiv = document.getElementById("mountNode");
					  document.body.insertBefore(descriptionDiv, graphDiv);
		}
	})
});
</script>
	<%@ include file="basic.jsp"%>
</body>
</html>
