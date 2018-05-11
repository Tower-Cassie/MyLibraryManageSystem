<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,java.sql.*" errorPage="" %>
<%@page import="cn.gldzkjdx.DAO.BookDAO" %>
<%@page import="cn.gldzkjdx.DAOImple.BookDAOImple" %>
<%@page import="cn.gldzkjdx.bean.Book" %>
<%@page import="cn.gldzkjdx.util.Pagination" %>
<%@page import = "org.springframework.beans.factory.xml.XmlBeanFactory" %>
<%@page import = "org.springframework.core.io.ClassPathResource" %>
<%@page import = "javax.servlet.http.*" %>
<%@page import = "javax.servlet.ServletContext" %>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查询图书</title>
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
     
    <div style="float:left"><h2><img src="images/hotel.png" width="32" width="68" />查询信息：</h2></div>
     <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
     <div style="float:left">
        </div>
    <% 
    
            XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("bean.xml"));
			BookDAO bookDAO = (BookDAO) factory.getBean("BookDAO");
			 List<Book> books = bookDAO.FindBookByName(new String(request.getParameter("bookname").toString().getBytes("ISO-8859-1"),"UTF-8"));
			
		%>
		<table bgcolor = "#CCCCCC" cellspacing = 1 cellpadding = 5 width = 100% border=2>
			<tr bgcolor = "#DDDDDD">
		
				<td align = "center">图书序列号</td>
				<td align = "center">图书的书名</td>
				<td align = "center">图书的编号</td>
				<td align = "center">图书归属者</td>
				<td align = "center">图书出版社</td>
				<td align = "center">图书的状态</td>
				<td align = "center">图书的类型</td>
				<td align = "center">   操作     </td>
			</tr>
			<%
				for(int i = 0; i < books.size(); i++) {
					Book book=(Book)books.get(i);
			%>
			<tr bgcolor = "#FFFFFF">
				
				<td align = "center" ><%=book.getBook_id()%></td>
				<td align = "center" name = 'bookname' ><%=book.getBook_name()%></td>
				<td align = "center" name = 'booknum'><%=book.getBook_num()%></td>
				<td align = "center" name = 'bookowner'><%=book.getBook_owner()%></td>
				<td align = "center" name = 'booksource'><%=book.getBook_source()%></td>
				<td align = "center" name = 'bookstatus'><%=book.getBook_status()%></td>
				<td align = "center" name = 'booktype'><%=book.getBook_type()%></td>
				<td align = "center"><a href='borrowBook.jsp?id=<%= book.getBook_id()%>&bookname=<%=book.getBook_name() %>&booknum=<%=book.getBook_num() %>&bookowner=<%=book.getBook_owner() %>&booksource=<%=book.getBook_source() %>&booktype=<%=book.getBook_type()%>&bookstatus=<%=book.getBook_status() %>' onclick='return confirm("确定借阅该图书？")'>借阅图书</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
</body>
</html>