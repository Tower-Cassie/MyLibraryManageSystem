<%@page contentType="text/html;" language="java" import="java.sql.*" errorPage="" pageEncoding="UTF-8"%>
<%@page import="cn.gldzkjdx.DAO.BookDAO" %>
<%@page import="cn.gldzkjdx.DAOImple.BookDAOImple" %>
<%@page import="cn.gldzkjdx.bean.Book" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>归还图书</title>
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
        	 <div class = "menu"  style="font-family:华文楷体"> <a href="usermain.jsp">系统首页</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="findBook.jsp">借阅查询</a></div>
             <div class = "menu"  style="font-family:华文楷体"> <a href="returnBook.jsp">图书归还</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="usercenter.jsp">用户中心</a></div>
            <div class = "menu" style="font-family:华文楷体"> <a href="login.jsp">退出系统</a></div>
        </div>
    </div>
    <div style="float:left"><h2>&nbsp;<img src="images/hotel.png" width="32" width="68" />&nbsp;归&nbsp;还&nbsp;图&nbsp;书&nbsp;信&nbsp;息：</h2></div>
     <p>&nbsp;</p>
     <div style="float:left">
    <form action="returnBook.action" method="post">
    <p>&nbsp;</p>
		     <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图书书名</strong>：&nbsp;&nbsp;&nbsp;&nbsp;<input height="1500" name="bookname" type="text"/></p> <p style="height:10px"></p>
                       <p>&nbsp;</p>
		      <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图书编号</strong>：&nbsp;&nbsp;&nbsp;&nbsp;<input name="booknum" type="text"/></p> <p style="height:10px"></p>
                       <p>&nbsp;</p>
              <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图书归属者</strong>：<input name="bookowner" type="text"/></p> <p style="height:10px"></p>
		      <p>&nbsp;</p>
		     <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图书出版社</strong>：
		      <select name ="booksource">
		     		<option value = "清华大学出版社" selected = "selected">清华大学出版社 </option>
		     		<option value = "人民大学出版社">人民大学出版社 </option>
		     		<option value = "机械工业出版社">机械工业出版社 </option>
		     		<option value = "电子工业出版社">电子工业出版社 </option>
		     		<option value = "高等教育出版社">高等教育出版社 </option>
		     		<option value = "牛津大学出版社">牛津大学出版社 </option>
		     		<option value = "桂林电子科技大学出版社">桂林电子科技大学大学出版社 </option>
		     		<option value = "外研社">外研社 </option>
		     	</select>
		      <p style="height:10px"></p>
                       <p>&nbsp;</p>
		     <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图书类型</strong>：&nbsp;&nbsp;&nbsp;&nbsp;
		      <select name ="booktype">
		     		<option value = "计算机" selected = "selected">计算机 </option>
		     		<option value = "文学">文学 </option>
		     		<option value = "法律">法律 </option>
		     		<option value = "数学">数学 </option>
		     		<option value = "杂谈">杂谈 </option>
		     		<option value = "哲学">哲学</option>
		     		<option value = "英语">英语 </option>
		     		<option value = "地理">地理 </option> 
		     		<option value = "其他">其他 </option> 
		     	</select>
		      <p style="height:10px"></p>
                       <p>&nbsp;</p>
		     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  style="font-family:华文楷体"   style="font-size:251px"   style="font-weight:bold" class = "form_login" type="submit" value ="归  还">
		</form>
        </div>
</body>
</html>