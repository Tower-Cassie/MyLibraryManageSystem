<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*,java.sql.*" errorPage="" %>
<%@page import="cn.gldzkjdx.DAO.UserDAO" %>
<%@page import="cn.gldzkjdx.DAOImple.UserDAOImple" %>
<%@page import="cn.gldzkjdx.bean.User" %>
<%@page import="cn.gldzkjdx.util.Pagination" %>
<%@page import = "org.springframework.beans.factory.xml.XmlBeanFactory" %>
<%@page import = "org.springframework.core.io.ClassPathResource" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
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
     
    <div style="float:left">&nbsp;<h2><img src="images/hotel.png" width="32" width="68" />&nbsp;管&nbsp;理&nbsp;用&nbsp;户：</h2></div>
     <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
     <div style="float:left">
        </div>
    <% 
    XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("bean.xml"));
			UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
			final int pageSize = 5;//一页显示10条记录
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
				recordCount = userDAO.getRecordCount();
				pageCount = (recordCount + pageSize - 1)/pageSize;
				int startRecord = (pageNum - 1) * pageSize;//本页从startRecord行开始
				
				sql = "select * from user limit ?,?";//MYSQL使用limit实现分页
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mytest","root","19950219");//第二次查询
				preStmt = conn.prepareStatement(sql);//查询结果集
				preStmt.setObject(1,startRecord);
				preStmt.setObject(2,pageSize);
				rs = preStmt.executeQuery();
			
			
		%>
		<form action = "operatePerson.jsp" method = "get"> 
		<table bgcolor = "#CCCCCC" cellspacing = 1 cellpadding = 5 width = 100% border=2>
			<tr bgcolor = "#DDDDDD">
			
				<td align = "center">用户ID</td>
				<td align = "center">用户名</td>
				<td align = "center">用户密码</td>
				<td align = "center">用户类型</td>
				<td align = "center">   操作     </td>
			</tr>
			<%
					while(rs.next()){
			%>
			<tr bgcolor = "#FFFFFF">
				
				<td align = "center"><%=rs.getInt("user_id")%></td>
				<td align = "center"><%=rs.getString("user_name")%></td>
				<td align = "center"><%=rs.getString("user_paswd")%></td>
				<td align = "center"><%=rs.getString("user_type")%></td>
				<td align = "center"><a href='deleteUser.jsp?id=<%= rs.getInt("user_id")%>&username=<%=rs.getString("user_name")%>&userpaswd=<%=rs.getString("user_paswd")%>&usertype=<%=rs.getString("user_type")%>' onclick='return confirm("确定删除该记录？")'>删除</a>
				<a href='updateUser.jsp?id=<%= rs.getInt("user_id")%>&username=<%=rs.getString("user_name")%>&userpaswd=<%=rs.getString("user_paswd")%>&usertype=<%=rs.getString("user_type")%>'>修改</a>
				<!--<a href='addUser.jsp?id=<%= rs.getInt("user_id")%>'>添加</a>-->
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