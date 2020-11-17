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
<script type="text/javascript">
var formData = new FormData();
for(var i=0;i<$("#file")[0].files.length;i++) {  //循环获取上传个文件
    formData.append("file", $("#file")[0].files[i]);
}
formData.append("bid",bid);//此处可以添加一个参数和图片一起上传
$.ajax({
    "url": "addBillAcc",
    "data" : formData,
    "dataType":"json",
    "type": "post",
    "contentType" : false, //上传文件一定要是false
    "processData":false,
    "success" : function(obj) {
		if (obj.state == 1) {
		layer.alert("上传成功！");
		}else{
			layer.alert(obj.message);
		}
	}
});
</script>
</head>
<body>

			<div class="item">
				<span>上传附件</span>
				<input type="file" name="files" class="form-control" id="file" multiple="multiple" />
             </div>      


</body>
</html>
