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
        	 <div class = "menu"  style="font-family:华文楷体"> <a href="showBook.jsp">图书管理</a></div>
             <div class = "menu"  style="font-family:华文楷体"> <a href="manageuser.jsp">用户管理</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="addBook.jsp">添加图书</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="showBook2.jsp">查询图书</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="addUser.jsp">添加用户</a></div>
            <div class = "menu"  style="font-family:华文楷体"> <a href="FindUser.jsp">查询用户</a></div>
            <div class = "menu" style="font-family:华文楷体"> <a href="login.jsp">退出系统</a></div>
        </div>
    </div>
     
    <div style="float:left"><h2>&nbsp;<img src="images/hotel.png" width="32" width="68" />&nbsp;图&nbsp;书&nbsp;在&nbsp;库&nbsp;信&nbsp;息：</h2></div>
     <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
     <div style="float:left">
        </div>
       <form action = "showFindBook.jsp" method = "post"> 
        <fieldset style='width:80%'>
        	<legend>查询条件</legend>
        	<p>&nbsp;</p>
        		<p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> 图书书名</strong>：
            	<input type="text" name="bookname" id = "book"/></p>
                       <p style="height:10px"></p>
                     <p>&nbsp;</p>  
        	 <p align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input style="font-family:华文楷体"   style="font-size:15px" class = "form_login" type="submit" value = "提交查询" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<input style="font-family:华文楷体" style="font-size:15px" class = "form_login" type="reset" value = "复位" /></p>
        </fieldset>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
	</form>		
	
    <% 
    
            XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("bean.xml"));
			BookDAO bookDAO = (BookDAO) factory.getBean("BookDAO");
			final int pageSize = 5;//一页显示5条记录
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
			String bookname ="";//用于查询
			try{
				//bookname = request.getParameter("bookname").toString();
				//if(bookname == null)
					recordCount = bookDAO.getRecordCount();
				//else
					//recordCount = bookDAO.getRecordCountBybookname(bookname);			
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
					while(rs.next()){
					
			%>
			<tr bgcolor = "#FFFFFF">
				
				<td align = "center"><%=rs.getInt("book_id")%></td>
				<td align = "center"><%=rs.getString("book_name")%></td>
				<td align = "center"><%=rs.getString("book_num")%></td>
				<td align = "center"><%=rs.getString("book_owner")%></td>
				<td align = "center"><%=rs.getString("book_source")%></td>
				<td align = "center"><%=rs.getString("book_status")%></td>
				<td align = "center"><%=rs.getString("book_type")%></td>
					<td align = "center"><a href='deleteBook.jsp?id=<%= rs.getInt("book_id")%>&bookname=<%=rs.getString("book_name") %>&booknum=<%=rs.getString("book_num") %>&bookowner=<%=rs.getString("book_owner") %>&booksource=<%=rs.getString("book_source") %>&booktype=<%=rs.getString("book_type") %>&bookstatus=<%=rs.getString("book_status") %>' onclick='return confirm("确定删除该记录？")'>删除</a>
				<a href='updateBook.jsp?id=<%= rs.getInt("book_id")%>&bookname=<%=rs.getString("book_name") %>&booknum=<%=rs.getString("book_num") %>&bookowner=<%=rs.getString("book_owner") %>&booksource=<%=rs.getString("book_source") %>&booktype=<%=rs.getString("book_type") %>&bookstatus=<%=rs.getString("book_status") %>'>修改</a>
			
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<p>&nbsp;</p>
		
		<table align = right>
			<tr>
				<td>
					<%=Pagination.getPagination(pageNum,pageCount,recordCount,request.getRequestURL().toString(),pageSize) %>
				</td>
			</tr>
		</table>
		<br/><br/><br/>
		<%}catch(Exception e){
			out.println("执行 SQL:" + sql +"时发生异常:" + e.getMessage());
			e.printStackTrace();
		} finally{
			if(rs != null) rs.close();
			if(preStmt != null) preStmt.close();
			if(conn != null) conn.close();
		}%>
		
			<!-- <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong> 图书书名</strong>：
            	<input type="text" name="bookrname" /></p>
                       <p style="height:10px"></p>
                       <p>&nbsp;</p>
                       
                <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong> 图书编号</strong>：
            	<input type="text" name="booknum" /></p>
                       <p style="height:10px"></p>
                       <p>&nbsp;</p>
                 <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong> 图书出版社</strong>：
            	<input type="text" name="booksource" /></p>
                       <p style="height:10px"></p>
                       <p>&nbsp;</p>
                <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong> 图书用户</strong>：
            	<input type="text" name="bookowner" /></p>
                       <p style="height:10px"></p>
                       <p>&nbsp;</p>
                <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong> 图书状态</strong>：
            	<input type="text" name="bookstatus" /></p>
                       <p style="height:10px"></p>
                       <p>&nbsp;</p>
                 <p style="font-family:华文仿宋" style="font-size:64px" style="font-weight:200"><strong> 图书类型</strong>：
            	<input type="text" name="booktype" /></p>
                       <p style="height:10px"></p>
                       <p>&nbsp;</p>
                       String methodname = null;
                       var array = document.getElementsByName('name');
                       for(var i = 0; i < array.length;i++){
                       		if(array[i] != null){
                       			methodname = array[i];
                       			break;
                       		}
                       	}
                        -->
</body>
</html>