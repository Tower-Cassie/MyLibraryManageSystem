<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书管理系统</title>
<link href="css/login.css" type="text/css" rel="stylesheet" />
</head>
-
<body>
	<div id = "header">
    	<!-- <div id = "head_top"><img src="images/xh.png" width="508" height="119"> </div> -->
        <div id = "head_middle" style="font-family:华文行楷"><img src="images/xh.png" width="108" height="90" />图书管理系统</div>
        <div id = "head_button"> ___________________________________________________________________________________________________________________________________________________________________________________________________________________</div>  
    </div>
    <div id = "body" >
    	<div id = "body_left"><img src="images/school.jpg" width="720" height="300"></div>
        <div id = "body_middle"></div>
        <div id = "body_right">
        <div></div>
        	<form action="login.action" method="post">
       			<p>&nbsp;</p>
            	<p>&nbsp;</p>
                <p>&nbsp;</p>
            	<p>&nbsp;</p>
                <p>&nbsp;</p>
            	<p>&nbsp;</p>
            	<p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong> 用户名</strong>：
            	<input type="text" name="username" /></p>
                       <p style="height:10px"></p>
                       <p>&nbsp;</p>
                <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong>密&nbsp;&nbsp;&nbsp;&nbsp; 码</strong>：<input type="password" name="userpwd" /></p>
             
            
            	<p>&nbsp;</p>
                <p align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="font-family:华文楷体"   style="font-size:15px" class = "form_login" type="submit" value = "登录" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<input style="font-family:华文楷体" style="font-size:15px" class = "form_login" type="reset" value = "取消" /></p>
            </form>
       </div>
    </div>
    <div id = "foot">
    <p>&nbsp;</p>
    <p align="center"  style="font-family:华文楷体"><strong>Copyright 2013-2020 版权所有   个人网页网站</strong></p>
<p align="center"  style="font-family:华文楷体"><strong>建议使用IE5.0及以上版本   分辨率在1024*678及以上版权</strong></p>
    </div>
</body>
</html>