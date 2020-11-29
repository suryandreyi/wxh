<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>节点位置</title>
<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<script charset="utf-8" src="https://map.qq.com/api/gljs?v=1.exp&key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77"></script>
<script charset="utf-8" src="https://map.qq.com/api/js?v=2.exp&key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77"></script>
<style type="text/css">
    html,
    body {
        height: 100%;
        margin: 0px;
        padding: 0px;
    }

    #container {
        width: 100%;
        height: 100%;
    }

    #info {
        position: absolute;
        left: 30px;
        top: 30px;
        background: #FFF;
        width: 350px;
        height: 120px;
        padding: 10px;
        border-radius: 3px;
    }

    p,
    h4 {
        margin: 0;
        padding: 0;
        margin-bottom: 10px;
    }
    h4{
        margin-top: 30px;
    }
    #add {
        position: absolute;
        left:10px;
        top: 10px;
        z-index: 9999;
    }
    #remove{
        position: absolute;
        left: 120px;
        top: 10px;
        z-index: 9999;
    }
</style>
<body class="withvernav">
<script type="text/javascript">
</script>
<div class="bodywrapper">
    <%@ include file="top.jsp" %>
    <%@ include file="leftMenu.jsp" %>  
    <div class="centercontent">
        <div class="pageheader">
            <h1 class="pagetitle">集群位置</h1>
           	<br/>
                <div id="container"></div>
    <script>
        var txt = document.getElementById("txt");
        var markerID = document.getElementById("markerid");

        var position = document.getElementById("position");

        var center = new TMap.LatLng(32.731461,110.553136);//设置中心点坐标
        //初始化地图
        var map = new TMap.Map("container", {
			zoom: 5,
            center: center
        });

        //初始化marker
        var marker = new TMap.MultiMarker({
            id: 'marker-layer',
            map: map,
            styles: {
                "marker": new TMap.MarkerStyle({
                    "width": 25,
                    "height": 35,
                    "anchor": { x: 16, y: 32 },
                    "src": 'https://mapapi.qq.com/web/lbs/javascriptGL/demo/img/markerDefault.png'
                })
            },
            geometries: [{
                "id": "marker1",
                "styleId": 'marker',
                "position": new TMap.LatLng(39.981907,116.326666),
                "properties": {
                    "title": "marker1",
                    "dc": "数据中心1",
                    "address": "中科院计算所",
                    "seeds": {
                    	"ip": "202.189.3.235",
                    	"rack": "机架1"
                    }
                }
            }, {
                "id": "marker2",
                "styleId": 'marker',
                "position": new TMap.LatLng(40.061530,116.180140),
                "properties": {
                    "title": "marker2",
                    "dc": "数据中心2",
                    "address": "龙芯产业园",
                    "seeds": {
                    	"ip": "159.226.41.232",
                    	"rack": "机架1"
                    }
                }
            }, {
                "id": "marker3",
                "styleId": 'marker',
                "position": new TMap.LatLng(26.431228,118.081055),
                "properties": {
                    "title": "marker3",
                     "dc": "数据中心3",
                     "address": "无锡市",
                     "seeds": {
                        "ip": "36.153.113.4",
                        "rack": "机架1"
                     }
                }
            }, {
                "id": "marker4",
                "styleId": 'marker',
                "position": new TMap.LatLng(31.487236,120.297546),
                "properties": {
                    "title": "marker4",
                    "dc": "数据中心4",
                    "address": "厦门市",
                    "seeds": {
                    	"ip": "183.250.164.68",
                       	"rack": "机架1"
                    }
                }
               
            }

            ]
        });

        var infoWindow = new TMap.InfoWindow({
            map: map,
            position: new TMap.LatLng(39.981907,116.326666),
            offset: { x: 0, y: -32 } //设置信息窗相对position偏移像素，为了使其显示在Marker的上方
        });
        infoWindow.close();//初始关闭信息窗关闭
        //监听标注点击事件
        marker.on("mouseover", function (evt) {
            //设置infoWindow
            infoWindow.open(); //打开信息窗
            infoWindow.setPosition(evt.geometry.position);//设置信息窗位置
            infoWindow.setContent('<div style="text-align:center;white-space:nowrap;margin:10px;">'+'数据中心:'+evt.geometry.properties.dc.toString()+'</div>'+
            		'<div style="text-align:center;white-space:nowrap;margin:10px;">'+'地址:'+evt.geometry.properties.address.toString()+'</div>'+
            		'<div style="text-align:center;white-space:nowrap;margin:10px;">'+'节点ip:'+evt.geometry.properties.seeds.ip.toString()+'</div>'+
            		'<div style="text-align:center;white-space:nowrap;margin:10px;">'+'机架:'+evt.geometry.properties.seeds.rack.toString()+'</div>'
            );//设置信息窗内容
        })
        
        marker.on("mouseout", function (evt) {
            //设置infoWindow
            infoWindow.close();
        })
        
        
        
        
        
        
        
        
        
        
        
        var polyline = new TMap.MultiPolyline({
            id: 'polyline-layer',
            map: map,
            styles: {
                'green': new TMap.PolylineStyle({
                    'color': '#00FF00', //线填充色
                    'width': 6, //折线宽度
                    'borderWidth': 3, //边线宽度
                    'borderColor': '#CCC', //边线颜色
                    'lineCap': 'butt' //线端头方式
                }),
                'red': new TMap.PolylineStyle({
                    'color': '#FF0000', //线填充色
                    'width': 6,//折线宽度
                    'borderWidth': 3, //边线宽度
                    'borderColor': '#CCC', //边线颜色
                    'lineCap': 'butt' //线端头方式
                }),
                'yellow': new TMap.PolylineStyle({
                    'color': '#EEEE00', //线填充色
                    'width': 6,//折线宽度
                    'borderWidth': 3, //边线宽度
                    'borderColor': '#CCC', //边线颜色
                    'lineCap': 'butt' //线端头方式
                }),
                'pink': new TMap.PolylineStyle({
                    'color': '#FF69B4', //线填充色
                    'width': 6,//折线宽度
                    'borderWidth': 3, //边线宽度
                    'borderColor': '#CCC', //边线颜色
                    'lineCap': 'butt' //线端头方式
                })
            },
            geometries: [
                {
                    'id': 'polyline1',
                    'styleId': 'green',
                    'paths': [new TMap.LatLng(39.981907,116.326666), new TMap.LatLng(26.431228,118.081055)],
                    'properties': {
                        'distance': '998.2公里'
                    }
                },
                {
                    'id': 'polyline2',
                    'styleId': 'red',
                    'paths': [new TMap.LatLng(39.981907,116.326666), new TMap.LatLng(31.487236,120.297546)],
                    'properties': {
                        'distance': '1731.5公里'
                    }
                },
                {
                    'id': 'polyline3',
                    'styleId': 'yellow',
                    'paths': [new TMap.LatLng(26.431228,118.081055), new TMap.LatLng(31.487236,120.297546)],
                    'properties': {
                        'distance': '810.0公里'
                    }
                },
                {
                    'id': 'polyline4',
                    'styleId': 'pink',
                    'paths': [new TMap.LatLng(39.981907,116.326666), new TMap.LatLng(40.061530,116.180140)],
                    'properties': {
                        'distance': '15.5公里'
                    }
                }
            ]
        });
        
        
        polyline.on("mouseover", function (evt) {
            //设置infoWindow
            infoWindow.open(); //打开信息窗
            infoWindow.setPosition(evt.geometry.position);//设置信息窗位置
            infoWindow.setContent('<div style="text-align:center;white-space:nowrap;margin:10px;">'+'距离:'+evt.geometry.properties.distance.toString()+'</div>'
            );//设置信息窗内容
        })
        
        polyline.on("mouseout", function (evt) {
            //设置infoWindow
            infoWindow.close();
        })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    </script>
        </div><!--pageheader-->
        <br clear="all" />
	</div><!-- centercontent -->
</div><!--bodywrapper-->
</body>
</html>