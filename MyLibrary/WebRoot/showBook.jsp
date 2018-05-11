<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,java.sql.*" errorPage="" %>
<%@page import="cn.gldzkjdx.DAO.BookDAO" %>
<%@page import="cn.gldzkjdx.DAOImple.BookDAOImple" %>
<%@page import="cn.gldzkjdx.bean.Book" %>
<%@page import="cn.gldzkjdx.util.Pagination" %>
<%@page import = "org.springframework.beans.factory.xml.XmlBeanFactory" %>
<%@page import = "org.springframework.core.io.ClassPathResource" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>图书管理</title>
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
     <p>&nbsp;</p>
    <div style="float:left"><h2>&nbsp;<img src="images/hotel.png" width="32" width="68" />&nbsp;图&nbsp;书&nbsp;在&nbsp;库&nbsp;信&nbsp;息：</h2></div>
     <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
     <div style="float:left">
        </div>
    <% 
    XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("bean.xml"));
			BookDAO bookDAO = (BookDAO) factory.getBean("BookDAO");
			final int pageSize = 10;//一页显示10条记录
			int pageNum = 1;//当前页数，默认为1 
			int pageCount = 1;//总页数
			int recordCount = 0;//总记录数
			
			try{
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			}catch(Exception e){}
			String sql = null;
			Connection conn = null;
			PreparedStatement preStmt = null;//PreparedStatement对象
			ResultSet rs = null;
			
			try{
				recordCount = bookDAO.getRecordCount();
				pageCount = (recordCount + pageSize - 1)/pageSize;
				int startRecord = (pageNum - 1) * pageSize;//本页从startRecord行开始
				
				sql = "select * from book limit ?,?";//MYSQL使用limit实现分页
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","19950219");//第二次查询
				preStmt = conn.prepareStatement(sql);//查询结果集
				preStmt.setObject(1,startRecord);
				preStmt.setObject(2,pageSize);
				rs = preStmt.executeQuery();
			
			
		%>
		<form action = "operatePerson.jsp" method = "post"> 
		<table bgcolor = "#CCCCCC" cellspacing = 1 cellpadding = 5 width = 100% border=2>
			<tr bgcolor = "#DDDDDD">
			<!--<td ></td>-->
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
					while(rs.next()){
					int id = rs.getInt("book_id");
			%>
			<tr bgcolor = "#FFFFFF">
				<!--<td><input type = checkbox name = id value = "+id+"></td>-->
				<td align = "center"><%=rs.getInt("book_id")%></td>
				<td align = "center"><%=rs.getString("book_name")%></td>
				<td align = "center"><%=rs.getString("book_num")%></td>
				<td align = "center"><%=rs.getString("book_owner")%></td>
				<td align = "center"><%=rs.getString("book_source")%></td>
				<td align = "center"><%=rs.getString("book_status")%></td>
				<td align = "center"><%=rs.getString("book_type")%></td>
				<td align = "center"><a href='deleteBook.jsp?id=<%= rs.getInt("book_id")%>&bookname=<%=rs.getString("book_name") %>&booknum=<%=rs.getString("book_num") %>&bookowner=<%=rs.getString("book_owner") %>&booksource=<%=rs.getString("book_source") %>&booktype=<%=rs.getString("book_type") %>&bookstatus=<%=rs.getString("book_status") %>' onclick='return confirm("确定删除该记录？")'>删除</a>
				<a href='updateBook.jsp?id=<%= rs.getInt("book_id")%>&bookname=<%=rs.getString("book_name") %>&booknum=<%=rs.getString("book_num") %>&bookowner=<%=rs.getString("book_owner") %>&booksource=<%=rs.getString("book_source") %>&booktype=<%=rs.getString("book_type") %>&bookstatus=<%=rs.getString("book_status") %>'>修改</a>
			<!--	<a href = "addBook.jsp">添加</a>-->
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<p>&nbsp;</p>
		<!-- <table align = left>
			<tr>
				<td>
					<input type ="hidden" value = 'del' name = 'action'/>
					<a href = '#' onclick = "var array = document.getElementByName('id');for(var i = 0;i < array.length;i++){array[i].checked=true;}">全选</a>
					<a href = "#" onclick = "var array = document.getElementsByName('id');for(var i = 0; i < array.length;i++){array[i].checked = false;})">取消全选</a>
					<input type = "submit" onclick = "return confirm('即将删除所选择的记录。是否删除？');" value = "删除"/>
				</td>
			</tr>
		</table> -->
		<table align = right>
			<tr>
				<td>
					<%=Pagination.getPagination(pageNum,pageCount,recordCount,request.getRequestURL().toString(),pageSize) %>
				</td>
			</tr>
		</table>
		<br/><br/><br/>
		</form>
		<%}catch(Exception e){
			out.println("执行 SQL:" + sql +"时发生异常:" + e.getMessage());
			e.printStackTrace();
		} finally{
			if(rs != null) rs.close();
			if(preStmt != null) preStmt.close();
			if(conn != null) conn.close();
		}%>
</body>
</html>