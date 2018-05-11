<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,java.sql.*" errorPage="" %>
<%@page import="cn.gldzkjdx.DAO.BookDAO" %>
<%@page import="cn.gldzkjdx.DAO.UserDAO" %>
<%@page import="cn.gldzkjdx.DAOImple.BookDAOImple" %>
<%@page import="cn.gldzkjdx.bean.Book" %>
<%@page import="cn.gldzkjdx.bean.User" %>
<%@page import="cn.gldzkjdx.util.Pagination" %>
<%@page import = "org.springframework.beans.factory.xml.XmlBeanFactory" %>
<%@page import = "org.springframework.core.io.ClassPathResource" %>
<%@page import = "javax.servlet.http.*" %>
<%@page import = "javax.servlet.ServletContext" %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查询用户</title>
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
     
    <div style="float:left"><h2>&nbsp;<img src="images/hotel.png" width="32" width="68" />&nbsp;查&nbsp;询&nbsp;信&nbsp;息：</h2></div>
     <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
     <div style="float:left">
        </div>
    <% 
    
            XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("bean.xml"));
			UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
			 List<User> users = userDAO.FindUserByname(new String(request.getParameter("username").toString().getBytes("ISO-8859-1"),"UTF-8"));
			
		%>
		<table bgcolor = "#CCCCCC" cellspacing = 1 cellpadding = 5 width = 100% border=2>
			<tr bgcolor = "#DDDDDD">
			
				<td align = "center">用户ID号</td>
				<td align = "center">用户名</td>
				<td align = "center">用户密码</td>
				<td align = "center">用户类型</td>
				<td align = "center">   操作     </td>
			</tr>
			<%
				for(int i = 0; i < users.size(); i++) {
					User user=(User)users.get(i);
			%>
			<tr bgcolor = "#FFFFFF">
			
				<td align = "center" ><%=user.getUser_id()%></td>
				<td align = "center" name = 'bookname' ><%=user.getUser_name()%></td>
				<td align = "center" name = 'booknum'><%=user.getUser_paswd()%></td>
				<td align = "center" name = 'bookowner'><%=user.getUser_type()%></td>
				<td align = "center"><a href='deleteUser.jsp?id=<%=user.getUser_id()%>&username=<%=user.getUser_name()%>&userpaswd=<%=user.getUser_paswd()%>&usertype=<%=user.getUser_type()%>' onclick='return confirm("确定删除该记录？")'>删除</a>
				<a href='updateUser.jsp?id=<%= user.getUser_id()%>&username=<%=user.getUser_name()%>&userpaswd=<%=user.getUser_paswd()%>&usertype=<%=user.getUser_type()%>'>修改</a>
				
				</td>
			</tr>
			<%
				}
			%>
		</table>
</body>
</html>