<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" errorPage="" pageEncoding="UTF-8" %>
<%@page import="cn.gldzkjdx.DAO.BookDAO" %>
<%@page import="cn.gldzkjdx.DAOImple.BookDAOImple" %>
<%@page import="cn.gldzkjdx.bean.Book" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>
<link href="css/main.css" type="text/css" rel="stylesheet" />

</head>

<body>
<div id = "header">
    	<div id = "header_left"><img src="images/xh.png" width="108" height="90" float = "left"/></div>
		<!--<div id = "header_right" style="font-family:华文行楷">图书管理系统</div>-->
        <div id = "header_right">
        	<div id ="header_right_top"></div>
            <div id ="header_right_botton" style="font-family:华文行楷">图书管理系统</div>
        </div>
        <div id="header_botton">
        	 <div class = "menu"  style="font-family:华文楷体"> <a href="showBook.jsp">图书管理</a></div>
             <div class = "menu"  style="font-family:华文楷体"> <a href="manageuser.jsp">用户管理</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="addBook.jsp">添加图书</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="showBook2.jsp">查询图书</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="addUser.jsp">添加用户</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="FindUser.jsp">查询用户</a></div>
            <div class = "menu" style="font-family:华文楷体"> <a href="login.jsp">退出系统</a></div>
        </div>
    </div>
    <div style="float:left"><h2>&nbsp;<img src="images/hotel.png" width="32" width="68" />&nbsp;添&nbsp;加&nbsp;用&nbsp;户&nbsp;信&nbsp;息：</h2></div>
     <p>&nbsp;</p>
     <div style="float:left">
    <form action="addUser.action" method="post">
    <p>&nbsp;</p>
		     <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		       用户名</strong>：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		     <input height="1500" name="username" type="text"/></p> <p style="height:10px"></p>
                       <p>&nbsp;</p>
		      <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      用户密码</strong>：&nbsp;&nbsp;&nbsp;&nbsp;
		      <input name="userpaswd" type="password"/></p> <p style="height:10px"></p>
                       <p>&nbsp;</p>
		     <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		     用户类型</strong>：&nbsp;&nbsp;&nbsp;&nbsp;
		     <select name ="usertype">
		     		<option value = "管理员" >管理员 </option>
		     		<option value = "普通用户" selected = "selected">普通用户 </option>
		     	</select>
		     	<p style="height:10px"></p>
                       <p>&nbsp;</p>
		     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  style="font-family:华文楷体"   style="font-size:251px"   style="font-weight:bold" class = "form_login" type="submit" value ="添  加">
		</form>
        </div>
</body>
</html>